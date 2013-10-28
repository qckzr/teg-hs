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

/**
 *
 * @author sam
 */
public class LogicaAplicacion {

    private static LogicaAplicacion instancia = null;
    private LibreriaMensajes libreriaMensajes;
    private int puertoAgente;
    private DatosAplicacion datosAplicacion;
    private URL url;
    

    private LogicaAplicacion(LibreriaMensajes libreriaMensajes, 
            DatosAplicacion datosAplicacion,int puertoAgente, String ipServidor) {
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        iniciar(ipServidor);
    }

    public LibreriaMensajes getLibreriaMensajes() {
        return libreriaMensajes;
    }

    public void setLibreriaMensajes(LibreriaMensajes libreriaMensajes) {
        this.libreriaMensajes = libreriaMensajes;
    }

    public int getPuertoAgente() {
        return puertoAgente;
    }

    public void setPuertoAgente(int puertoAgente) {
        this.puertoAgente = puertoAgente;
    }

    public DatosAplicacion getDatosAplicacion() {
        return datosAplicacion;
    }

    public void setDatosAplicacion(DatosAplicacion datosAplicacion) {
        this.datosAplicacion = datosAplicacion;
    }

    public URL getUrl() {
        return url;
    }

    public void setUrl(URL url) {
        this.url = url;
    }
    
    
    
    /**
     * Singleton
     * @param libreriaMensajes
     * @param datosAplicacion
     * @param puertoAgente
     * @param ipServidor
     * @return 
     */
    public static LogicaAplicacion getInstancia(LibreriaMensajes libreriaMensajes, 
            DatosAplicacion datosAplicacion,int puertoAgente, String ipServidor){
        if (instancia == null){
            instancia = new LogicaAplicacion(libreriaMensajes,
                    datosAplicacion, puertoAgente, ipServidor);
        }
        return instancia;
    }
    
    /**
     * Método que permite chequear el mensaje recibido para decidir si pertenece
     * al agente de configuración, al módulo de ciclo de vida o a un nodo.
     * @param mensaje El mensaje recibido.
     * @return True si pertence al agente. False en caso contrario.
     */
    public boolean verificarMensajeRecibido(Mensaje mensaje){
        
        switch (mensaje.getMensaje()){
            case "aplicacion": 
                if (libreriaMensajes.enviarMensaje(datosAplicacion.
                        getNombreAplicacion(),"localhost", puertoAgente)) {
                    return true;
                }
                break;
            case "nodo":
                if (libreriaMensajes.enviarMensaje(datosAplicacion.
                        getNumeroNodoAplicacion(),"localhost",puertoAgente)) {
                    return true;
                }
                break;
            default:{
                
                System.out.println("Se ha recibido el mensaje: \""
                        +mensaje.getMensaje()+"\" proveniente del host: "
                        +mensaje.getIpOrigen());
                evaluarMensaje(mensaje);
                
            }
        };
        return false;
    }
     
    /**
     * Método que permite enviar el número de proceso al servidor central.
     * @param ipServidor 
     */
    public void enviarId(String ipServidor){
        libreriaMensajes.enviarMensaje("id<"
                +datosAplicacion.getIdProceso(),ipServidor);
    }
    
    /**
     * Método que permite evaluar el mensaje enviado por el usuario para consumir
     * un servicio específico del servidor.
     * @param mensaje El mensaje con la operación a consumir.
     * @return True si se envió una operación valida. False en caso contrario.
     */
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
            else {
                return false;
            }
    }
    
    
    /**
     * Método que permite definir la url donde se encuentra ubicado el servicio
     * web.
     * @param ipServidor La dirección web del servidor que contiene el servicio.
     */
    public final void iniciar(String ipServidor){
        try {
            url = new URL("http://"+ipServidor+":8080/REST_Servidor/resources/");
        } catch (MalformedURLException ex) {
            Logger.getLogger(LogicaAplicacion.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
             
    }
    
    /**
     * Método que permite consumir el servicio web a través de la url.
     * @param mensaje El servicio a consumir.
     * @return True si se pudo consumir. False en caso contrario.
     */
    public boolean consumir(String mensaje){
        HttpURLConnection conn = null;
        URL urlNueva;
        BufferedReader br;
        String output;
        try {
            urlNueva =  new URL(url.toString()+mensaje);
        
            conn = (HttpURLConnection) urlNueva.openConnection();
            conn.setRequestMethod("GET");

            if (conn.getResponseCode() != 200) {
                    throw new RuntimeException("Failed : HTTP error code : "
                                    + conn.getResponseCode());
            }
            br = new BufferedReader(new InputStreamReader(
                    (conn.getInputStream())));
            
            while ((output = br.readLine()) != null) {
                    System.out.println(output);
                    libreriaMensajes.enviarMensaje(output);
            }
            conn.disconnect();
            return true;
        } catch (IOException ex) {
            Logger.getLogger(LogicaAplicacion.class.getName()).
                    log(Level.SEVERE, null, ex);
            return false;
        } 
    }
    
    
  
   

    
    
   
}
