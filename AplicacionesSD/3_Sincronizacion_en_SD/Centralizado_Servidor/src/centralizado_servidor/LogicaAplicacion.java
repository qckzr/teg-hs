/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package centralizado_servidor;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;
import java.util.ArrayList;

/**
 * Clase que implementa la lógica de la aplicación para el tópico Algoritmo
 * Centralizado - Servidor.
 * @author Héctor Sam.
 */
public class LogicaAplicacion {

    private static LogicaAplicacion instancia = null;
    private LibreriaMensajes libreriaMensajes;
    private int puertoAgente;
    private DatosAplicacion datosAplicacion;
    private ArrayList<String> regionCriticaOcupada;
    

    

    private LogicaAplicacion(LibreriaMensajes libreriaMensajes,
            DatosAplicacion datosAplicacion,int puertoAgente) {
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        regionCriticaOcupada = new ArrayList<>();

        
    }
    
    /**
     * Singleton
     * @param libreriaMensajes
     * @param datosAplicacion
     * @param puertoAgente
     * @return 
     */
    public static LogicaAplicacion getInstancia(LibreriaMensajes libreriaMensajes,
            DatosAplicacion datosAplicacion,int puertoAgente) {
        if (instancia == null) {
            instancia = new LogicaAplicacion(libreriaMensajes, datosAplicacion,
                    puertoAgente);
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
                 if (mensaje.getMensaje().contains(":acceder")){
                     responderNodo(mensaje);
                 } else if (mensaje.getMensaje().contains(":salir")) {
                     desocuparRegion(mensaje.getMensaje());
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
        libreriaMensajes.enviarMensaje("id<"+datosAplicacion.getIdProceso(),ipServidor);
    }
    
    /**
     * Método que permite chequear si un nodo puede acceder a una región crítica
     * de otro.
     * @param mensaje El mensaje con el número de nodo.
     * @return True si el nodo puede acceder. False en caso contrario.
     */
    public boolean verificarRegion(String mensaje){
        String numeroNodo= mensaje.substring(0,mensaje.indexOf(":"));
        for (String nodos : regionCriticaOcupada) {
            if (nodos.contentEquals(numeroNodo))
                return false;
        }
        return true;
        
    }
    
    /**
     * Método que permite ocupar una región de un nodo por otro nodo.
     * @param mensaje El mensjae con el número del nodo de la región a ocupar.
     */
    public void ocuparRegion (String mensaje){
        String numeroNodo= mensaje.substring(0,mensaje.indexOf(":"));
        regionCriticaOcupada.add(numeroNodo);
    }
    
    
    /**
     * Método que permite enviar un mensaje al nodo que desea acceder a una 
     * región crítica determinada.
     * @param mensaje El mensaje enviado por el nodo que desea acceder.
     */
    public boolean responderNodo(Mensaje mensaje){
        libreriaMensajes.enviarMensaje("Respondiendo al nodo que desea acceder "
                + "a una region critica...");
        if (verificarRegion(mensaje.getMensaje())){
            ocuparRegion(mensaje.getMensaje());
            if (libreriaMensajes.enviarMensaje("_aprobado", mensaje.getIpOrigen())) {
                return true;
            }else {
                return false;
            }
        }
        else{
             if (libreriaMensajes.enviarMensaje("_rechazado",mensaje.getIpOrigen())){
                 return true;
             } else {
                 return false;
             }
        }
    }
    
    /**
     * Método que permite habilitar una región crítica que se encontraba
     * ocupada.
     * @param mensaje El mensaje con el nodo que contiene la región crítica
     * ocupada.
     */
    public void desocuparRegion(String mensaje){
        String numeroNodo = mensaje.substring(0,mensaje.indexOf(":"));
        regionCriticaOcupada.remove(numeroNodo);
        System.out.println("La región critica del nodo: "+numeroNodo+""
                + " fue liberada");
        libreriaMensajes.enviarMensaje("La región critica del nodo: "
                +numeroNodo+" fue liberada");
    }
    
   
    
    
    
    
    
   
    
    
   
}
