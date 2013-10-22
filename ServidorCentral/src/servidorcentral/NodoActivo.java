/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servidorcentral;

/**
 *
 * @author hector
 */
public class NodoActivo {
    
   private String ip;
   private String idProceso = "";
   private String id;
   private String nombreEjecutable;
   private String fecha;
   private String hora;
   private String usuario;
   
   

    public String getIdProceso() {
        return idProceso;
    }

    public void setIdProceso(String idProceso) {
        this.idProceso = idProceso;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    public String getNombreEjecutable() {
        return nombreEjecutable;
    }

    public void setNombreEjecutable(String nombreEjecutable) {
        this.nombreEjecutable = nombreEjecutable;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }
    
    
    
    
    
    
    
    
   
   
    
}
