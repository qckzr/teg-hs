/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloaccesoremoto_cliente;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;

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
                
                System.out.println("Se ha recibido el mensaje: \""+mensaje.getMensaje()+"\" proveniente del host: "+mensaje.getIpOrigen());
                if (mensaje.getMensaje().contains("ver:")){
                    libreriaMensajes.enviarMensaje("Leyendo el archivo...");
                    enviarMensaje(mensaje);
                }
                else if (mensaje.getMensaje().contains("escribir:")){
                    libreriaMensajes.enviarMensaje("Escribiendo en el archivo...");
                    enviarMensaje(mensaje);
                }
            }
        };
        return false;
    }
     
    public void enviarId(String ipServidor){
        libreriaMensajes.enviarMensaje("id<"+datosAplicacion.getIdProceso(),ipServidor);
    }
    
    
    public void enviarMensaje(Mensaje mensaje){
        libreriaMensajes.enviarMensaje(mensaje, ipServidor);
        
    }
    
    
    
    
   
    
    
   
    
   

    
    
   
}
