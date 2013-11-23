/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package socketservidor;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;

/**
 * Clase que implementa la lógica de la aplicación para el tópico Arquitectura
 * Cliente Servidor - Servidor.
 * @author Héctor Sam.
 */
public class LogicaAplicacion {

    private static LogicaAplicacion instancia = null;
    private LibreriaMensajes libreriaMensajes;
    private int puertoAgente;
    private DatosAplicacion datosAplicacion;

    public static LogicaAplicacion getInstancia() {
        return instancia;
    }

    public static void setInstancia(LogicaAplicacion instancia) {
        LogicaAplicacion.instancia = instancia;
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
    
    
    
    private LogicaAplicacion(LibreriaMensajes libreriaMensajes,
            DatosAplicacion datosAplicacion,int puertoAgente) {
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
    }
    
    /**
     * Singleton
     * @param libreriaMensajes
     * @param datosAplicacion
     * @param puertoAgente 
     */
    public static LogicaAplicacion getInstance(LibreriaMensajes libreriaMensajes,
            DatosAplicacion datosAplicacion,int puertoAgente){
        if (instancia == null){
            instancia = new LogicaAplicacion(libreriaMensajes, datosAplicacion,
                    puertoAgente);
        }
        return  instancia;
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
                        getNombreAplicacion(),"localhost", puertoAgente)){
                    return true;
                }
                break;
            case "nodo":
                if (libreriaMensajes.enviarMensaje(datosAplicacion.
                        getNumeroNodoAplicacion(),"localhost",puertoAgente)){
                    return true;
                }
                break;
            default:{
                System.out.println("Se ha recibido el mensaje: \""
                        +mensaje.getMensaje()+"\" proveniente del host: "
                        +mensaje.getIpOrigen());
                enviarMensajeRespuesta(mensaje);
            }
        };
        return false;
    }
    
    /**
     * Método que permite enviar un mensaje de respuesta al recibir un mensaje
     * por parte de un nodo cliente.
     * @param mensajeRecibido El mensaje del nodo cliente.
     * @return True si el mensaje fue enviado. False en caso contrario.
     */
    public boolean enviarMensajeRespuesta(Mensaje mensajeRecibido){
        String mensajeAenviar ="Respondiendo al host "+mensajeRecibido.getIpOrigen()+""
                + " quien envió el mensaje \""+mensajeRecibido.getMensaje()+"\"";
        libreriaMensajes.enviarMensaje(mensajeAenviar);
        if (libreriaMensajes.enviarMensaje(mensajeAenviar,
                mensajeRecibido.getIpOrigen())){
            return true;
        }
            
        else {
            return false;
        }
        
        
    }
   
    
    /**
     * Método que permite enviar el número de proceso de la aplicación al
     * servidor central.
     * @param ipServidor La dirección ip del servidor central. 
     */
    public void enviarId(String ipServidor){
        libreriaMensajes.enviarMensaje("id<"+datosAplicacion.
                getIdProceso(),ipServidor);
        libreriaMensajes.enviarMensaje("Ejecutable inicializado");
    }
    
}
