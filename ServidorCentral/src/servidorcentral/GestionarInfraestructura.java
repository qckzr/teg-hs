/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servidorcentral;
import Libreria.LibreriaMensajes;
import Libreria.Mensaje;
import agente.InformacionAgente;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author hector
 */
public class GestionarInfraestructura extends Thread{
    
    private ConexionBD bd;
    private LibreriaMensajes libreria;
    private String ipModuloMonitoreo;
    private String pathScripts = "scripts/";
    private String pathEjecutables = "ejecutables/";
    private String ipBaseDeDatos;

    public GestionarInfraestructura(LibreriaMensajes libreria, String usuarioBd, String passwordBd, String puerto, String ipBaseDeDatos) {
        this.libreria = libreria;
        bd = new ConexionBD(usuarioBd,passwordBd,puerto, ipBaseDeDatos);
        this.ipBaseDeDatos = ipBaseDeDatos;
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

    public String getPathEjecutables() {
        return pathEjecutables;
    }

    public void setPathEjecutables(String pathEjecutables) {
        this.pathEjecutables = pathEjecutables;
    }

    public String getPathScripts() {
        return pathScripts;
    }

    public void setPathScripts(String pathScripts) {
        this.pathScripts = pathScripts;
    }

    public String getIpBaseDeDatos() {
        return ipBaseDeDatos;
    }

    public void setIpBaseDeDatos(String ipBaseDeDatos) {
        this.ipBaseDeDatos = ipBaseDeDatos;
    }
    
    
    
    
    
    
    public boolean insertarEnBd(InformacionAgente informacion){
        try {
            String aplicacionActiva = "NULL";
            String estadoAplicacion = "'DESACTIVA'";
            if (informacion.getAplicacionActiva().length()!=0){
                aplicacionActiva = "'"+informacion.getAplicacionActiva()+"'";
                estadoAplicacion = "'ACTIVA'";
            }
            
            String idNodo = bd.consultarRegistro("Select id from nodo where ip ="+informacion.getDireccionIp()).getString(1);
            String query = "Insert into MENSAJES_AGENTE "
                    + "(ID,ID_PROCESO,CANTIDAD_PROCESOS,MEMORIA_DISPONIBLE,USO_CPU,"
                    + "PUERTOS_DISPONIBLES,ID_NODO,NOMBRE_APLICACION,ESTADO_APLICACION) "
                    + "VALUES (S_MENSAJES_AGENTE.NEXTVAL,"+informacion.getIdProceso()+","
                    + ""+informacion.getProcesosActivos()+","+informacion.getMemoriaDisponible()+","
                    + ""+informacion.getUsoCpu()+",'"+informacion.getPuertosDisponibles()+"',"
                    + ""+idNodo+","+aplicacionActiva+","+estadoAplicacion+"";
            if (bd.ejecutarQuery(query)==true)
                return true;
            else return false;
        } catch (SQLException ex) {
            Logger.getLogger(GestionarInfraestructura.class.getName()).log(Level.SEVERE, null, ex);
        }
        return  false;
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
    
    public boolean ejecutarAplicacion(String nombreAplicacion,String nombreEjecutable, String ipNodo){
        return true;
    }
    
    public String buscarParametros(String nombreAplicacion, String nombreEjecutable){
        
        return "";        
    }
    
    public boolean eliminarAplicacion(String nombreAplicacion, String ipNodo){
        return false;
    }
    
    public boolean eliminarTodasAplicaciones(String nombreAplicacion){
        return false;
    }
    
    public boolean enviarMensajeNodo(String mensaje,String ipNodo){
        
        if (libreria.enviarMensaje(mensaje, ipNodo)==true)
            return  true;
        else
            return false;
        
    }
    
    
    
    
    
    
}
