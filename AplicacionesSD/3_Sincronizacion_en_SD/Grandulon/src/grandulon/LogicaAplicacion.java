/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package grandulon;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;
import java.io.IOException;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.ArrayList;

/**
 * Clase que implementa la lógica de la aplicación para el tópico Algoritmos de 
 * Selección: Grandulón.
 * @author Héctor Sam.
 */
public class LogicaAplicacion {

    private static LogicaAplicacion instancia = null;
    private LibreriaMensajes libreriaMensajes;
    private int puertoAgente;
    private DatosAplicacion datosAplicacion;
    private ArrayList<String> nodosMayores;
    private boolean coordinador = false;
    private ArrayList<String> nodosMenores;
    private boolean recibiOk = false;
    private EsperaMensaje esperaMensaje;
    private final static int TIEMPO_ESPERA = 5000;
    private ArrayList<String> nodosCaidos;
    

    private LogicaAplicacion(LibreriaMensajes libreriaMensajes,
            DatosAplicacion datosAplicacion,int puertoAgente) {
        
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        nodosMayores = new ArrayList<>();
        nodosMenores = new ArrayList<>();
        nodosCaidos = new ArrayList<>();
        esperaMensaje = new EsperaMensaje(this,TIEMPO_ESPERA);
      
      

    }
    
    /**
     * Singleton
     * @param libreriaMensajes
     * @param datosAplicacion
     * @param puertoAgente
     * @return 
     */
    public static LogicaAplicacion instancia (LibreriaMensajes libreriaMensajes,
            DatosAplicacion datosAplicacion,int puertoAgente) {
        if (instancia == null) {
            instancia = new LogicaAplicacion(libreriaMensajes, datosAplicacion,
                    puertoAgente);
        }
        return  instancia;
    }

    public ArrayList<String> getNodosMayores() {
        return nodosMayores;
    }

    public void setNodosMayores(ArrayList<String> nodosMayores) {
        this.nodosMayores = nodosMayores;
    }

    public ArrayList<String> getNodosMenores() {
        return nodosMenores;
    }

    public void setNodosMenores(ArrayList<String> nodosMenores) {
        this.nodosMenores = nodosMenores;
    }

    public boolean isRecibiOk() {
        return recibiOk;
    }

    public void setRecibiOk(boolean recibiOk) {
        this.recibiOk = recibiOk;
    }

    public boolean isCoordinador() {
        return coordinador;
    }

    public void setCoordinador(boolean coordinador) {
        this.coordinador = coordinador;
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

    public EsperaMensaje getEsperaMensaje() {
        return esperaMensaje;
    }

    public void setEsperaMensaje(EsperaMensaje esperaMensaje) {
        this.esperaMensaje = esperaMensaje;
    }

    public ArrayList<String> getNodosCaidos() {
        return nodosCaidos;
    }

    public void setNodosCaidos(ArrayList<String> nodosCaidos) {
        this.nodosCaidos = nodosCaidos;
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
                 recibirMensaje(mensaje);
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
    
    public boolean recibirMensaje (Mensaje mensaje) {
        
        if (mensaje.getMensaje().contains("COORDINADOR")){
                     System.out.println("El coodinador es :"+mensaje.getIpOrigen());
                     libreriaMensajes.enviarMensaje("El coodinador es: "
                             +mensaje.getIpOrigen().substring(mensaje.
                                     getIpOrigen().length()-1,mensaje.
                                    getIpOrigen().length()));
                     esperaMensaje = new EsperaMensaje(this,TIEMPO_ESPERA);
                     recibiOk = false;
                     return  true;
        } else if (mensaje.getMensaje().contains("iniciar")){
                libreriaMensajes.enviarMensaje("Iniciando eleccion de"
                             + " coordinador...");
                enviarMensaje();
                esperaMensaje.start();
                return  true;
                     
        } else if (mensaje.getMensaje().contains("eleccion")){
                     libreriaMensajes.enviarMensaje("Recibiendo mensaje de"
                             + " eleccion...");
                     evaluarMensaje(mensaje);
                     if (!esperaMensaje.isEmpezar()){
                        esperaMensaje.start();
                        esperaMensaje.setEmpezar(true);
                     }
                     return  true;
        } else if (mensaje.getMensaje().contains("OK")) {
                     recibiOk = true;
                     return  true;
        }
        return  false;
    }
    
    
    
  
    
    /**
     * Método que permite enviar mensaje a los nodos mayores que el nodo actual
     * @return True si existen nodos mayores que el. False en caso contrario.
     */
    public boolean enviarMensaje(){
        
        if (nodosMayores.size() > 0){
            for (String ip : nodosMayores){
                if (validarNodo(ip)){
                    libreriaMensajes.enviarMensaje(datosAplicacion.
                            getNumeroNodoAplicacion()+":eleccion",ip);
                } else {
                     nodosCaidos.add(ip);
                }
            }
            return true;
        }
        else {
            return false;
        }
        
        
    }
    
    /**
     * Método que permite enviar mensaje a todos los nodos menores que el nodo
     * actual.
     * @param mensaje El mensaje a enviar.
     * @return  True si se envió a todos los nodos. False en caso contrario.
     */
    public boolean enviarMensaje(String mensaje){
        if (nodosMenores.size()>0){
            for (String ip : nodosMenores){
                if (validarNodo(ip)) {
                    libreriaMensajes.enviarMensaje(mensaje,ip);
                } else {
                    nodosCaidos.add(ip);
                }
            }
            return true;
        } else {
            return false;
        }
        }
    
    
    /**
     * Método que permite evaluar el mensaje enviado por los demás nodos.
     * @param mensaje El mensaje enviado por un nodo.
     * @return True.
     */
    public boolean evaluarMensaje(Mensaje mensaje){
        int numeroNodo = Integer.valueOf(mensaje.getMensaje().substring(
                0,mensaje.getMensaje().indexOf(":")));
        
        if (Integer.valueOf(datosAplicacion.getNumeroNodoAplicacion()) > numeroNodo){
            libreriaMensajes.enviarMensaje("OK",mensaje.getIpOrigen());
        }
        enviarMensaje();
        eliminarNodosCaidos();
        
        return true;
    }
    
    /**
     * Método que permite agregar los nodos mayores o menores a la listas.
     * @param nodosMenores Nodos menores que el nodo actual.
     * @param nodosMayores Nodos mayores que el nodo actual.
     */
    public void agregarNodos(String nodosMenores,String nodosMayores){
        String ips[];
        if (nodosMenores.length() > 0){
            ips = nodosMenores.split("-");
            for (String string : ips)
                this.nodosMenores.add(string);
        }
        if (nodosMayores.length()>0){
            ips = nodosMayores.split("-");
            for (String string : ips)
                this.nodosMayores.add(string);
        }
    }
    
    /**
     * Método que permite validar si un nodo se encuentra activo.
     * @param ip La dirección ip del nodo que se quiere validar.
     * @return True si se encuentra activo. False en caso contrario.
     */
    public boolean validarNodo(String ip){
        try {
            Socket socket = new Socket(ip,libreriaMensajes.getPuerto());
            socket.close();
            return true;
        } catch (UnknownHostException ex) { 
            return  false;
        } catch (IOException ex) {
            return false;
        }
        
    }
    
    /**
     * Método que permite eliminar los nodos que no se encuentran activos
     * en el sistema distribuido.
     * @return True si se eliminó el último nodo. False en caso contrario.
     */
    public boolean eliminarNodosCaidos(){
        
        if (!nodosCaidos.isEmpty()){
            nodosCaidos.remove(0);
            return true;
        } else {
            return false;
        }
        
    }
    
  
   
    
    
}
    
    
    
    
    
    
   
    
    
   

