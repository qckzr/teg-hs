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
 * Clase que implementa la lógica de la aplicación para el Algoritmo de Cristian
 * - Cliente.
 * @author Héctor Sam.
 */
public class LogicaAplicacion {

    private static LogicaAplicacion instancia = null;
    private LibreriaMensajes libreriaMensajes;
    private int puertoAgente;
    private DatosAplicacion datosAplicacion;
    private String nodoServidor;
    private String horaActual;
    private String horaEnvio;
    private String horaRecepcion;
    private Sincronizacion sincronizacion;
    

    private LogicaAplicacion(LibreriaMensajes libreriaMensajes, 
            DatosAplicacion datosAplicacion,int puertoAgente,
            String nodoServidor,String tiempo) {
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        this.nodoServidor = nodoServidor;
        sincronizacion = new Sincronizacion(Integer.valueOf(tiempo), this);
        sincronizacion.start();
        
        
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

    public String getHoraEnvio() {
        return horaEnvio;
    }

    public void setHoraEnvio(String horaEnvio) {
        this.horaEnvio = horaEnvio;
    }

    public String getHoraRecepcion() {
        return horaRecepcion;
    }

    public void setHoraRecepcion(String horaRecepcion) {
        this.horaRecepcion = horaRecepcion;
    }

    public Sincronizacion getSincronizacion() {
        return sincronizacion;
    }

    public void setSincronizacion(Sincronizacion sincronizacion) {
        this.sincronizacion = sincronizacion;
    }
    
    
    
    /**
     * Singleton
     * @param libreriaMensajes
     * @param datosAplicacion
     * @param puertoAgente
     * @param nodoServidor
     * @param tiempo
     * @return 
     */
    public static LogicaAplicacion getInstancia(LibreriaMensajes libreriaMensajes, 
            DatosAplicacion datosAplicacion,int puertoAgente,
            String nodoServidor,String tiempo) {
        if (instancia == null) {
            instancia = new LogicaAplicacion(libreriaMensajes, datosAplicacion,
                    puertoAgente, nodoServidor, tiempo);
        }
        return instancia;
    }

    public String getHoraActual() {
        return horaActual;
    }

    public void setHoraActual(String horaActual) {
        this.horaActual = horaActual;
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
                        getNombreAplicacion(),"localhost", puertoAgente)) {
                    return true;
                }
                break;
            case "nodo":
                if (libreriaMensajes.enviarMensaje(datosAplicacion.
                        getNumeroNodoAplicacion(),"localhost",puertoAgente)) {
                    return true;
                }
                break;
            default:{
                
                 System.out.println("Se ha recibido el mensaje: \""
                         +mensaje.getMensaje()+"\" proveniente del host: "
                         +mensaje.getIpOrigen());
                 sincronizarReloj(mensaje);
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
        libreriaMensajes.enviarMensaje("Ejecutable inicializado");
    }
    
  
    
    /**
     * Método que permite enviar un mensaje al nodo servidor para calcular el
     * tiempo que tarda en llegar la respuesta del mismo.
     * @param mensaje el mensaje a enviar con la hora.
     * @return True si el mensaje fue enviado. False en caso contrario.
     */
    public boolean enviarMensaje(String mensaje){
        Mensaje m = new Mensaje(libreriaMensajes.getIpOrigen(), mensaje);
        horaEnvio = m.getHora();
        if (libreriaMensajes.enviarMensaje(mensaje,nodoServidor)) {
            return true;
        } else {
            return  false;
        }
        
    }
    
    
    /**
     * Método que permite sincronizar el reloj local con relación a la hora de
     * envío, de recepción y la hora del servidor.
     * @param mensaje El mensaje con la hora del servidor.
     * @return True si se logra sincronizar el reloj. False en caso contrario.
     */
    public boolean sincronizarReloj(Mensaje mensaje){
        Mensaje m;
        SimpleDateFormat sdf;
        Date date1;
        Date date2;
        Date horaServidor;
        long differenceInMillis;
        Date date;
        try {
            m = new Mensaje("", "");
            
            horaRecepcion = m.getHora();
            sdf = new SimpleDateFormat("hh:mm:ss", Locale.ENGLISH);

            date1 = sdf.parse(horaEnvio);
            date2 = sdf.parse(horaRecepcion);
            horaServidor = sdf.parse(mensaje.getHora());
            differenceInMillis = horaServidor.getTime() - (date2.getTime() 
                    - date1.getTime())/2;
            System.out.println("Hora Envio: "+horaEnvio);
            libreriaMensajes.enviarMensaje("Hora Envio: "+horaEnvio);
            System.out.println("Hora Recepcion: "+horaRecepcion);
            date = new Date(differenceInMillis);
            libreriaMensajes.enviarMensaje("Hora Recepcion: "+horaRecepcion);
            
            String complemento = date.toString().substring(date.toString().
                    indexOf(":")+1,date.toString().indexOf(":")+6);
            System.out.println("Reloj Sincronizado con:"+m.getHora().
                    substring(0,mensaje.getHora().indexOf(":")+1)+complemento);
            libreriaMensajes.enviarMensaje("Reloj Sincronizado con:"+m.getHora().
                    substring(0,mensaje.getHora().indexOf(":")+1)+complemento);
            return true;
        } catch (ParseException ex) {
            Logger.getLogger(LogicaAplicacion.class.getName())
                    .log(Level.SEVERE, null, ex);
            return false;
        }
        

    }
    
   
    
    
   
}
