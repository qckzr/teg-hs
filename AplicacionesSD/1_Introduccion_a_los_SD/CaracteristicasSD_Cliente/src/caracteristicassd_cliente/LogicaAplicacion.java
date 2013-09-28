/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package caracteristicassd_cliente;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;
import java.io.*;
import java.net.URL;
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
    private String archivo = "/home/pi/Desktop/archivoCaracteristicasSD.txt";
    private static final int PUERTO = 5555;
    private String ipServidor1;
    private String ipServidor2;
    

    public int getPuerto(){
        return PUERTO;
    }
    
    
    

    public LogicaAplicacion(LibreriaMensajes libreriaMensajes, DatosAplicacion datosAplicacion,int puertoAgente, String ipServidor1, String ipServidor2) {
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        this.ipServidor1 = ipServidor1;
        this.ipServidor2 = ipServidor2;
        
        
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
                libreriaMensajes.enviarMensaje("Se ha recibido el mensaje: \""+mensaje.getMensaje()+"\" proveniente del host: "+mensaje.getIpOrigen());
                enviarMensaje(mensaje);
              
            }
        };
        return false;
    }
     
    public void enviarId(String ipServidor){
        libreriaMensajes.enviarMensaje("id<"+datosAplicacion.getIdProceso(),ipServidor);
    }
    
    
    
   public void enviarMensaje(Mensaje mensaje){
       
       if (libreriaMensajes.enviarMensaje(mensaje.getMensaje(), ipServidor1)==false)
           libreriaMensajes.enviarMensaje(mensaje.getMensaje(), ipServidor2);

   }
   
}
