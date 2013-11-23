/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tipos_de_fallas_cliente;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;

/**
 * Clase que implementa la lógica de la aplicación para el tópico Tipos de Fallas
 * - Cliente.
 * @author Héctor Sam.
 */
public class LogicaAplicacion {

    private static LogicaAplicacion instancia = null;
    private LibreriaMensajes libreriaMensajes;
    private int puertoAgente;
    private DatosAplicacion datosAplicacion;
    private String ipServidor;

    private LogicaAplicacion(LibreriaMensajes libreriaMensajes,
            DatosAplicacion datosAplicacion,int puertoAgente,String ipServidor) {
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        this.ipServidor = ipServidor;
        
    }
    
    /**
     * Singleton.
     * @param libreriaMensajes
     * @param datosAplicacion
     * @param puertoAgente
     * @param ipServidor
     * @return 
     */
    public static LogicaAplicacion getInstancia(LibreriaMensajes libreriaMensajes,
            DatosAplicacion datosAplicacion,int puertoAgente,String ipServidor) {
        if (instancia == null){
            instancia = new LogicaAplicacion(libreriaMensajes, 
                    datosAplicacion, puertoAgente, ipServidor);
        }
        return instancia;
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

    public String getIpServidor() {
        return ipServidor;
    }

    public void setIpServidor(String ipServidor) {
        this.ipServidor = ipServidor;
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
               
                if (mensaje.getIpOrigen().contains(libreriaMensajes
                        .getIpDestino().get(0))){
                    enviarMensaje(mensaje);
                }
                else{
                    libreriaMensajes.enviarMensaje("Mensaje "
                            + "recibido: "+mensaje.getMensaje());
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
        libreriaMensajes.enviarMensaje("Ejecutable inicializado");
    }
    
    /**
     * Método que permite enviar un mensaje al servidor.
     * @param mensaje El mensaje a enviar.
     * @return True si el mensaje fue enviado. False en caso contrario.
     */
    public boolean enviarMensaje(Mensaje mensaje){
        libreriaMensajes.enviarMensaje("Enviando mensaje al servidor...");
        Mensaje mensaje1 = new Mensaje(libreriaMensajes.getIpOrigen(),mensaje.getMensaje());
         if (libreriaMensajes.enviarMensaje(mensaje1, ipServidor)) {
             return true;
         } else {
             return false;
         }
    }
    
    
    

    
    
   
}
