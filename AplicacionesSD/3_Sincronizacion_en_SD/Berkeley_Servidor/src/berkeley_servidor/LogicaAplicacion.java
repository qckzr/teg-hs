/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package berkeley_servidor;

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
    private ArrayList<String> nodos;
    private int mensajesRecibidos;
    private ArrayList<Date> horas;
    private PreguntarHora preguntarHora;
    

    public LogicaAplicacion(LibreriaMensajes libreriaMensajes, DatosAplicacion datosAplicacion,int puertoAgente, int tiempo) {
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        nodos = new ArrayList<>();
        horas = new ArrayList<Date>();
        mensajesRecibidos = 0;
        preguntarHora = new PreguntarHora(tiempo, this);
        preguntarHora.start();
      
        
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
                 if (mensaje.getMensaje().contains(":activo"))
                     agregarNodo(mensaje);
                 else if (mensaje.getMensaje().contains(":hora")){   
                     agregarHora(mensaje);
                     comprobarPromedio();
                 }
                     
           
            }
        };
        return false;
    }
     
    public void enviarId(String ipServidor){
        libreriaMensajes.enviarMensaje(datosAplicacion.getIdProceso(),ipServidor);
    }
    
    public boolean agregarNodo(Mensaje mensaje){
        nodos.add(mensaje.getIpOrigen());
        return true;
        
    }
    
    public boolean agregarHora(Mensaje mensaje){
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss", Locale.ENGLISH);
            Date date = sdf.parse(mensaje.getHora());
            horas.add(date);
            mensajesRecibidos++;
            return true;
        } catch (ParseException ex) {
            Logger.getLogger(LogicaAplicacion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public boolean comprobarPromedio(){
        if (mensajesRecibidos == nodos.size()){
            long longitud = 0;
            for (Date date : horas) {
                longitud = longitud +date.getTime();
            }
            longitud = longitud / nodos.size();
            Mensaje m = new Mensaje(libreriaMensajes.getIpOrigen(),"_sincronizacionHora~");
            Date nuevaFecha = new Date(longitud);
            m.setMensaje(m.getMensaje()+m.getHora().substring(
                    0,m.getHora().indexOf(":")+1)+nuevaFecha.toString().substring(
                    nuevaFecha.toString().indexOf(":")+1,nuevaFecha.toString().
                    indexOf(":")+6));
            enviarMensaje(m);
            return true;
        }
        else
            return false;
    }
    
    
    public void enviarMensaje(Mensaje mensaje){
        for (String ip : nodos) {
            libreriaMensajes.enviarMensaje(mensaje, ip);
        }
        horas = new ArrayList<Date>();
        mensajesRecibidos = 0;
        
    }
    
    public void preguntarHora(){
        for (String ip : nodos) {
            libreriaMensajes.enviarMensaje("_hora", ip);
        }
    }
    
    
    
   
    
    
   
}
