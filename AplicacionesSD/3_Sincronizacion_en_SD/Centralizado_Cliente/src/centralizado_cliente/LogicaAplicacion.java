/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package centralizado_cliente;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;

/**
 * Clase que implementa la lógica de la aplicación para el tópico Exclusión
 * Mutua: Algoritmo Centralizado - Cliente.
 * @author Héctor Sam.
 */
public class LogicaAplicacion {

    private static LogicaAplicacion instancia = null;
    private LibreriaMensajes libreriaMensajes;
    private int puertoAgente;
    private DatosAplicacion datosAplicacion;
    private String nodoServidor;
    private String nodoRegionCritica;

 
    

    private LogicaAplicacion(LibreriaMensajes libreriaMensajes,
            DatosAplicacion datosAplicacion,int puertoAgente,String nodoServidor) {
        
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        this.nodoServidor = nodoServidor;

    }
    
    /**
     * Singleton
     * @param libreriaMensajes
     * @param datosAplicacion
     * @param puertoAgente
     * @param nodoServidor
     * @return 
     */
    public static LogicaAplicacion getInstancia (LibreriaMensajes libreriaMensajes,
            DatosAplicacion datosAplicacion,int puertoAgente,String nodoServidor) {
        if (instancia == null ){
            instancia = new LogicaAplicacion(libreriaMensajes,
                    datosAplicacion, puertoAgente, nodoServidor);
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
                 verificarMensaje(mensaje);
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
     * Método que chequea el mensaje recibido en relación al acceso a la región
     * crítica.
     * @param mensaje El mensaje recibido.
     * @return True si el mensaje pertenece a un nodo o al servidor. False en
     * caso contrario.
     */
    public boolean verificarMensaje (Mensaje mensaje) {
        
        if (mensaje.getMensaje().contains("_aprobado")) {
                    System.out.println("El nodo se encuentra accediendo a la"
                            + " región critica de: "+nodoRegionCritica);
                    libreriaMensajes.enviarMensaje("El nodo se encuentra "
                            + "accediendo a la región critica de: "
                            +nodoRegionCritica);
                    return  true;
        } else if (mensaje.getMensaje().contains("_rechazado")){
                    System.out.println("No se puede acceder al nodo: "
                            +nodoRegionCritica);
                    libreriaMensajes.enviarMensaje("No se puede acceder al nodo:"
                            + " "+nodoRegionCritica);
                    return  true;
        } else if (mensaje.getMensaje().contains(":acceder") 
                         || mensaje.getMensaje().contains(":salir")) {
                     enviarMensaje(mensaje.getMensaje());
                     return  true;
        } else {
            return false;
        }
        
                 
                 
    }
    
  
    
    /**
     * Método que permite enviar un mensaje al servidor 
     * para solicitar o salir de una región crítica.
     * @param mensaje El mensaje a enviar.
     */
    public void enviarMensaje(String mensaje){
        
        nodoRegionCritica = mensaje.substring(0,mensaje.indexOf(":"));
        if (mensaje.contains("acceder")) {
            libreriaMensajes.enviarMensaje("Solicitando permiso para "
                    + "acceder a la region critica de "+nodoRegionCritica);
        } else {
            libreriaMensajes.enviarMensaje("Saliendo de la region critica de "
                    + ""+nodoRegionCritica);
        }
        libreriaMensajes.enviarMensaje(mensaje,nodoServidor);
       
        
        
    }
    
    
    
    
   
    
    
   
}
