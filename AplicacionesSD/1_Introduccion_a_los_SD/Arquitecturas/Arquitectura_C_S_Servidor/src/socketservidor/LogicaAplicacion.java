/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package socketservidor;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;
import java.io.BufferedReader;
import java.io.InputStreamReader;

/**
 *
 * @author sam
 */
public class LogicaAplicacion {

    private LibreriaMensajes libreriaMensajes;
    private int puertoAgente;
    private DatosAplicacion datosAplicacion;

    public LogicaAplicacion(LibreriaMensajes libreriaMensajes, DatosAplicacion datosAplicacion,int puertoAgente) {
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
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
                System.out.println("Se ha recibido el mensaje: "+mensaje.getMensaje());
                enviarMensajeRespuesta(mensaje);
            }
        };
        return false;
    }
    
    public boolean enviarMensajeRespuesta(Mensaje mensajeRecibido){
        String mensajeAenviar ="Respondiendo al host "+mensajeRecibido.getIpOrigen()+""
                + " quien envió el mensaje "+mensajeRecibido.getMensaje();
        if (libreriaMensajes.enviarMensaje(mensajeAenviar,mensajeRecibido.getIpOrigen())){
  //          libreriaMensajes.enviarMensaje(mensajeAenviar);
            return true;
        }
            
        else 
            return false;
        
        
    }
   
    
    
    public void enviarId(String ipServidor){
        libreriaMensajes.enviarMensaje(datosAplicacion.getIdProceso(),ipServidor);
    }
    
}
