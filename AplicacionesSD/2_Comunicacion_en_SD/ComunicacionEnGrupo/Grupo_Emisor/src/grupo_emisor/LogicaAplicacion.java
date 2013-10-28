/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package grupo_emisor;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;
import java.io.IOException;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Iterator;

/**
 * Clase que implementa la lógica de la aplicación para el tópico Comunicación
 * en Grupo - Grupo Emisor.
 * @author Héctor Sam.
 */
public class LogicaAplicacion {

    private static LogicaAplicacion instancia = null;
    private LibreriaMensajes libreriaMensajes;
    private int puertoAgente;
    private DatosAplicacion datosAplicacion;
    private ArrayList<String> nodosGrupo;
    private ArrayList<String> nodosCaidos;

    private LogicaAplicacion(LibreriaMensajes libreriaMensajes,
            DatosAplicacion datosAplicacion,int puertoAgente) {
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        this.nodosGrupo = new ArrayList<>();
        nodosCaidos = new ArrayList<>();
        
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

    public ArrayList<String> getNodosGrupo() {
        return nodosGrupo;
    }

    public void setNodosGrupo(ArrayList<String> nodosGrupo) {
        this.nodosGrupo = nodosGrupo;
    }

    public ArrayList<String> getNodosCaidos() {
        return nodosCaidos;
    }

    public void setNodosCaidos(ArrayList<String> nodosCaidos) {
        this.nodosCaidos = nodosCaidos;
    }
    
    
    
    /**
     * Singleton.
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
     * @param ipServidor 
     */
    public void enviarId(String ipServidor){
        libreriaMensajes.enviarMensaje("id<"+datosAplicacion.
                getIdProceso(),ipServidor);
    }
    
    /**
     * Método que permite comprobar la conexión con un host.
     * @param ipHost El host que se quiere comprobar su conexión.
     * @return True si se realizó la conexión. False en caso contrario.
     */
    public boolean comprobarConexionGrupo(String ipHost){
        try {
            Socket socket = new Socket(ipHost,libreriaMensajes.getPuerto());
            socket.close();
            return true;
        } catch (UnknownHostException ex) {
            return false;
        } catch (IOException ex) {
            return false;
        }
        
        
    }
    
    /**
     * Método que permite enviar mensaje a todos los nodos receptores.
     * @param mensaje El mensaje a enviar.
     * @return True si el mensaje fue enviado. False en caso contrario.
     */
    public boolean enviarMensaje(String mensaje){
        Iterator iterator = nodosGrupo.iterator();
        String nodo;
        while (iterator.hasNext()){
            nodo = (String) iterator.next();
            if (!comprobarConexionGrupo(nodo)){
                nodosCaidos.add(nodo);
            } else {
                if (libreriaMensajes.enviarMensaje(mensaje, nodo) == false){
                    return false;
                }
            }
 
        }
        return true;
        
    }
    
    
    /**
     * Método que permite chequear el mensaje recibido para ser envíado a los 
     * nodos receptores.
     * @param mensaje El mensaje recibido.
     * @return True si se pudo enviar el mensaje. False en caso contrario.
     */
    public boolean evaluarMensaje(Mensaje mensaje){
        
         
        if (mensaje.getIpOrigen().contentEquals(libreriaMensajes.
                getIpDestino().get(0))){
            libreriaMensajes.enviarMensaje("Enviando mensaje a los nodos del grupo...") ;
            eliminarNodosCaidos();
            enviarMensaje(mensaje.getMensaje());
            return true;
        }  else if (mensaje.getMensaje().contains("~")){
            nodosGrupo.add(mensaje.getIpOrigen());

            return true;
        } else {  
            return false;
        }
        

    }
    
    
    /**
     * Método que permite eliminar los nodos que no se encuentren activos.
     */
    public void eliminarNodosCaidos(){
        Iterator iterator = nodosCaidos.iterator();
        String nodoCaido = "";
        
        while (iterator.hasNext()){
            nodoCaido = (String) iterator.next();
            nodosGrupo.remove(nodoCaido);
        }
        nodosCaidos = new ArrayList<>();

    }
    
    
   
}
