/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package berkeley_cliente;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
    private String nodoServidor;
    private String horaActual;
 
    

    public LogicaAplicacion(LibreriaMensajes libreriaMensajes, DatosAplicacion datosAplicacion,int puertoAgente,String nodoServidor) {
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        this.nodoServidor = nodoServidor;
        enviarMensaje(datosAplicacion.getNumeroNodoAplicacion()+":activo");
        
        
    }

    public String getHoraActual() {
        return horaActual;
    }

    public void setHoraActual(String horaActual) {
        this.horaActual = horaActual;
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
                 if (mensaje.getMensaje().contains("_hora"))
                    enviarMensaje(datosAplicacion.getNumeroNodoAplicacion()+":hora");
                else
                 sincronizarReloj(mensaje);
            }
        };
        return false;
    }
     
    public void enviarId(String ipServidor){
        libreriaMensajes.enviarMensaje("id<"+datosAplicacion.getIdProceso(),ipServidor);
    }
    
  
    
    public boolean enviarMensaje(String mensaje){
        Mensaje m = new Mensaje(libreriaMensajes.getIpOrigen(), mensaje);
        libreriaMensajes.enviarMensaje(mensaje+"_"+m.getHora(),nodoServidor);
       
        return true;
        
    }
    
    
    public boolean sincronizarReloj(Mensaje mensaje){
        try {
            
            
            String horaServidor = mensaje.getMensaje().substring(
                    mensaje.getMensaje().indexOf("~")+1,mensaje.getMensaje().length());
            SimpleDateFormat sdf = new SimpleDateFormat("hh:mm:ss", Locale.ENGLISH);
            horaActual = new Mensaje("", "").getHora();
            Date date1 = sdf.parse(horaActual);
            Date date2 = sdf.parse(horaServidor);
            long differenceInMillis = date2.getTime() - date1.getTime();
            System.out.println("Hora Actual: "+horaActual);
            System.out.println("Hora Servidor: "+horaServidor);
            Date a = new Date(differenceInMillis);
            if (differenceInMillis>0)
                System.out.println("AVANZAR reloj del nodo");
            else{
                System.out.println("RETROCEDER reloj  del nodo");
                differenceInMillis = date1.getTime() - date2.getTime();
                a = new Date(differenceInMillis);
            }
            String complemento = a.toString().substring(a.toString().indexOf(":")+1,a.toString().indexOf(":")+6);
          //  configurarReloj("\""+horaServidor+"\""); NO SIRVIO =.=
            System.out.println("Reloj Sincronizado con: "+complemento+ " de diferencia");
            return true;
        } catch (ParseException ex) {
            Logger.getLogger(LogicaAplicacion.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        

    }
    
    
    public void configurarReloj(String hora){
        try {
            Process p = Runtime.getRuntime().exec("sudo date -s "+hora);
        } catch (IOException ex) {
            Logger.getLogger(LogicaAplicacion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
   
    
    
   
}
