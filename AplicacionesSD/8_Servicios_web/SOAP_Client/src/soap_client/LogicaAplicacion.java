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
 *
 * @author sam
 */
public class LogicaAplicacion {

    private LibreriaMensajes libreriaMensajes;
    private int puertoAgente;
    private DatosAplicacion datosAplicacion;
    private URL url;
    private Service service;
    private MensajesServicio mensajesServicio;
    

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
        
            if (mensaje.getMensaje().contains("mensaje:")){
                String mensajeAconsumir = mensaje.getMensaje().substring(mensaje.getMensaje().indexOf(":")+1);
                System.out.println(mensajesServicio.getMensajeAsString(mensajeAconsumir));
                return true;
            }
            else if (mensaje.getMensaje().contains("hora:")){
                System.out.println(mensajesServicio.getTimeAsString());
                return true;
            }
            else if (mensaje.getMensaje().contains("fecha:")){
                System.out.println(mensajesServicio.getDateAsString());
                return true;
            }
            else
                return false;
    }
    
    
    public final void iniciar(String ipServidor){
        try {
             url = new URL("http://"+ipServidor+":9999/ws/mensajes?wsdl");
               QName qname = new QName("http://soap_server/", "MensajesServicioImplService");
        
                service = Service.create(url, qname);
               mensajesServicio = service.getPort(MensajesServicio.class);
            
        } catch (MalformedURLException ex) {
            Logger.getLogger(LogicaAplicacion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
  
   

    
    
   
}
