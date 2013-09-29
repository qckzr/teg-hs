/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dns_servidor;

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
    private ArrayList<String[]> sitios;
    
    

    public LogicaAplicacion(LibreriaMensajes libreriaMensajes, DatosAplicacion datosAplicacion,int puertoAgente) {
        
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        sitios = new ArrayList<>();
        iniciar();

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
                 if (mensaje.getMensaje().contains(":")){
                     agregarSitio(mensaje.getMensaje());
                 }
                 else{
                     enviarMensaje(mensaje);
                 }
                 
            }
        };
        return false;
    }
     
    public void enviarId(String ipServidor){
        libreriaMensajes.enviarMensaje("id<"+datosAplicacion.getIdProceso(),ipServidor);
    }
    
    
  
    
    public boolean enviarMensaje(Mensaje mensaje){
        libreriaMensajes.enviarMensaje(retornarIp(mensaje.getMensaje()),mensaje.getIpOrigen());
        return true;
        
        
    }
    
    
    public void agregarSitio(String mensaje){
        
        String[] sitio = new String[2];
        sitio[0] = mensaje.substring(mensaje.indexOf(":")+1,mensaje.length());
        sitio[1] = mensaje.substring(0,mensaje.indexOf(":"));
        sitios.add(sitio);
        System.out.println("Sitio agregado");
        
    }
    
    public String retornarIp(String sitio){
        for (String[] strings : sitios) {
            if (strings[1].contentEquals(sitio))
                return strings[0];
        }
        return "";
    }
    
    
    public void iniciar(){
        String[] ucab = new String[2];
        String[] google = new String[2];
        String[] ibm = new String[2];
        ucab[0] = "200.2.15.138";
        ucab[1] = "www.ucab.edu.ve";
        google[0] = "201.248.76.37";
        google[1] = "www.google.com";
        ibm[0] = "129.42.58.216";
        ibm[1] = "www.ibm.com";
        sitios.add(ucab);
        sitios.add(google);
        sitios.add(ibm);
                
    }
    
   
  
   
    
    
}
    
    
    
    
    
    
   
    
    
   

