/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package anillo;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;

/**
 * Clase que implementa la lógica de la aplicación para el tópico Anillo
 * @author Héctor Sam.
 */
public class LogicaAplicacion {

    private static LogicaAplicacion instancia = null;
    private LibreriaMensajes libreriaMensajes;
    private int puertoAgente;
    private DatosAplicacion datosAplicacion;
    private boolean coordinador = false;
    private boolean esperaMensajeProcesos = false;
    private boolean envioMensajeCoordinador = false;
    private String proximoNodo;

    private LogicaAplicacion(LibreriaMensajes libreriaMensajes,
            DatosAplicacion datosAplicacion,int puertoAgente, String proximoNodo) {
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        this.proximoNodo = proximoNodo;
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

    public boolean isEsperaMensajeProcesos() {
        return esperaMensajeProcesos;
    }

    public void setEsperaMensajeProcesos(boolean esperaMensajeProcesos) {
        this.esperaMensajeProcesos = esperaMensajeProcesos;
    }

    public boolean isEnvioMensajeCoordinador() {
        return envioMensajeCoordinador;
    }

    public void setEnvioMensajeCoordinador(boolean envioMensajeCoordinador) {
        this.envioMensajeCoordinador = envioMensajeCoordinador;
    }

    public String getProximoNodo() {
        return proximoNodo;
    }

    public void setProximoNodo(String proximoNodo) {
        this.proximoNodo = proximoNodo;
    }
    
    
    
    /**
     * Singleton
     * @param libreriaMensajes
     * @param datosAplicacion
     * @param puertoAgente
     * @param proximoNodo
     * @return 
     */
    public static LogicaAplicacion getInstancia(LibreriaMensajes libreriaMensajes,
            DatosAplicacion datosAplicacion,int puertoAgente, String proximoNodo){
         if (instancia == null){
             instancia = new LogicaAplicacion(libreriaMensajes,
                     datosAplicacion, puertoAgente, proximoNodo);
         }
         return  instancia;
    }

    public boolean isCoordinador() {
        return coordinador;
    }

    public void setCoordinador(boolean coordinador) {
        this.coordinador = coordinador;
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
                 if (mensaje.getMensaje().contains("COORDINADOR")){
                     System.out.println(mensaje.getMensaje());
                     libreriaMensajes.enviarMensaje(mensaje.getMensaje());
                     if (!envioMensajeCoordinador) {
                         enviarMensaje(mensaje.getMensaje(),0);
                     }

                 } else if (mensaje.getMensaje().contains("iniciar")){
                     libreriaMensajes.enviarMensaje("Iniciando la seleccion de coordinador...");
                     enviarMensaje();
                     esperaMensajeProcesos = true;
                     
   
                 }  else if (mensaje.getMensaje().contains("eleccion")){
                     libreriaMensajes.enviarMensaje("Recibido mensaje de eleccion...");
                     if (esperaMensajeProcesos == true) {
                         evaluarMensaje(mensaje);
                     } else {
                         enviarMensaje(mensaje.getMensaje(),1);
                     }
               
                     
                 }
                     
            }
            return true;
        }
        return false;
    }
     
    /**
     * Método que permite enviar el número de proceso al servidor central.
     * @param ipServidor 
     */
    public void enviarId(String ipServidor){
        libreriaMensajes.enviarMensaje("id<"+datosAplicacion.getIdProceso(),
                ipServidor);
    }
      
    /**
     * Método que permite enviar mensaje de elección al nodo siguiente.
     * @return True si el mensaje fue enviado. False en caso contrario.
     */
    public boolean enviarMensaje(){
        
         if (libreriaMensajes.enviarMensaje("eleccion~"+libreriaMensajes.getIpOrigen()+
                 ":"+datosAplicacion.getIdProceso()+"_",proximoNodo) == true) {
            return true;     
         } else {
             return false;
         }
    }
    
    /**
     * Método que permite enviar mensaje al siguiente nodo.
     * @param mensaje El mensaje a enviar.
     * @param tipo 1: Se envía el número de proceso. Caso contrario se envia el
     * mensaje.
     * @return True si el mensaje fue enviado. False en caso contrario.
     */
    public boolean enviarMensaje(String mensaje,int tipo){
        
        if (tipo == 1){
            if (libreriaMensajes.enviarMensaje(mensaje+libreriaMensajes.
            getIpOrigen()+":"+datosAplicacion.getIdProceso()+"_",proximoNodo)){
                return true;
            } else {
                return false;
            }
        } else {
            if (libreriaMensajes.enviarMensaje(mensaje,proximoNodo)) {
                return true;
            } else {
                return false;
            }
        }

    }
    
    
    /**
     * Método que permite verificar el mensaje recibido de otro nodo.
     * @param mensaje El mensaje recibido.
     * @return True.
     */
    public boolean evaluarMensaje(Mensaje mensaje){
        String[] partes = mensaje.getMensaje().split("_");
        int procesoMayor = 0;
        int proceso;
        String ip;
        String ipCoordinador = "";
        for (String string : partes) {
            ip = string.substring(string.indexOf("192."),string.indexOf(":"));
            proceso = Integer.valueOf(string.substring(string.indexOf(":")+1,
                    string.length()));
            if (proceso > procesoMayor){
                procesoMayor = proceso;
                ipCoordinador = ip;
            }
        }
        System.out.println("Se eligió el Coordinador... enviando mensaje...");
        libreriaMensajes.enviarMensaje("Se eligió el Coordinador... enviando mensaje...");
        enviarMensaje("COORDINADOR = "+ipCoordinador.substring(
                ipCoordinador.length()-1,ipCoordinador.length()) 
                +": "+procesoMayor,0);
        envioMensajeCoordinador = true;
    
        
        return true;
    }
    
  
    
  
   
    
    
}
    
    
    
    
    
    
   
    
    
   

