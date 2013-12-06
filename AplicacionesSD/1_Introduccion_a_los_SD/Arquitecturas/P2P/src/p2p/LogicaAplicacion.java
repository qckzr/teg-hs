    /*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package p2p;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;

/**
 * Clase que proporciona la lógica del tópico Peer to Peer.
 * @author Héctor Sam
 */
public class LogicaAplicacion {

    private static LogicaAplicacion instancia = null;
    private LibreriaMensajes libreriaMensajes;
    private int puertoAgente;
    private DatosAplicacion datosAplicacion;
    private String nodoSiguiente;

    

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

    public String getNodoSiguiente() {
        return nodoSiguiente;
    }

    public void setNodoSiguiente(String nodoSiguiente) {
        this.nodoSiguiente = nodoSiguiente;
    }
    
    

    private LogicaAplicacion(LibreriaMensajes libreriaMensajes,
            DatosAplicacion datosAplicacion,int puertoAgente,String nodoSiguiente) {
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        this.nodoSiguiente = nodoSiguiente;
        
    }
    
    /**
     * Singleton
     * @param libreriaMensajes
     * @param datosAplicacion
     * @param puertoAgente
     * @param nodoSiguiente
     * @return 
     */
    public static LogicaAplicacion getInstancia(LibreriaMensajes libreriaMensajes,
            DatosAplicacion datosAplicacion,int puertoAgente,String nodoSiguiente){
         if (instancia == null){
             instancia = new LogicaAplicacion(libreriaMensajes,
                     datosAplicacion, puertoAgente, nodoSiguiente);
         }
         return  instancia;
    }
    
    /**
     * Método que chequea el tipo de mensaje recibido.
     * @param mensaje El mensaje recibido.
     * @return True si es un mensaje del agente. False en caso contrario.
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
                
                System.out.println("Se ha recibido el mensaje: \""+mensaje.
                        getMensaje()+"\" proveniente del host: "+mensaje.getIpOrigen());
                if (!evaluarMensaje(mensaje)){
                    System.out.println("Error al enviar el mensaje");
                    libreriaMensajes.enviarMensaje("Error al enviar el mensaje");
                }
            }
        };
        return false;
    }
    
    /**
     * Método que permite enviar el número de proceso al servidor central.
     * @param ipServidor La dirección ip del servidor central.
     */
    public void enviarId(String ipServidor){
        libreriaMensajes.enviarMensaje("id<"+datosAplicacion.
                getIdProceso(),ipServidor);
        libreriaMensajes.enviarMensaje("Ejecutable inicializado");
    }
    
    /**
     * Método que permite enviar un mensaje al siguiente nodo.
     * @param mensaje El mensaje a enviar.
     * @return True si el mensaje fue enviado. False en caso contrario.
     */
    public boolean enviarMensaje(Mensaje mensaje){
        
        if (libreriaMensajes.enviarMensaje(mensaje, nodoSiguiente)){
            return true;
        } else {
            return false;
        }
        
        
    }
    
    /**
     * Método que permite reenviar un mensaje al siguiente nodo.
     * @param mensaje El mensaje recibido.
     * @param ipOrigen La dirección ip del nodo destinatario.
     * @return True si el mensaje fue enviado. False en caso contrario.
     */
    public boolean enviarMensaje(String mensaje,String ipOrigen){

        Mensaje mensajeAenviar = new Mensaje(ipOrigen, mensaje);
        
        if (libreriaMensajes.enviarMensaje(mensajeAenviar, nodoSiguiente)){
            return true;
        } else {
            return false;
        }
    }
    
    
    /**
     * Método que permite verificar el mensaje recibido por otro nodo.
     * @param mensaje El mensaje recibido.
     * @return True si el mensaje cumple con ciertas condiciones. False en 
     * caso contrario.
     */
    public boolean evaluarMensaje(Mensaje mensaje){
        char idNodo;
         
        if (mensaje.getIpOrigen().contentEquals(libreriaMensajes.
                getIpDestino().get(0))){
            libreriaMensajes.enviarMensaje("Enviando '"+mensaje.getMensaje().
                    substring(mensaje.getMensaje().indexOf(":")+1)+"' al nodo "
                    +mensaje.getMensaje().substring(0,mensaje.getMensaje().indexOf(":")));
            String texto = mensaje.getMensaje()+"~"+datosAplicacion.
                    getNumeroNodoAplicacion();
            enviarMensaje(texto,libreriaMensajes.getIpOrigen());
            return true;
        } else if (mensaje.getMensaje().charAt(1)==':'){
            idNodo = mensaje.getMensaje().charAt(0);
            if (idNodo != datosAplicacion.getNumeroNodoAplicacion().charAt(0)){
                libreriaMensajes.enviarMensaje("Enviando mensaje al siguiente nodo...");
                enviarMensaje(mensaje);
                return true;
            } else {
                    if (mensaje.getMensaje().contains("Respuesta_")){
                        System.out.println("Se recibió un mensaje de RESPUESTA del host: "
                                +mensaje.getIpOrigen());
                        libreriaMensajes.enviarMensaje(
                                "Se recibió un mensaje de RESPUESTA del host: "+
                                mensaje.getIpOrigen());
                        String texto = mensaje.getMensaje();
                        System.out.println(texto.substring(texto.indexOf("_")+1));
                        libreriaMensajes.enviarMensaje(texto.substring(
                                texto.indexOf("_")+1));
                        return true;
                    }
                    else{
                       
                        String nodoOrigen = mensaje.getMensaje().
                                substring(mensaje.getMensaje().indexOf("~")+1);
                        String m = mensaje.getMensaje().
                                substring(mensaje.getMensaje().indexOf(":")+1,
                                mensaje.getMensaje().indexOf("~"));
                         libreriaMensajes.enviarMensaje(
                                 "Respondiendo al nodo que envio el mensaje: "
                                         + "'"+m+"'");
                        String mensajeRespuesta = nodoOrigen+
                                ":Respuesta_Mensaje de respuesta al"
                                + " mensaje recibido: \""+m+"\"";
                        if (enviarMensaje(mensajeRespuesta,
                                libreriaMensajes.getIpOrigen())){
                            return true;
                        }

                    }
                }
        }  
        return false;

    }
    
    
   
}
