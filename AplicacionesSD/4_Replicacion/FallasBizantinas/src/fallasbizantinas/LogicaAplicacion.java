/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package fallasbizantinas;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;
import java.util.ArrayList;

/**
 *
 * @author sam
 */
public class LogicaAplicacion {

    private LibreriaMensajes libreriaMensajes;
    private int puertoAgente;
    private DatosAplicacion datosAplicacion;
    private ArrayList<String> nodos;
    private String vectorProcesos;
    private String[] vectorDemasProcesos;
    private String nodo1;
    private String nodo2;
    private String nodo3;
    private String[] vectorFinal;
    

    public LogicaAplicacion(LibreriaMensajes libreriaMensajes, DatosAplicacion datosAplicacion,int puertoAgente) {
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        nodos = new ArrayList<>();
        vectorDemasProcesos = new String[3];
        vectorDemasProcesos[0] = "";
        vectorDemasProcesos[1] = "";
        vectorDemasProcesos[2] = "";
        vectorFinal = new String[4];
        
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
                if (mensaje.getMensaje().contains("id")){
                    enviarMensaje(1);
                }
                else if (mensaje.getMensaje().contains("numero:")){
                    colocarNumero(mensaje);
                }
                else if (mensaje.getMensaje().contains("vector:")){
                    colocarVector(mensaje);
                }
                
            }
        };
        return false;
    }
     
    public void enviarId(String ipServidor){
        libreriaMensajes.enviarMensaje(datosAplicacion.getIdProceso(),ipServidor);
    }
    
    
    public void agregarNodo(String ip){
        nodos.add(ip);
    }
    
    public void enviarMensaje(int opcion){
        String mensaje = "";
        switch (opcion){
            case 1: 
                mensaje ="numero:"+datosAplicacion.getNumeroNodoAplicacion();
                break;
        }
        
        for (String nodo : nodos) {
            libreriaMensajes.enviarMensaje(mensaje, nodo);
        }
    }
    
    public void colocarNumero(Mensaje mensaje){
        
        if (mensaje.getIpOrigen().contentEquals(nodos.get(0)))
            nodo1 = mensaje.getMensaje().substring(mensaje.getMensaje().charAt(':')+1);
        else if (mensaje.getIpOrigen().contentEquals(nodos.get(1)))
            nodo2 = mensaje.getMensaje().substring(mensaje.getMensaje().charAt(':')+1);
        else
            nodo3 = mensaje.getMensaje().substring(mensaje.getMensaje().charAt(':')+1);
        
        
        if (nodo1.length()>0 && nodo2.length()>0 && nodo3.length()>0){
            vectorProcesos = nodo1+"-"+nodo2+"-"+nodo3;
            enviarVector();
        }
    }
    
    public void enviarVector(){
        for (String nodo : nodos) {
            libreriaMensajes.enviarMensaje("vector:"+vectorProcesos);
        }
        
    }
    
    
    public void colocarVector(Mensaje mensaje){
        String vector = mensaje.getMensaje().substring(mensaje.getMensaje().charAt(':')+1);
        if (mensaje.getIpOrigen().contentEquals(nodos.get(0)))
            vectorDemasProcesos[0] = vector;
        else if (mensaje.getIpOrigen().contentEquals(nodos.get(1)))
            vectorDemasProcesos[1] = vector;
        else
            vectorDemasProcesos[2] = vector;
        
        if (vectorDemasProcesos[0].length()>0 && vectorDemasProcesos[1].length()>0 && vectorDemasProcesos[2].length()>0){
            calcularVector();
        }
    }
    
    
    public void calcularVector(){
        
        switch (datosAplicacion.getNombreAplicacion()){
            case 1:
                
                break;
            case 2:
                break;
            case 3:
                break;
            case 4:
                break;
        }
        
        
    }
    
    public void comparar(String[] vector,String nodo){
       String []casillas = vectorProcesos.split("-");
    }
    
    
   
    
   

    
    
   
}
