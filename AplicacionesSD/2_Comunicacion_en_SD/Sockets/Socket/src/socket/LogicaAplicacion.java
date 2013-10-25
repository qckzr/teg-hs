/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package socket;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;
import java.util.ArrayList;
import java.util.Iterator;

/**
 * Clase que implementa la lógica de la aplicación para el tópico Sockets.
 * @author Héctor Sam.
 */
public class LogicaAplicacion {

    private static LogicaAplicacion instancia = null;
    private LibreriaMensajes libreriaMensajes;
    private int puertoAgente;
    private DatosAplicacion datosAplicacion;
    private ArrayList<String[]> nodosDisponibles;

    private LogicaAplicacion(LibreriaMensajes libreriaMensajes,
            DatosAplicacion datosAplicacion,int puertoAgente) {
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        nodosDisponibles = new ArrayList<>();
    }
    
    /**
     * Singleton
     * @param libreriaMensajes
     * @param datosAplicacion
     * @param puertoAgente
     * @return 
     */
    public static LogicaAplicacion getInstancia(LibreriaMensajes libreriaMensajes,
            DatosAplicacion datosAplicacion,int puertoAgente){
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

    public ArrayList<String[]> getNodosDisponibles() {
        return nodosDisponibles;
    }

    public void setNodosDisponibles(ArrayList<String[]> nodosDisponibles) {
        this.nodosDisponibles = nodosDisponibles;
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
                if (!evaluarMensaje(mensaje)){
                    System.out.println("Error al enviar el mensaje");
                    libreriaMensajes.enviarMensaje("Error al enviar el mensaje");
                }
            }
        };
        return false;
    }
  
    
    /**
     * Método que permite enviar un mensjae a un nodo.
     * @param opcion 0 = Envía a un nodo. 1 = Envía la respuesta a un nodo
     * @param idNodo El número de nodo o dirección ip.
     * @param mensajeRecibido El mensaje a enviar.
     * @return True si el mensaje pudo ser enviado. False en caso contrario.
     */
    public boolean enviarMensajeNodo(int opcion,String idNodo,
            String mensajeRecibido){
        if (opcion == 0){
            if (libreriaMensajes.enviarMensaje(
                    mensajeRecibido,buscarIpNodo(idNodo))){
                return true;
            }

        } else {
            if(libreriaMensajes.enviarMensaje(mensajeRecibido,idNodo)){
                return true;
            }
        }
        return false;
        
    }
    
    
    /**
     * Método que permite enviar el número de proceso al servidor central.
     * @param ipServidor La dirección ip del servidor central.
     */ 
    public void enviarId(String ipServidor){
        libreriaMensajes.enviarMensaje("id<"+datosAplicacion.
                getIdProceso(),ipServidor);
    }
    
    /**
     * Método que permite agregar un nodo a la lista de nodos locales.
     * @param id El número del nodo.
     * @param ip Su dirección ip.
     * @return True si se agregó a la lista. False en caso contrario.
     */
    public boolean agregarDestinatario(String id,String ip){
        String[] nodo = new String[2];
        nodo[0] = id;
        nodo[1] = ip;
        if (nodosDisponibles.add(nodo)){
            return true;
        } else {
            return  false;
        }
    }
    
    
    /**
     * Método que permite buscar un nodo dado su id de la lista de nodos local.
     * @param id El id del nodo a buscar.
     * @return El nodo a buscar si existe en la lista. "" en caso contrario.
     */
    public String buscarIpNodo(String id){
        Iterator iterator = nodosDisponibles.iterator();
        String[] nodo;
        while (iterator.hasNext()){
            nodo = (String[]) iterator.next();
            if (nodo[0].contentEquals(id)){
                return nodo[1];
            }
        }
        System.out.println("Nodo Invalido.");
        libreriaMensajes.enviarMensaje("Nodo Invalido");
        return "";
    }
    
    
    
    /**
     * Método que permite evaluar el mensaje recibido dependiendo de ciertas
     * condiciones.
     * @param mensaje El mensaje recibido.
     * @return True si el mensaje cumple con algunas de las condiciones. False
     * en caso contrario.
     */
    public boolean evaluarMensaje(Mensaje mensaje){
        String texto = "";
        char idNodo;
        if (mensaje.getMensaje().contains("Respuesta_")){
                    System.out.println("Se recibió una RESPUESTA del host: "
                            +mensaje.getIpOrigen());
                    libreriaMensajes.enviarMensaje("Se recibió una RESPUESTA del"
                            + " host: "+mensaje.getIpOrigen());
                    texto = mensaje.getMensaje();
                    System.out.println(texto.substring(texto.indexOf("_")));
                    libreriaMensajes.enviarMensaje(texto.substring(texto.indexOf("_")+1));
                    return true;
        } else if (mensaje.getIpOrigen().contentEquals(
                libreriaMensajes.getIpDestino().get(0))){
            libreriaMensajes.enviarMensaje("Enviando mensaje...");
            if (mensaje.getMensaje().charAt(1) == ':'){
                idNodo = mensaje.getMensaje().charAt(0);
                if (enviarMensajeNodo(0,""+idNodo,mensaje.getMensaje().
                        substring(2))){
                return true;
                }
            }
        } else{
                   libreriaMensajes.enviarMensaje("Recibiendo un mensaje desde "
                           + "otro nodo...\""+mensaje.getMensaje()+"\""); 
                    if (enviarMensajeNodo(1,mensaje.getIpOrigen(),
                            "Respuesta_Mensaje de respuesta al mensaje recibido"
                                    + " \""+mensaje.getMensaje()+"\"")){
                        return true;
                    }
        }
        return false;
     
        
    }
}
