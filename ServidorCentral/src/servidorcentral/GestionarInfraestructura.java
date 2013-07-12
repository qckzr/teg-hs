/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servidorcentral;
import Libreria.LibreriaMensajes;
import Libreria.Mensaje;
import agente.InformacionAgente;

/**
 *
 * @author hector
 */
public class GestionarInfraestructura {
    
    private ConexionBD bd;
    private LibreriaMensajes libreria;
    private String ipModuloMonitoreo;
    private String pathScripts;
    private String pathEjecutables;

    public GestionarInfraestructura(LibreriaMensajes libreria) {
        this.libreria = libreria;
    }

    public ConexionBD getBd() {
        return bd;
    }

    public void setBd(ConexionBD bd) {
        this.bd = bd;
    }

    public String getIpModuloMonitoreo() {
        return ipModuloMonitoreo;
    }

    public void setIpModuloMonitoreo(String ipModuloMonitoreo) {
        this.ipModuloMonitoreo = ipModuloMonitoreo;
    }

    public LibreriaMensajes getLibreria() {
        return libreria;
    }

    public void setLibreria(LibreriaMensajes libreria) {
        this.libreria = libreria;
    }
    
    
    
    
    
    
    public boolean insertarEnBd(InformacionAgente informacion){
        return true;
    }
    
    public boolean insertarEnBd(Mensaje mensaje){
        return true;
    }
    
    public boolean reenviarMensaje(InformacionAgente informacion){
        return true;
    }
    
    public boolean reenviarMensaje (Mensaje mensaje){
        return true;
    }
    
    public boolean ejecutarAplicacion(String nombreAplicacion, String ipNodo){
        return true;
    }
    
    public String buscarParametros(String nombreAplicacion){
        return "";        
    }
    
    public boolean eliminarAplicacion(String nombreAplicacion, String ipNodo){
        return false;
    }
    
    public boolean eliminarTodasAplicaciones(String nombreAplicacion){
        return false;
    }
    
    public boolean enviarMensajeNodo(String mensaje,String ipNodo){
        return false;
        
    }
    
    
    
    
    
    
}
