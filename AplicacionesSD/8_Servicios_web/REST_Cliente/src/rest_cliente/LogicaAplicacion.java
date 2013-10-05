/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package rest_cliente;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.namespace.QName;
import javax.xml.ws.Service;

/**
 *
 * @author sam
 */
public class LogicaAplicacion {

    private LibreriaMensajes libreriaMensajes;
    private int puertoAgente;
    private DatosAplicacion datosAplicacion;
    private URL url;
    

    public LogicaAplicacion(LibreriaMensajes libreriaMensajes, DatosAplicacion datosAplicacion,int puertoAgente, String ipServidor) {
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        iniciar(ipServidor);
        
        
    }
    
    public boolean verificarMensajeRecibido(Mensaje mensaje){
        
        switch (mensaje.getMensaje()){
            case "aplicacion": 
                if (libreriaMensajes.enviarMensaje(datosAplicacion.getNombreAplicacion(),"localhost", puertoAgente))
                    return true;
                break;
            case "nodo":
                if (libreriaMensajes.enviarMensaje(datosAplicacion.getNumeroNodoAplicacion(),"localhost",puertoAgente))
                    return true;
                break;
            default:{
                
                System.out.println("Se ha recibido el mensaje: \""+mensaje.getMensaje()+"\" proveniente del host: "+mensaje.getIpOrigen());
                evaluarMensaje(mensaje);
                
            }
        };
        return false;
    }
     
    public void enviarId(String ipServidor){
        libreriaMensajes.enviarMensaje("id<"+datosAplicacion.getIdProceso(),ipServidor);
    }
    
    public boolean evaluarMensaje(Mensaje mensaje){
        libreriaMensajes.enviarMensaje("Mensaje recibido: "+mensaje.getMensaje());
            if (mensaje.getMensaje().contains("mensaje:")){
                consumir("saludo");
                return true;
            }
            else if (mensaje.getMensaje().contains("hora:")){
                consumir("hora");
                return true;
            }
            else if (mensaje.getMensaje().contains("fecha:")){
                consumir("fecha");
                return true;
            }
            else
                return false;
    }
    
    
    public final void iniciar(String ipServidor){
        try {
            url = new URL("http://"+ipServidor+":8080/REST_Servidor/resources/");
        } catch (MalformedURLException ex) {
            Logger.getLogger(LogicaAplicacion.class.getName()).log(Level.SEVERE, null, ex);
        }
             
    }
    
    
    public void consumir(String mensaje){
        HttpURLConnection conn = null;
        try {
            URL urlNueva =  new URL(url.toString()+mensaje);
        
            conn = (HttpURLConnection) urlNueva.openConnection();
            conn.setRequestMethod("GET");

            if (conn.getResponseCode() != 200) {
                    throw new RuntimeException("Failed : HTTP error code : "
                                    + conn.getResponseCode());
            }
            BufferedReader br = new BufferedReader(new InputStreamReader(
                    (conn.getInputStream())));
            String output;
            while ((output = br.readLine()) != null) {
                    System.out.println(output);
                    libreriaMensajes.enviarMensaje(output);
            }
            conn.disconnect();
        } catch (IOException ex) {
            Logger.getLogger(LogicaAplicacion.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }
    
    
  
   

    
    
   
}
