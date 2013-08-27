/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package p2p;

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
    private String nodoSiguiente;

    public LogicaAplicacion(LibreriaMensajes libreriaMensajes, DatosAplicacion datosAplicacion,int puertoAgente,String nodoSiguiente) {
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        this.nodoSiguiente = nodoSiguiente;
        
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
                if (!evaluarMensaje(mensaje))
                    System.out.println("Error al enviar el mensaje");
            }
        };
        return false;
    }
     
    public void enviarId(String ipServidor){
        libreriaMensajes.enviarMensaje(datosAplicacion.getIdProceso(),ipServidor);
    }
    
    public boolean enviarMensaje(Mensaje mensaje){
        if (libreriaMensajes.enviarMensaje(mensaje, nodoSiguiente))
            return true;
        else
            return false;
        
        
    }
    
    public boolean enviarMensaje(String mensaje,String ipOrigen){
        Mensaje m = new Mensaje(ipOrigen, mensaje);
        if (libreriaMensajes.enviarMensaje(m, nodoSiguiente))
            return true;
        else
            return false;
    }
    
    
    public boolean evaluarMensaje(Mensaje mensaje){
        
         
        if (mensaje.getIpOrigen().contentEquals(libreriaMensajes.getIpDestino().get(0))){
            String texto = mensaje.getMensaje()+"~"+datosAplicacion.getNumeroNodoAplicacion();
            enviarMensaje(texto,nodoSiguiente);
            return true;
        }
        
        else if (mensaje.getMensaje().charAt(1)==':'){
            char idNodo = mensaje.getMensaje().charAt(0);
            if (idNodo != datosAplicacion.getNumeroNodoAplicacion().charAt(0)){
                enviarMensaje(mensaje);
                return true;
            }
            else {
                    if (mensaje.getMensaje().contains("Respuesta_")){
                        System.out.println("Se recibió una RESPUESTA del host: "+mensaje.getIpOrigen());
                        String texto = mensaje.getMensaje();
                        System.out.println(texto.substring(texto.indexOf("_")+1));
                        return true;
                    }
                    else{
                        String nodoOrigen = mensaje.getMensaje().substring(mensaje.getMensaje().indexOf("~")+1);
                        String m = mensaje.getMensaje().substring(mensaje.getMensaje().indexOf(":")+1, mensaje.getMensaje().indexOf("~"));
                        String mensajeRespuesta = nodoOrigen+":Respuesta_Mensaje de respuesta al mensaje recibido: \""+m+"\"";
                        if (enviarMensaje(mensajeRespuesta,libreriaMensajes.getIpOrigen()))
                            return true;

                    }
                }
        }  
        return false;

    }
    
    
   
}