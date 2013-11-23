/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dns_servidor;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;
import java.util.ArrayList;

/**
 * Clase que implementa la lógica de la aplicación para el tópico Servicios de
 * Nombre - DNS Servidor.
 * @author Héctor Sam.
 */
public class LogicaAplicacion {

    private static LogicaAplicacion instancia = null;
    private LibreriaMensajes libreriaMensajes;
    private int puertoAgente;
    private DatosAplicacion datosAplicacion;
    private ArrayList<String[]> sitios;
    
    

    private LogicaAplicacion(LibreriaMensajes libreriaMensajes,
            DatosAplicacion datosAplicacion,int puertoAgente) {
        
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        sitios = new ArrayList<>();
        iniciar();

    }
    
    /**
     * Singleton.
     * @param libreriaMensajes
     * @param datosAplicacion
     * @param puertoAgente
     * @return 
     */
    public static LogicaAplicacion getInstancia(LibreriaMensajes libreriaMensajes,
            DatosAplicacion datosAplicacion,int puertoAgente) {
        if (instancia == null){
            instancia = new LogicaAplicacion(libreriaMensajes,
                    datosAplicacion, puertoAgente);
        }
        return  instancia;
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

    public ArrayList<String[]> getSitios() {
        return sitios;
    }

    public void setSitios(ArrayList<String[]> sitios) {
        this.sitios = sitios;
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
                        getNombreAplicacion(),"localhost", puertoAgente)) {
                    return true;
                }
                break;
            case "nodo":
                if (libreriaMensajes.enviarMensaje(datosAplicacion.
                        getNumeroNodoAplicacion(),"localhost",puertoAgente)) {
                    return true;
                }
                break;
            default:{
                 
                 System.out.println("Se ha recibido el mensaje: \""
                         +mensaje.getMensaje()+"\" proveniente del host: "
                         +mensaje.getIpOrigen());
                 
                 if (mensaje.getMensaje().contains(":")){
                     libreriaMensajes.enviarMensaje("Agregando el sitio...");
                     agregarSitio(mensaje.getMensaje());
                 }
                 else{
                     enviarMensaje(mensaje);
                     libreriaMensajes.enviarMensaje("Ip enviado...");
                 }
                 
            }
        };
        return false;
    }
    
    /**
     * Método que permite enviar el número de proceso al servidor central.
     * @param ipServidor 
     */
    public void enviarId(String ipServidor){
        libreriaMensajes.enviarMensaje("id<"
                +datosAplicacion.getIdProceso(),ipServidor);
        libreriaMensajes.enviarMensaje("Ejecutable inicializado");
    }
    
    
  
    /**
     * Método que permite enviar un mensaje al cliente.
     * @param mensaje El mensaje recibido por parte del cliente.
     * @return True si se pudo enviar respuesta. False en caso contrario.
     */
    public boolean enviarMensaje(Mensaje mensaje){
        if (libreriaMensajes.enviarMensaje(
                retornarIp(mensaje.getMensaje()),mensaje.getIpOrigen())) {
        return true;
        } else {
            return false;
        }
        
        
        
    }
    
    
    /**
     * Método que permite agregar un sitio a la lista del servidor.
     * @param mensaje La URL y dirección ip del sitio.
     */
    public void agregarSitio(String mensaje){
        
        String[] sitio = new String[2];
        sitio[0] = mensaje.substring(mensaje.indexOf(":")+1,mensaje.length());
        sitio[1] = mensaje.substring(0,mensaje.indexOf(":"));
        sitios.add(sitio);
        System.out.println("Sitio agregado");
        libreriaMensajes.enviarMensaje("Sitio agregado");
        
    }
    
    /**
     * Método que permite retonar una dirección ip de la lista de sitios
     * disponible.
     * @param sitio La URL a buscar.
     * @return La dirección ip asociada a la URL.
     */
    public String retornarIp(String sitio){
        for (String[] strings : sitios) {
            if (strings[1].contentEquals(sitio))
                return strings[0];
        }
        return "";
    }
    
    
    /**
     * Método que permite iniciar la configuración del servidor DNS.
     */
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
    
    
    
    
    
    
   
    
    
   

