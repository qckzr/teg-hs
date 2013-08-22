/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package distribuido;

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
    private ArrayList<String> nodosSistema;
    private String nodoRegionCritica = "";
    private ArrayList<String> solicitudesRecibidas;
    private String horaEnvio;
    private boolean accederRegionCritica = false;
    private int okRecibidos = 0;
    private final static int TIEMPO_ESPERA = 5000;

 
    

    public LogicaAplicacion(LibreriaMensajes libreriaMensajes, DatosAplicacion datosAplicacion,int puertoAgente) {
        
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        nodosSistema = new ArrayList<>();
        solicitudesRecibidas = new ArrayList<>();
      

    }

    public ArrayList<String> getNodosSistema() {
        return nodosSistema;
    }

    public void setNodosSistema(ArrayList<String> nodosSistema) {
        this.nodosSistema = nodosSistema;
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
                 if (mensaje.getMensaje().contains("OK")){
                     agregarOk();
                 }
                 else if (mensaje.getMensaje().contains("_:")){
                     comprobarNodo(mensaje);
                 }
                 else if (mensaje.getMensaje().contains(":acceder"))
                        configurarAmbiente(mensaje.getMensaje());
                 else if (mensaje.getMensaje().contains(":salir")){
                     salirRegion();
                 }
            }
        };
        return false;
    }
     
    public void enviarId(String ipServidor){
        libreriaMensajes.enviarMensaje(datosAplicacion.getIdProceso(),ipServidor);
    }
    
    public void configurarAmbiente(String mensaje){
        nodoRegionCritica = mensaje.substring(0,mensaje.indexOf(":"));
        Mensaje m = new Mensaje(libreriaMensajes.getIpOrigen(), nodoRegionCritica+"_:"+datosAplicacion.getNumeroNodoAplicacion());
        horaEnvio = m.getHora();
        m.setMensaje(m.getMensaje()+"_"+m.getHora());
        EsperaMensaje esperaMensaje = new EsperaMensaje(this,TIEMPO_ESPERA,m);
        esperaMensaje.start();
    }
  
    
    public boolean enviarMensaje(Mensaje mensaje){
        
        
        for (String ip : nodosSistema)
            libreriaMensajes.enviarMensaje(mensaje,ip);
        
       
        return true;
        
    }
    
    public boolean enviarMensaje(){
        
        if (solicitudesRecibidas.size()>0){
            libreriaMensajes.enviarMensaje("OK",solicitudesRecibidas.get(0));
            solicitudesRecibidas.remove(0);
            return true;
        }
        return false;
        
        
    }
    
    public boolean comprobarNodo(Mensaje mensaje){
       String nodoRecibido = mensaje.getMensaje().substring(0,mensaje.getMensaje().indexOf("_:"));
       if (!nodoRegionCritica.contentEquals(nodoRecibido)){
           libreriaMensajes.enviarMensaje("OK",mensaje.getIpOrigen());
       }
       else if (nodoRegionCritica.length()!=0){
            try {
                
                SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss", Locale.ENGLISH);
                 Date horaRecibida = sdf.parse(mensaje.getHora());
                 Date horaMensajeEnvio = sdf.parse(horaEnvio);
                 long diferencia = horaRecibida.getTime() - horaMensajeEnvio.getTime();
                 if (diferencia<0){
                     System.out.println("La hora recibida es menor que la de este nodo");
                     libreriaMensajes.enviarMensaje("OK",mensaje.getIpOrigen());
                 }
                 else{
                     System.out.println("La hora recibida es mayor que la de este nodo");
                     solicitudesRecibidas.add(mensaje.getIpOrigen());
                 }
                     
                     
            } catch (ParseException ex) {
                Logger.getLogger(LogicaAplicacion.class.getName()).log(Level.SEVERE, null, ex);
            }
           
       }
       else{
           solicitudesRecibidas.add(mensaje.getIpOrigen());
       }
       return true;
    }
    
    public boolean salirRegion(){
        
        accederRegionCritica = false;
        System.out.println("Saliendo de la region critica de: "+nodoRegionCritica);
        nodoRegionCritica="";
        enviarMensaje();
        okRecibidos = 0;
        horaEnvio = "";
        return true;
    }
    
    public boolean agregarOk(){
        
        okRecibidos++;
        if (okRecibidos==nodosSistema.size()){
            accederRegionCritica = true;
            System.out.println("El nodo se encuentra utilizando la region critica de: "+nodoRegionCritica);
        }
        return true;
        
    }
    
    
    
    
    
    
   
    
    
   
}
