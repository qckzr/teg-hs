/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package caracteristicassd_cliente;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;

/**
 * Clase que implementa la lógica de la aplicación para el tópico Características
 * de los Sistemas Distribuidos.
 * @author Héctor Sam.
 */
public class LogicaAplicacion {

    private static LogicaAplicacion instancia;
    private LibreriaMensajes libreriaMensajes;
    private int puertoAgente;
    private DatosAplicacion datosAplicacion;
    private String archivo = "/home/pi/Desktop/archivoCaracteristicasSD.txt";
    private String ipServidor1;
    private String ipServidor2;
    

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

    public String getArchivo() {
        return archivo;
    }

    public void setArchivo(String archivo) {
        this.archivo = archivo;
    }

    public String getIpServidor1() {
        return ipServidor1;
    }

    public void setIpServidor1(String ipServidor1) {
        this.ipServidor1 = ipServidor1;
    }

    public String getIpServidor2() {
        return ipServidor2;
    }

    public void setIpServidor2(String ipServidor2) {
        this.ipServidor2 = ipServidor2;
    }
    
    
    
    
    
    

    private LogicaAplicacion(LibreriaMensajes libreriaMensajes, 
            DatosAplicacion datosAplicacion,int puertoAgente, 
            String ipServidor1, String ipServidor2) {
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        this.ipServidor1 = ipServidor1;
        this.ipServidor2 = ipServidor2;
        
        
    }
    
    /**
     * Singleton
     * @return 
     */
    public static LogicaAplicacion getInstancia(LibreriaMensajes libreriaMensajes, 
            DatosAplicacion datosAplicacion,int puertoAgente, 
            String ipServidor1, String ipServidor2){
        
        if (instancia == null){
            instancia = new LogicaAplicacion(libreriaMensajes, datosAplicacion,
                    puertoAgente, ipServidor1, ipServidor2);
        }
        return instancia;
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
                enviarMensaje(mensaje);
              
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
    * Método que permite enviar un mensaje a uno de los servidores, si falla el 
    * envío al servidor 1 entonces se envía al 2.
    * @param mensaje El mensaje a enviar.
    */ 
   public boolean enviarMensaje(Mensaje mensaje){
       libreriaMensajes.enviarMensaje("Enviando mensaje '"+
               mensaje.getMensaje().substring(0,
                       mensaje.getMensaje().indexOf(":"))+"'  al servidor");
       if (libreriaMensajes.enviarMensaje(mensaje.getMensaje(), ipServidor1)==false){
           if (libreriaMensajes.enviarMensaje(mensaje.getMensaje(), ipServidor2) == true){
               return true;
           } else{
               return false;
           }
           
       }else{
           return true;
       }

   }
   
}
