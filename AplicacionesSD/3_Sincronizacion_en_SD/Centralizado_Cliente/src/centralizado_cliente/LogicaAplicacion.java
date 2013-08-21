/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package centralizado_cliente;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author sam
 */
public class LogicaAplicacion {

    private LibreriaMensajes libreriaMensajes;
    private int puertoAgente;
    private DatosAplicacion datosAplicacion;
    private String nodoServidor;
    private String nodoRegionCritica;

 
    

    public LogicaAplicacion(LibreriaMensajes libreriaMensajes, DatosAplicacion datosAplicacion,int puertoAgente,String nodoServidor) {
        
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        this.nodoServidor = nodoServidor;

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
                 if (mensaje.getMensaje().contains("_aprobado"))
                    System.out.println("El nodo se encuentra accediendo a la región critica de: "+nodoRegionCritica);
                 else if (mensaje.getMensaje().contains("_rechazado"))
                    System.out.println("No se puede acceder al nodo: "+nodoRegionCritica);
                 else if (mensaje.getMensaje().contains(":acceder") || mensaje.getMensaje().contains(":salir"))
                     enviarMensaje(mensaje.getMensaje());
            }
        };
        return false;
    }
     
    public void enviarId(String ipServidor){
        libreriaMensajes.enviarMensaje(datosAplicacion.getIdProceso(),ipServidor);
    }
    
  
    
    public boolean enviarMensaje(String mensaje){
        nodoRegionCritica = mensaje.substring(0,mensaje.indexOf(":"));
        Mensaje m = new Mensaje(libreriaMensajes.getIpOrigen(), mensaje);
        libreriaMensajes.enviarMensaje(mensaje,nodoServidor);
       
        return true;
        
    }
    
    
    
    
   
    
    
   
}
