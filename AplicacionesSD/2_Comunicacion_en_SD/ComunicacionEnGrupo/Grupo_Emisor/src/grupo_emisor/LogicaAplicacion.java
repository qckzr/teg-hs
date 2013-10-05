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
 *
 * @author sam
 */
public class LogicaAplicacion {

    private LibreriaMensajes libreriaMensajes;
    private int puertoAgente;
    private DatosAplicacion datosAplicacion;
    private ArrayList<String> nodosGrupo;
    private ArrayList<String> nodosCaidos;

    public LogicaAplicacion(LibreriaMensajes libreriaMensajes, DatosAplicacion datosAplicacion,int puertoAgente) {
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        this.nodosGrupo = new ArrayList<>();
        nodosCaidos = new ArrayList<>();
        
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
                if (!evaluarMensaje(mensaje)){
                    System.out.println("Error al enviar el mensaje");
                    libreriaMensajes.enviarMensaje("Error al enviar el mensaje");
                }
            }
        };
        return false;
    }
     
    public void enviarId(String ipServidor){
        libreriaMensajes.enviarMensaje("id<"+datosAplicacion.getIdProceso(),ipServidor);
    }
    
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
    
    public boolean enviarMensaje(String mensaje){
        Iterator iterator = nodosGrupo.iterator();
        while (iterator.hasNext()){
            String nodo = (String) iterator.next();
            if (!comprobarConexionGrupo(nodo))
                nodosCaidos.add(nodo);
            else
                libreriaMensajes.enviarMensaje(mensaje, nodo);
 
        }
        return true;
        
    }
    
    
    public boolean evaluarMensaje(Mensaje mensaje){
        
         
        if (mensaje.getIpOrigen().contentEquals(libreriaMensajes.getIpDestino().get(0))){
            libreriaMensajes.enviarMensaje("Enviando mensaje a los nodos del grupo...") ;
            eliminarNodosCaidos();
            enviarMensaje(mensaje.getMensaje());
            return true;
        }
        
        else if (mensaje.getMensaje().contains("~")){
            nodosGrupo.add(mensaje.getIpOrigen());

            return true;
        }
        else  
            return false;
        

    }
    
    public void eliminarNodosCaidos(){
        Iterator iterator = nodosCaidos.iterator();
        while (iterator.hasNext()){
            String nodoCaido = (String) iterator.next();
            nodosGrupo.remove(nodoCaido);
        }
        nodosCaidos = new ArrayList<>();

    }
    
    
   
}
