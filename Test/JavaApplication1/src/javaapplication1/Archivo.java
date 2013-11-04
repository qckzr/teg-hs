/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;
import agente.InformacionAgente;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;


/**
 *
 * @author sam
 */
public class Archivo extends Thread{
    
    
    private boolean control = true;
    
    private LibreriaMensajes libreriaMensajes;
    private String ruta = "";
    private int port;
    private ArrayList<String> nombresArchivoMensajes;
    private ArrayList<String> nombresArchivoAgentes;
    String idAplicacion="";
    private ConexionBD conexionBD;

    public Archivo(String ruta,ArrayList<String> nombresArchivoMensajes,ArrayList<String> nombresArchivoAgentes, int port, String idAplicacion) {
        libreriaMensajes = new LibreriaMensajes(port);
        this.nombresArchivoMensajes = nombresArchivoMensajes;
        this.ruta = ruta;
        this.port = port;
        this.nombresArchivoAgentes = nombresArchivoAgentes;
        this.idAplicacion = idAplicacion;
        crearArchivo(ruta);
        conexionBD = new ConexionBD();
    }
    
    
    
    @Override
    public void run(){
        
        while (control){
            
            if (libreriaMensajes.ultimoMensaje() != null){
               
                    Mensaje mensaje = libreriaMensajes.ultimoMensaje();
                    System.out.println("mensaje recibido: "+mensaje.getMensaje());
                    if (mensaje.getMensaje().contains("~_Eliminar")){
                        LibreriaMensajes.getHiloDeEscucha().kill();
                        kill();
                    }
                    else{
                        agregarMensaje(mensaje, retornarNodo(mensaje.getIpOrigen()));
                    }
                    libreriaMensajes.eliminarMensaje(mensaje);
                    
               
                
            }
            if (libreriaMensajes.ultimoMensajeAgente()!=null){
                InformacionAgente informacionAgente = libreriaMensajes.ultimoMensajeAgente();
                agregarMensaje(informacionAgente,retornarNodo(informacionAgente.getDireccionIp()));
                libreriaMensajes.eliminarMensaje(informacionAgente);
                
            }
            
        }
    }
    
    
    public void kill(){
        control = false;
     //   this.libreriaMensajes.getHiloDeEscucha().kill();
        
    }
    
    
    public void crearArchivo(String ruta){
        try {
            for (String nombreArchivo : nombresArchivoMensajes) {
                Element mensajes = new Element("mensajes");
                Document doc = new Document();
                doc.setRootElement(mensajes);
                XMLOutputter xmlOutput = new XMLOutputter();
                xmlOutput.setFormat(Format.getPrettyFormat());
                xmlOutput.output(doc, new FileWriter(ruta+nombreArchivo));
            }
            
            for (String nombreArchivo : nombresArchivoAgentes) {
                Element agente = new Element("agente");
                Document doc = new Document();
                doc.setRootElement(agente);
                XMLOutputter xmlOutput = new XMLOutputter();
                xmlOutput.setFormat(Format.getPrettyFormat());
                xmlOutput.output(doc, new FileWriter(ruta+nombreArchivo));
            }
            
     
        } catch (IOException ex) {
            Logger.getLogger(Archivo.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    public void agregarMensaje(Mensaje mensajeRecibido,String idNodo){
        try {
            Element mensaje = new Element("mensaje");
            mensaje.addContent(new Element("fecha").setText(mensajeRecibido.getFecha()));
            mensaje.addContent(new Element("hora").setText(mensajeRecibido.getHora()));
            mensaje.addContent(new Element("texto").setText(mensajeRecibido.getMensaje()));
            mensaje.addContent(new Element("ipOrigen").setText(mensajeRecibido.getIpOrigen()));
       
            SAXBuilder builder = new SAXBuilder();
            
            Document doc =  builder.build(ruta+nombreArchivo(idNodo));
            XMLOutputter xmlOutput = new XMLOutputter();
            doc.getRootElement().addContent(mensaje);
            xmlOutput.setFormat(Format.getPrettyFormat());
            xmlOutput.output(doc, new FileWriter(ruta+nombreArchivo(idNodo)));
            
        } catch (JDOMException ex) {
            Logger.getLogger(Archivo.class.getName()).log(Level.SEVERE, null, ex);
        
        } catch (IOException ex) {
            Logger.getLogger(Archivo.class.getName()).log(Level.SEVERE, null, ex);
        
                
        }
    }
    
    public void agregarMensaje(InformacionAgente mensajeRecibido,String idNodo){
        try {
            crearArchivoAgente(nombreArchivoAgente(idNodo));
            Element mensaje = new Element("mensaje");
            mensaje.addContent(new Element("aplicacionActiva").setText(mensajeRecibido.getAplicacionActiva()));
            mensaje.addContent(new Element("direccionIp").setText(mensajeRecibido.getDireccionIp()));
            mensaje.addContent(new Element("idProceso").setText(mensajeRecibido.getIdProceso()));
            mensaje.addContent(new Element("memoriaDisponible").setText(mensajeRecibido.getMemoriaDisponible()));
            mensaje.addContent(new Element("numeroNodo").setText(mensajeRecibido.getNumeroNodo()));
            mensaje.addContent(new Element("procesosActivos").setText(mensajeRecibido.getProcesosActivos()));
            mensaje.addContent(new Element("puertosDisponibles").setText(mensajeRecibido.getPuertosDisponibles()));
            mensaje.addContent(new Element("usoCpu").setText(mensajeRecibido.getUsoCpu()));
       
            SAXBuilder builder = new SAXBuilder();
            Document doc =  builder.build(ruta+nombreArchivoAgente(idNodo));
            XMLOutputter xmlOutput = new XMLOutputter();
            doc.getRootElement().addContent(mensaje);
            xmlOutput.setFormat(Format.getPrettyFormat());
            xmlOutput.output(doc, new FileWriter(ruta+nombreArchivoAgente(idNodo)));
            
        } catch (JDOMException ex) {
            Logger.getLogger(Archivo.class.getName()).log(Level.SEVERE, null, ex);
        
        } catch (IOException ex) {
            Logger.getLogger(Archivo.class.getName()).log(Level.SEVERE, null, ex);
        
                
        }
    }
    
    public String retornarNodo(String ipOrigen){
        String idNodo = "";
        try {
            ResultSet rs = conexionBD.consultarRegistro("select id from nodos where ip='"+ipOrigen+"'");
            idNodo = rs.getString(1);
        } catch (SQLException ex) {
            Logger.getLogger(Archivo.class.getName()).log(Level.SEVERE, null, ex);
        }
        return idNodo;
        
    }
    
    public String nombreArchivo (String idNodo){
        for (String string : nombresArchivoMensajes) {
            if (string.contentEquals("archivo"+idNodo+".xml"))
                return string;
        }
        return "";
    }
    
    public String nombreArchivoAgente (String idNodo){
        for (String string : nombresArchivoAgentes) {
            if (string.contentEquals("agente"+idNodo+".xml"))
                return string;
        }
        return "";
    }
    
    public void crearArchivoAgente(String nombreArchivo){
        try {
            Element agente = new Element("agente");
                       Document doc = new Document();
                       doc.setRootElement(agente);
                       XMLOutputter xmlOutput = new XMLOutputter();
                       xmlOutput.setFormat(Format.getPrettyFormat());
                       xmlOutput.output(doc, new FileWriter(ruta+nombreArchivo));
        } catch (IOException ex) {
            Logger.getLogger(Archivo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
