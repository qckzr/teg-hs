/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tipos_de_fallas_servidor;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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
    private final int CANTIDAD_FALLAS = 4;
    private int falla;
    

    public LogicaAplicacion(LibreriaMensajes libreriaMensajes, DatosAplicacion datosAplicacion,int puertoAgente) {
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        falla = generarTipoFalla();
        
        
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
                evaluarMensaje(mensaje);
                
            }
        };
        return false;
    }
     
    public void enviarId(String ipServidor){
        libreriaMensajes.enviarMensaje(datosAplicacion.getIdProceso(),ipServidor);
    }
    
    
    public int generarTipoFalla(){
        int tipoDeFalla = (int) (1 + Math.random()*CANTIDAD_FALLAS);
        System.out.println("Falla: "+tipoDeFalla);
        return tipoDeFalla;
        
    }
    
    public boolean evaluarMensaje(Mensaje mensaje){
        switch (falla){
            case 1:
                    System.out.println("FALLA DE CONGELACION");
                    libreriaMensajes.getHiloDeEscucha().kill();
                break;
            case 2:
                    System.out.println("FALLA DE OMISION, NO RESPONDE A LOS MENSAJES");
                break;
            case 3:
                    System.out.println("FALLA DE TIEMPO");
                    try {
                        Thread.sleep(10000);
                        enviarMensajeRespuesta(mensaje,1);
                    } catch (InterruptedException ex) {
                        Logger.getLogger(LogicaAplicacion.class.getName()).log(Level.SEVERE, null, ex);
                    }
                break;
            case 4:
                System.out.println("FALLA DE RESPUESTA");
                enviarMensajeRespuesta(mensaje,0);
                break;
        };
        return true;
    }
    
    
    public boolean enviarMensajeRespuesta(Mensaje mensaje,int opcion){
        if (opcion==1){
            libreriaMensajes.enviarMensaje("-=Mensaje de respuesta =-",mensaje.getIpOrigen());
        }
        else{
            try {
              MessageDigest md5 = MessageDigest.getInstance("MD5");                         
            byte[] bytesOfMessage = String.valueOf(Math.random()).getBytes("UTF-8");
            byte[] thedigest = md5.digest(bytesOfMessage);
            libreriaMensajes.enviarMensaje(thedigest.toString().substring(thedigest.toString().
                    indexOf("@")+1,thedigest.toString().length()),mensaje.getIpOrigen());
            } catch (UnsupportedEncodingException ex) {
                Logger.getLogger(LogicaAplicacion.class.getName()).log(Level.SEVERE, null, ex);
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(LogicaAplicacion.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return true;
}
    
   

    
    
   
}
