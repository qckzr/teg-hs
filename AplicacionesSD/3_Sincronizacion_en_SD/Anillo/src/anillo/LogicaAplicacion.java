/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package anillo;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;

/**
 *
 * @author sam
 */
public class LogicaAplicacion {

    private LibreriaMensajes libreriaMensajes;
    private int puertoAgente;
    private DatosAplicacion datosAplicacion;
    private boolean coordinador = false;
    private boolean esperaMensajeProcesos = false;
    private boolean envioMensajeCoordinador = false;
    private String proximoNodo;

    public LogicaAplicacion(LibreriaMensajes libreriaMensajes, DatosAplicacion datosAplicacion,int puertoAgente, String proximoNodo) {
        
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        this.proximoNodo = proximoNodo;


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
                     System.out.println(mensaje.getMensaje());
                     libreriaMensajes.enviarMensaje(mensaje.getMensaje());
                     if (!envioMensajeCoordinador)
                         enviarMensaje(mensaje.getMensaje(),0);


                 }
                 else if (mensaje.getMensaje().contains("iniciar")){
                     libreriaMensajes.enviarMensaje("Iniciando la seleccion de coordinador...");
                     enviarMensaje();
                     esperaMensajeProcesos = true;
   
                 }
                 else if (mensaje.getMensaje().contains("eleccion")){
                     libreriaMensajes.enviarMensaje("Recibido mensaje de eleccion...");
                     if (esperaMensajeProcesos==true)
                         evaluarMensaje(mensaje);
                     else
                         enviarMensaje(mensaje.getMensaje(),1);
                     
                 }

                     
            }
            return true;
        };
        return false;
    }
     
    public void enviarId(String ipServidor){
        libreriaMensajes.enviarMensaje("id<"+datosAplicacion.getIdProceso(),ipServidor);
    }
      
    public boolean enviarMensaje(){
        
         libreriaMensajes.enviarMensaje("eleccion~"+libreriaMensajes.getIpOrigen()+
                 ":"+datosAplicacion.getIdProceso()+"_",proximoNodo);
         return false;     
    }
    
    public boolean enviarMensaje(String mensaje,int tipo){
        if (tipo==1){
            libreriaMensajes.enviarMensaje(mensaje+libreriaMensajes.
            getIpOrigen()+":"+datosAplicacion.getIdProceso()+"_",proximoNodo); 
        }
        else
            libreriaMensajes.enviarMensaje(mensaje,proximoNodo);
        
       return true;
    }
    
    
    
    public boolean evaluarMensaje(Mensaje mensaje){
        String[] partes = mensaje.getMensaje().split("_");
        int procesoMayor = 0;
        String ipCoordinador = "";
        for (String string : partes) {
            String ip = string.substring(string.indexOf("192."),string.indexOf(":"));
            int proceso = Integer.valueOf(string.substring(string.indexOf(":")+1, string.length()));
            if (proceso > procesoMayor){
                procesoMayor = proceso;
                ipCoordinador = ip;
            }
        }
        System.out.println("Se eligió el Coordinador... enviando mensaje...");
        libreriaMensajes.enviarMensaje("Se eligió el Coordinador... enviando mensaje...");
        enviarMensaje("COORDINADOR = "+ipCoordinador.substring(ipCoordinador.length()-1,ipCoordinador.length()) +": "+procesoMayor,0);
        envioMensajeCoordinador = true;
    
        
        return true;
    }
    
  
    
  
   
    
    
}
    
    
    
    
    
    
   
    
    
   

