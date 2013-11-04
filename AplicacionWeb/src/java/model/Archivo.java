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
 * Clase que permite gestionar los mensajes recibidos para visualizarlos en el
 * módulo de monitoreo.
 * @author Héctor Sam
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

    public Archivo(String ruta,ArrayList<String> nombresArchivoMensajes,
            ArrayList<String> nombresArchivoAgentes, int port, 
            String idAplicacion) {
        libreriaMensajes = new LibreriaMensajes(port);
        this.nombresArchivoMensajes = nombresArchivoMensajes;
        this.ruta = ruta;
        this.port = port;
        this.nombresArchivoAgentes = nombresArchivoAgentes;
        this.idAplicacion = idAplicacion;
        crearArchivos(ruta);
        conexionBD = new ConexionBD();
    }

    public Archivo() {
    }

    public boolean isControl() {
        return control;
    }

    public void setControl(boolean control) {
        this.control = control;
    }

    public LibreriaMensajes getLibreriaMensajes() {
        return libreriaMensajes;
    }

    public void setLibreriaMensajes(LibreriaMensajes libreriaMensajes) {
        this.libreriaMensajes = libreriaMensajes;
    }

    public String getRuta() {
        return ruta;
    }

    public void setRuta(String ruta) {
        this.ruta = ruta;
    }

    public int getPort() {
        return port;
    }

    public void setPort(int port) {
        this.port = port;
    }

    public ArrayList<String> getNombresArchivoMensajes() {
        return nombresArchivoMensajes;
    }

    public void setNombresArchivoMensajes(ArrayList<String> nombresArchivoMensajes) {
        this.nombresArchivoMensajes = nombresArchivoMensajes;
    }

    public ArrayList<String> getNombresArchivoAgentes() {
        return nombresArchivoAgentes;
    }

    public void setNombresArchivoAgentes(ArrayList<String> nombresArchivoAgentes) {
        this.nombresArchivoAgentes = nombresArchivoAgentes;
    }

    public String getIdAplicacion() {
        return idAplicacion;
    }

    public void setIdAplicacion(String idAplicacion) {
        this.idAplicacion = idAplicacion;
    }

    public ConexionBD getConexionBD() {
        return conexionBD;
    }

    public void setConexionBD(ConexionBD conexionBD) {
        this.conexionBD = conexionBD;
    }
    
    
    
    
    @Override
    public void run(){
        Mensaje mensaje;
        InformacionAgente informacionAgente;
        
        while (control){
             if (libreriaMensajes.ultimoMensaje() != null){
               
            mensaje = libreriaMensajes.ultimoMensaje();
            System.out.println("mensaje recibido: "+mensaje.getMensaje());
            if (mensaje.getMensaje().contains("~_Eliminar")){
                LibreriaMensajes.getHiloDeEscucha().kill();
                kill();
            } else{
                agregarMensaje(mensaje, retornarNodo(mensaje.getIpOrigen()));
            }
            libreriaMensajes.eliminarMensaje(mensaje);
                    
        }
        if (libreriaMensajes.ultimoMensajeAgente() != null){
            informacionAgente = libreriaMensajes.ultimoMensajeAgente();
            agregarMensaje(informacionAgente,retornarNodo(
                    informacionAgente.getDireccionIp()));
            libreriaMensajes.eliminarMensaje(informacionAgente);
                
        }
           
        }
    }
    
    
    
    /**
     * Método que permite matar el hilo de ejecución.
     */
    public void kill(){
        control = false;
        
    }
    
    
    /**
     * Método que permite crear los archivos XML de mensajes y agentes en la
     * ruta indicada.
     * @param ruta La ruta donde se crearán los archivos.
     * @return True si los archivos fueron creados. False en caso contrario.
     */
    public boolean crearArchivos(String ruta){
        Element mensajes;
        Document doc;
        XMLOutputter xmlOutput;
        Element agente;
        try {
            for (String nombreArchivo : nombresArchivoMensajes) {
                mensajes = new Element("mensajes");
                doc = new Document();
                doc.setRootElement(mensajes);
                xmlOutput = new XMLOutputter();
                xmlOutput.setFormat(Format.getPrettyFormat());
                xmlOutput.output(doc, new FileWriter(ruta+nombreArchivo));
            }
            
            for (String nombreArchivo : nombresArchivoAgentes) {
                agente = new Element("agente");
                doc = new Document();
                doc.setRootElement(agente);
                xmlOutput = new XMLOutputter();
                xmlOutput.setFormat(Format.getPrettyFormat());
                xmlOutput.output(doc, new FileWriter(ruta+nombreArchivo));
            }
            
            return true;
        } catch (IOException ex) {
            Logger.getLogger(Archivo.class.getName()).
                    log(Level.SEVERE, null, ex);
            return false;
        }
        
    }
    
    /**
     * Método que permite agregar un mensaje recibido al archivo local.
     * @param mensajeRecibido El mensaje recibido.
     * @param idNodo El id del nodo del cual se recibió el mensaje.
     * @return True si el mensaje fue agregado. False en caso contrario.
     */
    public boolean agregarMensaje(Mensaje mensajeRecibido,String idNodo){
        
        Element mensaje;
        SAXBuilder builder;
        Document doc;
        XMLOutputter xmlOutput;
        try {
            mensaje = new Element("mensaje");
            mensaje.addContent(new Element("fecha").setText(
                    mensajeRecibido.getFecha()));
            mensaje.addContent(new Element("hora").setText(
                    mensajeRecibido.getHora()));
            mensaje.addContent(new Element("texto").setText(
                    mensajeRecibido.getMensaje()));
            mensaje.addContent(new Element("ipOrigen").setText(
                    mensajeRecibido.getIpOrigen()));
       
            builder = new SAXBuilder();
            
            doc =  builder.build(ruta+nombreArchivo(idNodo));
            xmlOutput = new XMLOutputter();
            doc.getRootElement().addContent(mensaje);
            xmlOutput.setFormat(Format.getPrettyFormat());
            xmlOutput.output(doc, new FileWriter(ruta+nombreArchivo(idNodo)));
            return true;
        } catch (JDOMException ex) {
            Logger.getLogger(Archivo.class.getName()).
                    log(Level.SEVERE, null, ex);
            return false;
        
        } catch (IOException ex) {
            Logger.getLogger(Archivo.class.getName()).
                    log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    /**
     * Método que permite agregar un mensaje del agente al archivo local.
     * @param mensajeRecibido El mensaje del agente recibido.
     * @param idNodo El id del nodo donde se encuentra el agente.
     * @return True si el mensaje fue agregado. False en caso contrario.
     */
    public boolean agregarMensaje(InformacionAgente mensajeRecibido,String idNodo){
        SAXBuilder builder;
        Document doc;
        XMLOutputter xmlOutput;
        try {
            crearArchivoAgente(nombreArchivoAgente(idNodo));
            Element mensaje = new Element("mensaje");
            mensaje.addContent(new Element("aplicacionActiva").setText(
                    mensajeRecibido.getAplicacionActiva()));
            mensaje.addContent(new Element("direccionIp").setText(
                    mensajeRecibido.getDireccionIp()));
            mensaje.addContent(new Element("idProceso").setText(
                    mensajeRecibido.getIdProceso()));
            mensaje.addContent(new Element("memoriaDisponible").setText(
                    mensajeRecibido.getMemoriaDisponible()));
            mensaje.addContent(new Element("numeroNodo").setText(
                    mensajeRecibido.getNumeroNodo()));
            mensaje.addContent(new Element("procesosActivos").setText(
                    mensajeRecibido.getProcesosActivos()));
            mensaje.addContent(new Element("puertosDisponibles").setText(
                    mensajeRecibido.getPuertosDisponibles()));
            mensaje.addContent(new Element("usoCpu").setText(
                    mensajeRecibido.getUsoCpu()));
       
            builder = new SAXBuilder();
            doc =  builder.build(ruta+nombreArchivoAgente(idNodo));
            xmlOutput = new XMLOutputter();
            doc.getRootElement().addContent(mensaje);
            xmlOutput.setFormat(Format.getPrettyFormat());
            xmlOutput.output(doc, new FileWriter(ruta+nombreArchivoAgente(idNodo)));
            return true;
        } catch (JDOMException ex) {
            Logger.getLogger(Archivo.class.getName()).
                    log(Level.SEVERE, null, ex);
            return  false;
        
        } catch (IOException ex) {
            Logger.getLogger(Archivo.class.getName()).
                    log(Level.SEVERE, null, ex);
            return false;
        
                
        }
    }
    
    
    /**
     * Método que retonra el id del nodo asociado a la dirección ip.
     * @param ipOrigen La dirección ip del nodo a buscar.
     * @return El id del nodo o vacío si no fue encontrado.
     */
    public String retornarNodo(String ipOrigen){
        String idNodo = "";
        ResultSet resultSet;
        try {
            resultSet = conexionBD.consultarRegistro("select id from nodos "
                    + "where ip='"+ipOrigen+"'");
            idNodo = resultSet.getString(1);
        } catch (SQLException ex) {
            Logger.getLogger(Archivo.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return idNodo;
        
    }
    
    /**
     * Método que permite buscar el nombre del archivo de monitoreo dentro de la 
     * lista de nombres local.
     * @param idNodo El id del nodo a asociar con el archivo
     * @return El nombre del archivo o vacío si no se encontró.
     */
    public String nombreArchivo (String idNodo){
        for (String string : nombresArchivoMensajes) {
            if (string.contentEquals("archivo"+idNodo+".xml"))
                return string;
        }
        return "";
    }
    
    /**
     * Método que permite buscar el nombre del archivo agente dentro de la 
     * lista de nombres local.
     * @param idNodo El id del nodo a asociar del agente.
     * @return El nombre del archivo del agente o vacío si no se encontró.
     */
    public String nombreArchivoAgente (String idNodo){
        for (String string : nombresArchivoAgentes) {
            if (string.contentEquals("agente"+idNodo+".xml"))
                return string;
        }
        return "";
    }
    
    /**
     * Método que permite crear un archivo XML dirigido al agente.
     * @param nombreArchivo el nombre del archivo a crear.
     * @return True si el archivo fue creado. False en caso contrario.
     */
    public boolean crearArchivoAgente(String nombreArchivo){
        Element agente;
        Document doc;
        XMLOutputter xmlOutput;
        try {
            agente = new Element("agente");
            doc = new Document();
            doc.setRootElement(agente);
            xmlOutput = new XMLOutputter();
            xmlOutput.setFormat(Format.getPrettyFormat());
            xmlOutput.output(doc, new FileWriter(ruta+nombreArchivo));
            return true;
        } catch (IOException ex) {
            Logger.getLogger(Archivo.class.getName()).
                    log(Level.SEVERE, null, ex);
            return false;
        }
    }
}
