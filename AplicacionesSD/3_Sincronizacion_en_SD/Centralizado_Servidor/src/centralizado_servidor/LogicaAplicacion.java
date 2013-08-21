/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package centralizado_servidor;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
    private ArrayList<String> regionCriticaOcupada;
    

    

    public LogicaAplicacion(LibreriaMensajes libreriaMensajes, DatosAplicacion datosAplicacion,int puertoAgente) {
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        regionCriticaOcupada = new ArrayList<>();

        
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
                 if (mensaje.getMensaje().contains(":acceder"))
                     responderNodo(mensaje);
                 else if (mensaje.getMensaje().contains(":salir"))
                     desocuparRegion(mensaje.getMensaje());
                 
            }
        };
        return false;
    }
     
    public void enviarId(String ipServidor){
        libreriaMensajes.enviarMensaje(datosAplicacion.getIdProceso(),ipServidor);
    }
    
    public boolean verificarRegion(String mensaje){
        String numeroNodo= mensaje.substring(0,mensaje.indexOf(":"));
        for (String nodos : regionCriticaOcupada) {
            if (nodos.contentEquals(numeroNodo))
                return false;
        }
        return true;
        
    }
    
    public void ocuparRegion (String mensaje){
        String numeroNodo= mensaje.substring(0,mensaje.indexOf(":"));
        regionCriticaOcupada.add(numeroNodo);
    }
    
    
    public void responderNodo(Mensaje mensaje){
        if (verificarRegion(mensaje.getMensaje())){
            ocuparRegion(mensaje.getMensaje());
            libreriaMensajes.enviarMensaje("_aprobado", mensaje.getIpOrigen());
        }
        else{
            libreriaMensajes.enviarMensaje("_rechazado",mensaje.getIpOrigen());
        }
    }
    
    public void desocuparRegion(String mensaje){
        String numeroNodo= mensaje.substring(0,mensaje.indexOf(":"));
        regionCriticaOcupada.remove(numeroNodo);
        System.out.println("La región critica del nodo: "+numeroNodo+" fue liberada");
    }
    
   
    
    
    
    
    
   
    
    
   
}
