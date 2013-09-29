/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cristian_cliente;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;
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
    private String horaEnvio;
    private String horaRecepcion;
    private Sincronizacion sincronizacion;
    

    public LogicaAplicacion(LibreriaMensajes libreriaMensajes, DatosAplicacion datosAplicacion,int puertoAgente,String nodoServidor,String tiempo) {
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        this.nodoServidor = nodoServidor;
        sincronizacion = new Sincronizacion(Integer.valueOf(tiempo), this);
        sincronizacion.start();
        
        
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
        horaEnvio = m.getHora();
        libreriaMensajes.enviarMensaje(mensaje,nodoServidor);
       
        return true;
        
    }
    
    
    public boolean sincronizarReloj(Mensaje mensaje){
        try {
            Mensaje m = new Mensaje("", "");
            
            horaRecepcion = m.getHora();
            SimpleDateFormat sdf = new SimpleDateFormat("hh:mm:ss", Locale.ENGLISH);

            Date date1 = sdf.parse(horaEnvio);
            Date date2 = sdf.parse(horaRecepcion);
            Date horaServidor = sdf.parse(mensaje.getHora());
            long differenceInMillis = horaServidor.getTime() - (date2.getTime() - date1.getTime())/2;
            System.out.println("Hora Envio: "+horaEnvio);
            System.out.println("Hora Recepcion: "+horaRecepcion);
            Date a = new Date(differenceInMillis);
            
            String complemento = a.toString().substring(a.toString().indexOf(":")+1,a.toString().indexOf(":")+6);
            System.out.println("Reloj Sincronizado con:"+m.getHora().substring(0,mensaje.getHora().indexOf(":")+1)+complemento);
            return true;
        } catch (ParseException ex) {
            Logger.getLogger(LogicaAplicacion.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        

    }
    
   
    
    
   
}
