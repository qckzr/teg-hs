/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package socket;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;
import java.util.ArrayList;
import java.util.Iterator;

/**
 *
 * @author sam
 */
public class LogicaAplicacion {

    private LibreriaMensajes libreriaMensajes;
    private int puertoAgente;
    private DatosAplicacion datosAplicacion;
    
    private ArrayList<String[]> nodosDisponibles;

    public LogicaAplicacion(LibreriaMensajes libreriaMensajes, DatosAplicacion datosAplicacion,int puertoAgente) {
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        nodosDisponibles = new ArrayList<>();
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
                if (!evaluarMensaje(mensaje)){
                    System.out.println("Error al enviar el mensaje");
                    libreriaMensajes.enviarMensaje("Error al enviar el mensaje");
                }
            }
        };
        return false;
    }
  
    
    public boolean enviarMensajeNodo(int opcion,String idNodo,String mensajeRecibido){
        if (opcion==0){
            if (libreriaMensajes.enviarMensaje(mensajeRecibido,buscarIpNodo(idNodo)))
                return true;

        }
        else{
            if(libreriaMensajes.enviarMensaje(mensajeRecibido,idNodo))
                return true;
        }
        return false;
        
    }
    
    
     
    public void enviarId(String ipServidor){
        libreriaMensajes.enviarMensaje("id<"+datosAplicacion.getIdProceso(),ipServidor);
    }
    
    public boolean agregarDestinatario(String id,String ip){
        String[] nodo = new String[2];
        nodo[0] = id;
        nodo[1] = ip;
        nodosDisponibles.add(nodo);
        return true;
    }
    
    
    public String buscarIpNodo(String id){
        Iterator iterator = nodosDisponibles.iterator();
        while (iterator.hasNext()){
            String[] nodo = (String[]) iterator.next();
            if (nodo[0].contentEquals(id))
                return nodo[1];
        }
        System.out.println("Nodo Invalido.");
        libreriaMensajes.enviarMensaje("Nodo Invalido");
        return "";
    }
    
    
    
    public boolean evaluarMensaje(Mensaje mensaje){
        
         if (mensaje.getMensaje().contains("Respuesta_")){
                    System.out.println("Se recibió una RESPUESTA del host: "+mensaje.getIpOrigen());
                    libreriaMensajes.enviarMensaje("Se recibió una RESPUESTA del host: "+mensaje.getIpOrigen());
                    String texto = mensaje.getMensaje();
                    System.out.println(texto.substring(texto.indexOf("_")));
                    libreriaMensajes.enviarMensaje(texto.substring(texto.indexOf("_")));
                    return true;
        }
        else if (mensaje.getIpOrigen().contentEquals(libreriaMensajes.getIpDestino().get(0))){
                    if (mensaje.getMensaje().charAt(1)==':'){
                        char idNodo = mensaje.getMensaje().charAt(0);
                        if (enviarMensajeNodo(0,""+idNodo,mensaje.getMensaje().substring(2)))
                        return true;
                    }
                }
                        
                else{
                    
                    if (enviarMensajeNodo(1,mensaje.getIpOrigen(),"Respuesta_Mensaje de respuesta al mensaje recibido "+mensaje.getMensaje()))
                        return true;
                }
         return false;
     
        
    }
}
