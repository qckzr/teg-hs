/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package promedio;

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
    private String horaActual;
    private ArrayList<String> nodos;
    private ArrayList<Date> horasRecibidas;
    private EscuchaHoras escuchaHoras;
    private int tiempoEspera;
 
    

    public LogicaAplicacion(LibreriaMensajes libreriaMensajes, DatosAplicacion datosAplicacion,int puertoAgente, int tiempoEspera) {
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        nodos = new ArrayList<>();
        horasRecibidas = new ArrayList<>();
        this.tiempoEspera = tiempoEspera;
    }

    public String getHoraActual() {
        return horaActual;
    }

    public void setHoraActual(String horaActual) {
        this.horaActual = horaActual;
    }
    
    public void agregarNodo(String ip){
        nodos.add(ip);
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
            case "iniciar":
                enviarMensaje();
                escuchaHoras = new EscuchaHoras(tiempoEspera, this);
                escuchaHoras.start();
                return true;
            default:{             
                 System.out.println("Se ha recibido el mensaje: \""+mensaje.getMensaje()+"\" proveniente del host: "+mensaje.getIpOrigen());
                 
                 if (mensaje.getMensaje().contains("_hora")){
                       
                    enviarMensaje(datosAplicacion.getNumeroNodoAplicacion()+":hora",mensaje.getIpOrigen());
                 }
                 else if (mensaje.getMensaje().contains(":hora")){
                     agregarHora(mensaje);                     
                 }
            }
        };
        return false;
    }
     
    public void enviarId(String ipServidor){
        libreriaMensajes.enviarMensaje("id<"+datosAplicacion.getIdProceso(),ipServidor);
    }
    
  
    
    public boolean enviarMensaje(String mensaje, String ip){
        libreriaMensajes.enviarMensaje("Enviando hora actual...");
        Mensaje m = new Mensaje(libreriaMensajes.getIpOrigen(), mensaje);
        libreriaMensajes.enviarMensaje(mensaje+"_"+m.getHora(),ip);
        return true;
        
    }
    
    public boolean enviarMensaje(){
        libreriaMensajes.enviarMensaje("Solicitando hora a los demas nodos...");
        for (String ip : nodos) {
            libreriaMensajes.enviarMensaje("_hora",ip);
        }
        return true;
    }
    
    public boolean sincronizarReloj(){
            long differenceInMillis = 0;
            for (Date date : horasRecibidas)
                differenceInMillis = differenceInMillis + date.getTime();
            horaActual = new Mensaje("","").getHora();
            differenceInMillis = differenceInMillis / horasRecibidas.size();
            System.out.println("Hora Actual: "+horaActual);
            libreriaMensajes.enviarMensaje("Hora Actual: "+horaActual);
            Date a = new Date(differenceInMillis);
            String complemento = a.toString().substring(a.toString().indexOf(":")+1,a.toString().indexOf(":")+6);
            System.out.println("Hora Actualizada: "+horaActual.substring(0,horaActual.indexOf(":")+1)+complemento);
            libreriaMensajes.enviarMensaje("Hora Actualizada: "+horaActual.substring(0,horaActual.indexOf(":")+1)+complemento);
            return true;
    }
    
    
    public void agregarHora(Mensaje mensaje){
         try {
            SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss", Locale.ENGLISH);
            Date date = sdf.parse(mensaje.getHora());
            libreriaMensajes.enviarMensaje("Agregando hora recibida...");
            horasRecibidas.add(date);

        } catch (ParseException ex) {
            Logger.getLogger(LogicaAplicacion.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
   
    
    
   
}
