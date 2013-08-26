/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ldap_cliente;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;
import java.util.ArrayList;

/**
 *
 * @author sam
 */
public class LogicaAplicacion {

    private LibreriaMensajes libreriaMensajes;
    private int puertoAgente;
    private DatosAplicacion datosAplicacion;
    private String ipServidor;
    
    
    

    public LogicaAplicacion(LibreriaMensajes libreriaMensajes, DatosAplicacion datosAplicacion,int puertoAgente, String ipServidor) {
        
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        this.ipServidor = ipServidor;
       
       

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
                 
               //  System.out.println("Se ha recibido el mensaje: \""+mensaje.getMensaje()+"\" proveniente del host: "+mensaje.getIpOrigen());
                 if (mensaje.getIpOrigen().contentEquals(libreriaMensajes.getIpDestino().get(0))){
                     enviarMensaje(mensaje.getMensaje());
                 }  
                 else{
                     System.out.println(mensaje.getMensaje());
                 }
                 
            }
        };
        return false;
    }
     
    public void enviarId(String ipServidor){
        libreriaMensajes.enviarMensaje(datosAplicacion.getIdProceso(),ipServidor);
    }
    
    
  
    
    public boolean enviarMensaje(String mensaje){
        libreriaMensajes.enviarMensaje(mensaje,ipServidor);
        return true;
        
        
    }
    
    
   
  
   
    
    
}
    
    
    
    
    
    
   
    
    
   

