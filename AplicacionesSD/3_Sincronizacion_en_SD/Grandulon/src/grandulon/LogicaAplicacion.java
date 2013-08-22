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
 *
 * @author sam
 */
public class LogicaAplicacion {

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
    

    public LogicaAplicacion(LibreriaMensajes libreriaMensajes, DatosAplicacion datosAplicacion,int puertoAgente) {
        
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        nodosMayores = new ArrayList<>();
        nodosMenores = new ArrayList<>();
        nodosCaidos = new ArrayList<>();
        esperaMensaje = new EsperaMensaje(this,TIEMPO_ESPERA);
      
      

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
                 if (mensaje.getMensaje().contains("COORDINADOR")){
                     System.out.println("El coodinador es :"+mensaje.getIpOrigen());
                     esperaMensaje = new EsperaMensaje(this,TIEMPO_ESPERA);
                     recibiOk = false;
                 }
                 else if (mensaje.getMensaje().contains("iniciar")){
                     enviarMensaje();
                     esperaMensaje.start();
                     
                 }
                 else if (mensaje.getMensaje().contains("eleccion")){
                     evaluarMensaje(mensaje);
                     if (!esperaMensaje.isEmpezar()){
                        esperaMensaje.start();
                        esperaMensaje.setEmpezar(true);
                     }
                 }
                 else if (mensaje.getMensaje().contains("OK"))
                     recibiOk = true;
            }
        };
        return false;
    }
     
    public void enviarId(String ipServidor){
        libreriaMensajes.enviarMensaje(datosAplicacion.getIdProceso(),ipServidor);
    }
    
    
  
    
    public boolean enviarMensaje(){
        
        if (nodosMayores.size()>0){
            for (String ip : nodosMayores)
                if (validarNodo(ip))
                    libreriaMensajes.enviarMensaje(datosAplicacion.getNumeroNodoAplicacion()+":eleccion",ip);
                else
                     nodosCaidos.add(ip);
            return true;
        }
        else return false;
        
        
    }
    
    public boolean enviarMensaje(String mensaje){
        if (nodosMenores.size()>0){
            for (String ip : nodosMenores)
                if (validarNodo(ip))
                    libreriaMensajes.enviarMensaje(mensaje,ip);
                else
                    nodosCaidos.add(ip);
            return true;
        }
        else return false;
    }
    
    public boolean evaluarMensaje(Mensaje mensaje){
        int numeroNodo = Integer.valueOf(mensaje.getMensaje().substring(
                0,mensaje.getMensaje().indexOf(":")));
        
        if (Integer.valueOf(datosAplicacion.getNumeroNodoAplicacion())>numeroNodo){
            libreriaMensajes.enviarMensaje("OK",mensaje.getIpOrigen());
        }
        enviarMensaje();
        eliminarNodosCaidos();
        
        return true;
    }
    
    public void agregarNodos(String nodosMenores,String nodosMayores){
        if (nodosMenores.length()>0){
            String ipMenores[] = nodosMenores.split("-");
            for (String string : ipMenores)
                this.nodosMenores.add(string);
        }
        if (nodosMayores.length()>0){
            String ipMayores[] = nodosMayores.split("-");
            for (String string : ipMayores)
                this.nodosMayores.add(string);
        }
    }
    
    public boolean validarNodo(String ip){
        try {
            Socket socket = new Socket(ip,libreriaMensajes.getPuerto());
            socket.close();
            return true;
        } catch (UnknownHostException ex) { 
        
        } catch (IOException ex) {

        
        }
        return false;
        
    }
    
    public void eliminarNodosCaidos(){
        if (!nodosCaidos.isEmpty())
            nodosCaidos.remove(0);
    }
    
  
   
    
    
}
    
    
    
    
    
    
   
    
    
   

