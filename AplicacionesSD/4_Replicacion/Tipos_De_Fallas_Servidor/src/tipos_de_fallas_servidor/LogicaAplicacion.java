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
 * Clase que implementa la lógica de la aplicación para el tópico Tipos de Fallas
 * - Servidor.
 * @author Héctor Sam.
 */
public class LogicaAplicacion {

    private static LogicaAplicacion instancia = null;
    private LibreriaMensajes libreriaMensajes;
    private int puertoAgente;
    private DatosAplicacion datosAplicacion;
    private final int CANTIDAD_FALLAS = 4;
    private int falla;
    

    private LogicaAplicacion(LibreriaMensajes libreriaMensajes,
            DatosAplicacion datosAplicacion,int puertoAgente) {
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;   
    }
    
    public static LogicaAplicacion getInstancia (LibreriaMensajes libreriaMensajes,
            DatosAplicacion datosAplicacion,int puertoAgente) {
        if (instancia == null){
            instancia = new LogicaAplicacion(libreriaMensajes, 
                    datosAplicacion, puertoAgente);
        }
        return  instancia;
    }

    public LibreriaMensajes getLibreriaMensajes() {
        return libreriaMensajes;
    }

    public void setLibreriaMensajes(LibreriaMensajes libreriaMensajes) {
        this.libreriaMensajes = libreriaMensajes;
    }

    public int getPuertoAgente() {
        return puertoAgente;
    }

    public void setPuertoAgente(int puertoAgente) {
        this.puertoAgente = puertoAgente;
    }

    public DatosAplicacion getDatosAplicacion() {
        return datosAplicacion;
    }

    public void setDatosAplicacion(DatosAplicacion datosAplicacion) {
        this.datosAplicacion = datosAplicacion;
    }

    public int getFalla() {
        return falla;
    }

    public void setFalla(int falla) {
        this.falla = falla;
    }
    
    
    
    /**
     * Método que permite chequear el mensaje recibido para decidir si pertenece
     * al agente de configuración, al módulo de ciclo de vida o a un nodo.
     * @param mensaje El mensaje recibido.
     * @return True si pertence al agente. False en caso contrario.
     */
    public boolean verificarMensajeRecibido(Mensaje mensaje){
        
        switch (mensaje.getMensaje()){
            case "aplicacion": 
                if (libreriaMensajes.enviarMensaje(datosAplicacion.
                        getNombreAplicacion(),"localhost", puertoAgente))
                    return true;
                break;
            case "nodo":
                if (libreriaMensajes.enviarMensaje(datosAplicacion.
                        getNumeroNodoAplicacion(),"localhost",puertoAgente))
                    return true;
                break;
            default:{
                
                System.out.println("Se ha recibido el mensaje: \""
                        +mensaje.getMensaje()+"\" proveniente del host: "
                        +mensaje.getIpOrigen());
                evaluarMensaje(mensaje);
                
            }
        };
        return false;
    }
     
    /**
     * Método que permite enviar el número de proceso al servidor central.
     * @param ipServidor 
     */
    public void enviarId(String ipServidor){
        libreriaMensajes.enviarMensaje("id<"
                +datosAplicacion.getIdProceso(),ipServidor);
        libreriaMensajes.enviarMensaje("Ejecutable inicializado");
    }
    
    
    
    
    /**
     * Método que genera un tipo de falla aleatoria.
     */
    public void generarTipoFalla(){
        int tipoDeFalla = (int) (1 + Math.random()*CANTIDAD_FALLAS);
        System.out.println("Falla: "+tipoDeFalla);
        libreriaMensajes.enviarMensaje("Falla: "+tipoDeFalla);
        falla = tipoDeFalla;
        
    }
    
    /**
     * Método que evalua el tipo de falla presente para actuar frente al cliente.
     * @param mensaje El mensaje enviado por el cliente.
     * @return True.
     */
    public boolean evaluarMensaje(Mensaje mensaje){
        switch (falla){
            case 1:
                    System.out.println("FALLA DE CONGELACION");
                    libreriaMensajes.enviarMensaje("FALLA DE CONGELACION");
                    libreriaMensajes.getHiloDeEscucha().kill();
                break;
            case 2:
                    System.out.println("FALLA DE OMISION, "
                            + "NO RESPONDE A LOS MENSAJES");
                    libreriaMensajes.enviarMensaje("FALLA DE OMISION,"
                            + " NO RESPONDE A LOS MENSAJES");
                break;
            case 3:
                    System.out.println("FALLA DE TIEMPO");
                    libreriaMensajes.enviarMensaje("FALLA DE TIEMPO");
                    try {
                        Thread.sleep(10000);
                        enviarMensajeRespuesta(mensaje,1);
                    } catch (InterruptedException ex) {
                        Logger.getLogger(LogicaAplicacion.class.getName()).
                                log(Level.SEVERE, null, ex);
                    }
                break;
            case 4:
                System.out.println("FALLA DE RESPUESTA");
                libreriaMensajes.enviarMensaje("FALLA DE RESPUESTA");
                enviarMensajeRespuesta(mensaje,0);
                break;
        };
        return true;
    }
    
    
    /**
     * Método que permite enviar una respuesta al nodo cliente.
     * @param mensaje El mensaje recibido por parte del nodo.
     * @param opcion 1: Envía respuesta. Otro: Envía hash de respuesta.
     * @return True si se envió el mensaje. False en caso contrario.
     */
    public boolean enviarMensajeRespuesta(Mensaje mensaje,int opcion){
        MessageDigest md5;
        byte[] bytesOfMessage;
        byte[] thedigest;
        if (opcion == 1){
            libreriaMensajes.enviarMensaje("-=Mensaje de respuesta =-",mensaje.getIpOrigen());
            return true;
        } else{
             try {
             md5 = MessageDigest.getInstance("MD5");                         
            bytesOfMessage = String.valueOf(Math.random()).getBytes("UTF-8");
            thedigest = md5.digest(bytesOfMessage);
            libreriaMensajes.enviarMensaje(thedigest.toString().
                    substring(thedigest.toString().
                    indexOf("@")+1,thedigest.toString().length()),
                    mensaje.getIpOrigen());
            return  true;
            } catch (UnsupportedEncodingException ex) {
                Logger.getLogger(LogicaAplicacion.class.getName()).log(Level.SEVERE, null, ex);
                return  false;
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(LogicaAplicacion.class.getName()).log(Level.SEVERE, null, ex);
                return  false;
            }
        }

}
    
   

    
    
   
}
