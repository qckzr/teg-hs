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

    public GestionarInfraestructura(LibreriaMensajes libreria) {
        this.libreria = libreria;
    }
    
    
    
    
    
    public boolean insertarEnBd(){
        return true;
    }
    
    public boolean consultarEnBd(){
       return true;
    }
    
    public boolean reenviarMensaje(InformacionAgente informacion){
        return true;
    }
    
    public boolean reenviarMensaje (Mensaje mensaje){
        return true;
    }
    
    public boolean ejecutarAplicacion(String nombreAplicacion){
        return true;
    }
    
    
    
}
