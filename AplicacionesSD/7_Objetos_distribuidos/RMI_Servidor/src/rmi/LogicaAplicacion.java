/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package rmi;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;
import java.rmi.AccessException;
import java.rmi.AlreadyBoundException;
import java.rmi.RemoteException;
import java.rmi.registry.Registry;
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
    private static MensajesRemotosImpl mensajesRemotosImpl;
    private static Registry registry;
    
    
    

    private LogicaAplicacion(LibreriaMensajes libreriaMensajes,
            DatosAplicacion datosAplicacion,int puertoAgente) {
        
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
     
       iniciarServidor();
       

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

    public static MensajesRemotosImpl getMensajesRemotosImpl() {
        return mensajesRemotosImpl;
    }

    public static void setMensajesRemotosImpl(MensajesRemotosImpl mensajesRemotosImpl) {
        LogicaAplicacion.mensajesRemotosImpl = mensajesRemotosImpl;
    }

    public static Registry getRegistry() {
        return registry;
    }

    public static void setRegistry(Registry registry) {
        LogicaAplicacion.registry = registry;
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
        
        if (instancia == null){
            instancia = new LogicaAplicacion(libreriaMensajes, datosAplicacion, puertoAgente);
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
                 libreriaMensajes.enviarMensaje(
                         mensaje.getMensaje());
                 
            }
        };
        return false;
    }
    
    /**
     * Método que permite enviar el número de proceso al servidor central.
     * @param ipServidor 
     */
    public void enviarId(String ipServidor){
        libreriaMensajes.enviarMensaje("id<"+datosAplicacion.getIdProceso(),
                ipServidor);
        libreriaMensajes.enviarMensaje("Ejecutable inicializado");
    }
    
    
    /**
     * Método que permite iniciar el servidor para que los clientes puedan
     * invocar sus métodos remotamente.
     * @return True si se pudo iniciar el servidor. False en caso contrario.
     */
    public static boolean iniciarServidor(){
        try {
            mensajesRemotosImpl = new MensajesRemotosImpl();
            System.setProperty("java.security.policy","file:///home/pi/Desktop/rmiServer.policy");
            registry = java.rmi.registry.LocateRegistry.createRegistry(1099);
            registry.bind("RMIServer", mensajesRemotosImpl);
            return  true;
        } catch (AlreadyBoundException ex) {
            Logger.getLogger(LogicaAplicacion.class.getName()).
                    log(Level.SEVERE, null, ex);
            return false;
        } catch (AccessException ex) {
            Logger.getLogger(LogicaAplicacion.class.getName()).
                    log(Level.SEVERE, null, ex);
            return false;
        } catch (RemoteException ex) {
            Logger.getLogger(LogicaAplicacion.class.getName()).
                    log(Level.SEVERE, null, ex);
            return false;
        }
        
    }
    
  
    
    
    
   
    
   
    
   
  
   
    
    
}
    
    
    
    
    
    
   
    
    
   

