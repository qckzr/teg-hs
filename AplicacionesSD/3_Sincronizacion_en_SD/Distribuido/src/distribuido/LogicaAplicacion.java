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
 * Clase que implementa la lógica de la aplicación para el  tópico Exclusión Mutua:
 * Algoritmo Distribuido.
 * 
 * @author Héctor Sam.
 */
public class LogicaAplicacion {

    private static LogicaAplicacion instancia = null;
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

 
    

    private LogicaAplicacion(LibreriaMensajes libreriaMensajes, 
            DatosAplicacion datosAplicacion,int puertoAgente) {
        
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        nodosSistema = new ArrayList<>();
        solicitudesRecibidas = new ArrayList<>();
      

    }
    
    /**
     * Singleton.
     * @param libreriaMensajes
     * @param datosAplicacion
     * @param puertoAgente
     * @return 
     */
    public static LogicaAplicacion getInstancia (
            LibreriaMensajes libreriaMensajes, DatosAplicacion datosAplicacion,
            int puertoAgente) {
        if (instancia == null) {
            instancia = new LogicaAplicacion(libreriaMensajes,
                    datosAplicacion, puertoAgente);
        }
        return  instancia;
        
    }

    public ArrayList<String> getNodosSistema() {
        return nodosSistema;
    }

    public void setNodosSistema(ArrayList<String> nodosSistema) {
        this.nodosSistema = nodosSistema;
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

    public String getNodoRegionCritica() {
        return nodoRegionCritica;
    }

    public void setNodoRegionCritica(String nodoRegionCritica) {
        this.nodoRegionCritica = nodoRegionCritica;
    }

    public ArrayList<String> getSolicitudesRecibidas() {
        return solicitudesRecibidas;
    }

    public void setSolicitudesRecibidas(ArrayList<String> solicitudesRecibidas) {
        this.solicitudesRecibidas = solicitudesRecibidas;
    }

    public String getHoraEnvio() {
        return horaEnvio;
    }

    public void setHoraEnvio(String horaEnvio) {
        this.horaEnvio = horaEnvio;
    }

    public boolean isAccederRegionCritica() {
        return accederRegionCritica;
    }

    public void setAccederRegionCritica(boolean accederRegionCritica) {
        this.accederRegionCritica = accederRegionCritica;
    }

    public int getOkRecibidos() {
        return okRecibidos;
    }

    public void setOkRecibidos(int okRecibidos) {
        this.okRecibidos = okRecibidos;
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
                 if (mensaje.getMensaje().contains("OK")){
                     libreriaMensajes.enviarMensaje("Recibido OK");
                     agregarOk();
                 }
                 else if (mensaje.getMensaje().contains("_:")){
                     comprobarNodo(mensaje);
                 }
                 else if (mensaje.getMensaje().contains(":acceder")) {
                        configurarAmbiente(mensaje.getMensaje());
                 }
                 else if (mensaje.getMensaje().contains(":salir")){
                     
                     salirRegion();
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
        libreriaMensajes.enviarMensaje("id<"+datosAplicacion.getIdProceso(),
                ipServidor);
        libreriaMensajes.enviarMensaje("Ejecutable inicializado");
    }
    
    /**
     * Método que permite iniciar el ambiente del nodo para solicitar acceder
     * a una región crítica.
     * @param mensaje El nodo al que se quiere acceder.
     */
    public void configurarAmbiente(String mensaje){
        nodoRegionCritica = mensaje.substring(0,mensaje.indexOf(":"));
        Mensaje m = new Mensaje(libreriaMensajes.getIpOrigen(),
                nodoRegionCritica+"_:"+datosAplicacion.getNumeroNodoAplicacion());
        horaEnvio = m.getHora();
        m.setMensaje(m.getMensaje()+"_"+m.getHora());
        EsperaMensaje esperaMensaje = new EsperaMensaje(this,TIEMPO_ESPERA,m);
        esperaMensaje.start();
    }
  
    
    /**
     * Método que permie enviar un mensaje a todos los nodos.
     * @param mensaje El mensaje a enviar.
     * @return True si no hubo error. False en caso contrario.
     */
    public boolean enviarMensaje(Mensaje mensaje){
        
        
        for (String ip : nodosSistema) {
            if (libreriaMensajes.enviarMensaje(mensaje,ip) == false) {
                return false;
            }
        }
        return true;
        
    }
    
    /**
     * Método que permite enviar un mensaje de OK a otro nodo
     * @return True si el mensaje fue enviado. False en caso contrario.
     */
    public boolean enviarMensaje(){
        
        if (solicitudesRecibidas.size() > 0){
            libreriaMensajes.enviarMensaje("OK",solicitudesRecibidas.get(0));
            solicitudesRecibidas.remove(0);
            return true;
        }
        return false;
        
        
    }
    
    /**
     * Método que comprueba si puede acceder a una región crítica de un nodo
     * particular.
     * @param mensaje El mensaje recibido de otro nodo.
     * @return True si no hubo error. False en caso contrario.
     */
    public boolean comprobarNodo(Mensaje mensaje){
       SimpleDateFormat sdf;
       Date horaRecibida;
       Date horaMensajeEnvio;
       long diferencia;
       String nodoRecibido = mensaje.getMensaje().substring(0,
               mensaje.getMensaje().indexOf("_:"));
       if (!nodoRegionCritica.contentEquals(nodoRecibido)){
           libreriaMensajes.enviarMensaje("OK",mensaje.getIpOrigen());
       }
       else if (nodoRegionCritica.length() != 0){
            try {
                
                 sdf = new SimpleDateFormat("HH:mm:ss", Locale.ENGLISH);
                 horaRecibida = sdf.parse(mensaje.getHora());
                 horaMensajeEnvio = sdf.parse(horaEnvio);
                 diferencia = horaRecibida.getTime() - horaMensajeEnvio.getTime();
                 if (diferencia < 0){
                     System.out.println("La hora recibida es menor "
                             + "que la de este nodo");
                     libreriaMensajes.enviarMensaje("La hora recibida es menor"
                             + " que la de este nodo");
                     libreriaMensajes.enviarMensaje("OK",mensaje.getIpOrigen());
                 } else{
                     System.out.println("La hora recibida es mayor que la de"
                             + " este nodo");
                     libreriaMensajes.enviarMensaje("La hora recibida es mayor"
                             + " que la de este nodo");
                     libreriaMensajes.enviarMensaje("Guardando peticion en cola"
                             + " de solicitudes...");
                     solicitudesRecibidas.add(mensaje.getIpOrigen());
                 }
                     
                     
            } catch (ParseException ex) {
                Logger.getLogger(LogicaAplicacion.class.getName()).log(Level.SEVERE, null, ex);
                return false;
            }
           
       }
       else{
           solicitudesRecibidas.add(mensaje.getIpOrigen());
       }
       return true;
    }
    
    public void salirRegion(){
        
        accederRegionCritica = false;
        System.out.println("Saliendo de la region critica de:"
                + " "+nodoRegionCritica);
        libreriaMensajes.enviarMensaje("Saliendo de la region critica de:"
                + " "+nodoRegionCritica);
        nodoRegionCritica = "";
        enviarMensaje();
        okRecibidos = 0;
        horaEnvio = "";
    }
    
    public boolean agregarOk(){
        
        okRecibidos++;
        if (okRecibidos == nodosSistema.size()){
            accederRegionCritica = true;
            System.out.println("El nodo se encuentra utilizando la "
                    + "region critica de: "+nodoRegionCritica);
            libreriaMensajes.enviarMensaje("El nodo se encuentra utilizando la "
                    + "region critica de: "+nodoRegionCritica);
            return true;
        }
        return  false;
        
    }
    
    
    
    
    
    
   
    
    
   
}
