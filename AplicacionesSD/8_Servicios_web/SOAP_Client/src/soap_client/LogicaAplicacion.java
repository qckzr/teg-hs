/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package soap_client;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.namespace.QName;
import javax.xml.ws.Service;
import soap_server.MensajesServicio;

/**
 * Clase que implementa la lógica de la aplicación para el tópico SOAP - Cliente
 * @author Héctor Sam.
 */
public class LogicaAplicacion {

    private static LogicaAplicacion instancia = null;
    private LibreriaMensajes libreriaMensajes;
    private int puertoAgente;
    private DatosAplicacion datosAplicacion;
    private URL url;
    private Service service;
    private MensajesServicio mensajesServicio;
    

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

    public Service getService() {
        return service;
    }

    public void setService(Service service) {
        this.service = service;
    }

    public MensajesServicio getMensajesServicio() {
        return mensajesServicio;
    }

    public void setMensajesServicio(MensajesServicio mensajesServicio) {
        this.mensajesServicio = mensajesServicio;
    }
    
    
    
    /**
     * Singleton.
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
        libreriaMensajes.enviarMensaje("id<"+datosAplicacion.
                getIdProceso(),ipServidor);
    }
    
    /**
     * Método que permite evaluar el mensaje enviado por el usuario para enviar
     * la instrucción al servicio web.
     * @param mensaje El mensaje a evaluar con el servicio que se quiere consumir.
     * @return True si se envió una instrucción valida. False en caso contrario.
     */
    public boolean evaluarMensaje(Mensaje mensaje){
        libreriaMensajes.enviarMensaje("Mensaje recibido: "+mensaje.getMensaje());
        String mensajeAconsumir;
            if (mensaje.getMensaje().contains("mensaje:")){
                mensajeAconsumir = mensaje.getMensaje().
                        substring(mensaje.getMensaje().indexOf(":")+1);
                System.out.println(mensajesServicio.getMensajeAsString(
                        mensajeAconsumir));
                libreriaMensajes.enviarMensaje(mensajesServicio.
                        getMensajeAsString(mensajeAconsumir));
                return true;
            }
            else if (mensaje.getMensaje().contains("hora:")){
                System.out.println(mensajesServicio.getTimeAsString());
                libreriaMensajes.enviarMensaje(mensajesServicio.getTimeAsString());
                return true;
            }
            else if (mensaje.getMensaje().contains("fecha:")){
                System.out.println(mensajesServicio.getDateAsString());
                libreriaMensajes.enviarMensaje(mensajesServicio.getDateAsString());
                return true;
            }
            else {
                return false;
            }
    }
    
    
    /**
     * Método que permite iniciar la url para la consulta de información.
     * @param ipServidor Dirección ip del servidor que contiene el servicio a consumir.
     */
    public final void iniciar(String ipServidor){
        QName qname;
        try {
             url = new URL("http://"+ipServidor+":9999/ws/mensajes?wsdl");
             qname = new QName("http://soap_server/", "MensajesServicioImplService");
             service = Service.create(url, qname);
             mensajesServicio = service.getPort(MensajesServicio.class);
            
        } catch (MalformedURLException ex) {
            Logger.getLogger(LogicaAplicacion.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
    }
    
    
  
   

    
    
   
}
