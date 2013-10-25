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
 * Clase que implementa la lógica de la aplicación para el tópico Algoritmo de
 * Berkeley - Cliente.
 * @author Héctor Sam.
 */
public class LogicaAplicacion {

    private static LogicaAplicacion instancia = null;
    private LibreriaMensajes libreriaMensajes;
    private int puertoAgente;
    private DatosAplicacion datosAplicacion;
    private String nodoServidor;
    private String horaActual;
 
    

    private LogicaAplicacion(LibreriaMensajes libreriaMensajes,
            DatosAplicacion datosAplicacion,int puertoAgente,String nodoServidor) {
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        this.nodoServidor = nodoServidor;
        enviarMensaje(datosAplicacion.getNumeroNodoAplicacion()+":activo");
        
        
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

    public String getNodoServidor() {
        return nodoServidor;
    }

    public void setNodoServidor(String nodoServidor) {
        this.nodoServidor = nodoServidor;
    }

    public String getHoraActual() {
        return horaActual;
    }

    public void setHoraActual(String horaActual) {
        this.horaActual = horaActual;
    }
    
    
    
    /**
     * Singleton
     * @param libreriaMensajes
     * @param datosAplicacion
     * @param puertoAgente
     * @param nodoServidor
     * @return 
     */
    public static LogicaAplicacion getInstancia(LibreriaMensajes libreriaMensajes,
            DatosAplicacion datosAplicacion,int puertoAgente,String nodoServidor) {
        if (instancia == null) {
            instancia = new LogicaAplicacion(libreriaMensajes,
                    datosAplicacion, puertoAgente, nodoServidor);
        }
        return instancia;
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
                 if (mensaje.getMensaje().contains("_hora")) {
                    enviarMensaje(datosAplicacion.getNumeroNodoAplicacion()+":hora");
                 } else {
                        sincronizarReloj(mensaje);
                 }
            }
        };
        return false;
    }
     
    /**
     * Método que permite enviar el número de proceso al servidor central.
     * @param ipServidor 
     */
    public void enviarId(String ipServidor){
        libreriaMensajes.enviarMensaje("id<"+datosAplicacion.
                getIdProceso(),ipServidor);
    }
    
  
  
    /**
     * Método que permite enviar el mensjae con la hora actual al servidor.
     * @param mensaje El mensaje con la hora del nodo.
     * @return True si el mensaje fue enviado. False en caso contrario.
     */
    public boolean enviarMensaje(String mensaje){
        Mensaje m = new Mensaje(libreriaMensajes.getIpOrigen(), mensaje);
         if (libreriaMensajes.enviarMensaje(mensaje+"_"+m.getHora(),
                 nodoServidor) == true) {
            return true;
         } else {
             return false;
         }
        
    }
    
    
    /**
     * Método que permite sincronizar el reloj local a partir de la hora enviada
     * por el servidor.
     * @param mensaje El mensaje con la hora del servidor.
     * @return True si se logra sincronizar el reloj local. False en caso
     * contrario.
     */
    public boolean sincronizarReloj(Mensaje mensaje){
        String horaServidor = "";
        SimpleDateFormat sdf;
        Date date1;
        Date date2;
        long differenceInMillis;
        Date date;
        String complemento;
        try {

            horaServidor = mensaje.getMensaje().substring(
                    mensaje.getMensaje().indexOf("~")+1,mensaje.getMensaje().length());
            sdf = new SimpleDateFormat("hh:mm:ss", Locale.ENGLISH);
            horaActual = new Mensaje("", "").getHora();
            date1 = sdf.parse(horaActual);
            date2 = sdf.parse(horaServidor);
            differenceInMillis = date2.getTime() - date1.getTime();
            System.out.println("Hora Actual: "+horaActual);
            libreriaMensajes.enviarMensaje("Hora Actual: "+horaActual);
            System.out.println("Hora Servidor: "+horaServidor);
            libreriaMensajes.enviarMensaje("Hora Servidor: "+horaServidor);
            date = new Date(differenceInMillis);
            
            if (differenceInMillis > 0) {
                System.out.println("AVANZAR reloj del nodo");
                libreriaMensajes.enviarMensaje("AVANZAR reloj del nodo");
            } else {
                System.out.println("RETROCEDER reloj  del nodo");
                libreriaMensajes.enviarMensaje("RETROCEDER reloj  del nodo");
                differenceInMillis = date1.getTime() - date2.getTime();
                date = new Date(differenceInMillis);
            }
            
            complemento = date.toString().substring(date.toString().
                    indexOf(":")+1,date.toString().indexOf(":")+6);
            System.out.println("Reloj Sincronizado con: "+complemento+ " de diferencia");
            libreriaMensajes.enviarMensaje("Reloj Sincronizado con: "+complemento+ " de diferencia");
            return true;
        } catch (ParseException ex) {
            Logger.getLogger(LogicaAplicacion.class.getName()).
                    log(Level.SEVERE, null, ex);
            return false;
        }
        

    }
    
   
    
    
   
}
