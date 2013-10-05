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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author sam
 */
public class LogicaAplicacion {

    private LibreriaMensajes libreriaMensajes;
    private int puertoAgente;
    private DatosAplicacion datosAplicacion;
    private static final int PORT = 1099;
    private static Registry registry;
    private static String  ipServidor;
    private String lookUp = "RMIServer";
    
    
    

    public LogicaAplicacion(LibreriaMensajes libreriaMensajes, DatosAplicacion datosAplicacion,int puertoAgente, String ipServidor) {
        
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        LogicaAplicacion.ipServidor = ipServidor;
        iniciarCliente();

    }

  
    public boolean verificarMensajeRecibido(Mensaje mensaje){
        switch (mensaje.getMensaje()){
            case "aplicacion": 
                if (libreriaMensajes.enviarMensaje(datosAplicacion.getNombreAplicacion(),"localhost", puertoAgente))
                    return true;
                break;
            case "nodo":
                if (libreriaMensajes.enviarMensaje(datosAplicacion.getNumeroNodoAplicacion(),"localhost",puertoAgente))
                    return true;
                break;
            default:{
                 
                 System.out.println("Se ha recibido el mensaje: \""+mensaje.getMensaje()+"\" proveniente del host: "+mensaje.getIpOrigen());
                 mensaje(mensaje.getMensaje());
                 
            }
        };
        return false;
    }
     
    public void enviarId(String ipServidor){
        libreriaMensajes.enviarMensaje("id<"+datosAplicacion.getIdProceso(),ipServidor);
    }
    
    
    public static void iniciarCliente(){
        try {
            registry = LocateRegistry.getRegistry(ipServidor, PORT);
            System.setProperty("java.security.policy","file:///home/pi/Desktop/rmi.policy");
            System.setSecurityManager(new RMISecurityManager());
        } catch (RemoteException ex) {
            Logger.getLogger(LogicaAplicacion.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    public void mensaje(String mensaje){
        try {
          
            MensajesRemotos mensajesRemotos = (MensajesRemotos) 
                  Naming.lookup("//"+ipServidor+"/"+lookUp);  
            switch (mensaje){
                case "hora":  System.out.println(mensajesRemotos.horaActual());
                    libreriaMensajes.enviarMensaje(mensajesRemotos.horaActual());
                   
                    break;
                case "fecha": System.out.println(mensajesRemotos.fechaActual());
                    libreriaMensajes.enviarMensaje(mensajesRemotos.fechaActual());
                    break;
                case "saludo": System.out.println(mensajesRemotos.saludos());
                    libreriaMensajes.enviarMensaje(mensajesRemotos.saludos());
                    break;
                default:
                    System.out.println("Opcion no valida");
                    libreriaMensajes.enviarMensaje("Opcion no valida");
            };
            
            
        } catch (MalformedURLException ex) {
            Logger.getLogger(LogicaAplicacion.class.getName()).log(Level.SEVERE, null, ex);
        } catch (RemoteException ex) {
            Logger.getLogger(LogicaAplicacion.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NotBoundException ex) {
            Logger.getLogger(LogicaAplicacion.class.getName()).log(Level.SEVERE, null, ex);
        } 
        
    }
    
  
    
    
    
   
    
   
    
   
  
   
    
    
}
    
    
    
    
    
    
   
    
    
   

