/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;
import java.net.MalformedURLException;
import java.rmi.Naming;
import java.rmi.NotBoundException;
import java.rmi.RMISecurityManager;
import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import java.security.AccessControlException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Clase que implementa la lógica de la aplicación para el tópico RMI.
 * @author Héctor Sam.
 */
public class LogicaAplicacion {
    
    private static LogicaAplicacion instancia = null;
    private LibreriaMensajes libreriaMensajes;
    private int puertoAgente;
    private DatosAplicacion datosAplicacion;
    private static final int PORT = 1099;
    private static Registry registry;
    private static String  ipServidor;
    private String lookUp = "RMIServer";
    
    
    

    private LogicaAplicacion(LibreriaMensajes libreriaMensajes,
            DatosAplicacion datosAplicacion,int puertoAgente, String ipServidor) {
        
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        LogicaAplicacion.ipServidor = ipServidor;
        iniciarCliente();

    }
    
    /**
     * Singleton
     * @param libreriaMensajes
     * @param datosAplicacion
     * @param puertoAgente
     * @param ipServidor
     * @return 
     */
    public static LogicaAplicacion getInstancia(LibreriaMensajes libreriaMensajes,
            DatosAplicacion datosAplicacion,int puertoAgente, String ipServidor){
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

    public static Registry getRegistry() {
        return registry;
    }

    public static void setRegistry(Registry registry) {
        LogicaAplicacion.registry = registry;
    }

    public static String getIpServidor() {
        return ipServidor;
    }

    public static void setIpServidor(String ipServidor) {
        LogicaAplicacion.ipServidor = ipServidor;
    }

    public String getLookUp() {
        return lookUp;
    }

    public void setLookUp(String lookUp) {
        this.lookUp = lookUp;
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
                 mensaje(mensaje.getMensaje());
                 
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
     * Método que permite inicializar la conexión con el servidor.
     * @return True si se realizó la conexión. False en caso contrario.
     */
    public static boolean iniciarCliente(){
        try {
            registry = LocateRegistry.getRegistry(ipServidor, PORT);
            System.setProperty("java.security.policy","file:///home/pi/Desktop/rmi.policy");
            System.setSecurityManager(new RMISecurityManager());
            return  true;
        } catch (RemoteException ex) {
            Logger.getLogger(LogicaAplicacion.class.getName()).
                    log(Level.SEVERE, null, ex);
            return  false;
        }
        
    }
    
    /**
     * Método que permite invocar los métodos remotamente del servidor.
     * @param mensaje El mensaje a invocar.
     * @return True si se logró realizar la invocación. False en caso contrario.
     */
    public boolean mensaje(String mensaje){
        MensajesRemotos mensajesRemotos;
        try {
          
            mensajesRemotos = (MensajesRemotos) 
                  Naming.lookup("//"+ipServidor+"/"+lookUp);  
            switch (mensaje){
                case "hora":  System.out.println(mensajesRemotos.horaActual());
                    libreriaMensajes.enviarMensaje(mensajesRemotos.horaActual());
                    return  true;
                case "fecha": System.out.println(mensajesRemotos.fechaActual());
                    libreriaMensajes.enviarMensaje(mensajesRemotos.fechaActual());
                    return  true;
                case "saludo": System.out.println(mensajesRemotos.saludos());
                    libreriaMensajes.enviarMensaje(mensajesRemotos.saludos());
                    return  true;
                default:
                    System.out.println("Opcion no valida");
                    libreriaMensajes.enviarMensaje("Opcion no valida");
                    return false;
            }
            
            
        } catch (MalformedURLException ex) {
            Logger.getLogger(LogicaAplicacion.class.getName()).
                    log(Level.SEVERE, null, ex);
            return  false;
        } catch (RemoteException ex) {
            Logger.getLogger(LogicaAplicacion.class.getName()).
                    log(Level.SEVERE, null, ex);
            return  false;
        } catch (NotBoundException ex) {
            Logger.getLogger(LogicaAplicacion.class.getName()).
                    log(Level.SEVERE, null, ex);
            return  false;
        } catch (AccessControlException ex){
            Logger.getLogger(LogicaAplicacion.class.getName()).
                    log(Level.SEVERE, null, ex);
            return  false;
        }
        
    }
    
  
    
    
    
   
    
   
    
   
  
   
    
    
}
    
    
    
    
    
    
   
    
    
   

