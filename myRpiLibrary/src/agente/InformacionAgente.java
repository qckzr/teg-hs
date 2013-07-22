/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package agente;

import java.io.Serializable;

/**
 *
 * @author hectorsam
 */
public class InformacionAgente implements Serializable{
    
    
    private String procesosActivos="";
    private String memoriaDisponible="";
    private String usoCpu="";
    private String direccionIp="";
    private String puertosDisponibles="";
    private String aplicacionActiva="";
    private String numeroNodo="";
    private String idProceso="";
    

    public InformacionAgente() {
    }

  
    
    public InformacionAgente(String procesosActivos, String memoriaDisponible, String usoCpu, String direccionIp, String puertosDisponibles, String aplicacionActiva, String numeroNodo, String idProceso, String ipNodo) {
        this.procesosActivos = procesosActivos;
        this.memoriaDisponible = memoriaDisponible;
        this.usoCpu = usoCpu;
        this.direccionIp = direccionIp;
        this.puertosDisponibles = puertosDisponibles;
        this.aplicacionActiva = aplicacionActiva;
        this.numeroNodo = numeroNodo;
        this.idProceso = idProceso;
      
    }

    public String getAplicacionActiva() {
        return aplicacionActiva;
    }

    public void setAplicacionActiva(String aplicacionActiva) {
        this.aplicacionActiva = aplicacionActiva;
    }

    public String getDireccionIp() {
        return direccionIp;
    }

    public void setDireccionIp(String direccionIp) {
        this.direccionIp = direccionIp;
    }

    public String getMemoriaDisponible() {
        return memoriaDisponible;
    }

    public void setMemoriaDisponible(String memoriaDisponible) {
        this.memoriaDisponible = memoriaDisponible;
    }

    public String getNumeroNodo() {
        return numeroNodo;
    }

    public void setNumeroNodo(String numeroNodo) {
        this.numeroNodo = numeroNodo;
    }

    public String getProcesosActivos() {
        return procesosActivos;
    }

    public void setProcesosActivos(String procesosActivos) {
        this.procesosActivos = procesosActivos;
    }

    public String getPuertosDisponibles() {
        return puertosDisponibles;
    }

    public void setPuertosDisponibles(String puertosDisponibles) {
        this.puertosDisponibles = puertosDisponibles;
    }

    public String getUsoCpu() {
        return usoCpu;
    }

    public void setUsoCpu(String usoCpu) {
        this.usoCpu = usoCpu;
    }

    public String getIdProceso() {
        return idProceso;
    }

    public void setIdProceso(String idProceso) {
        this.idProceso = idProceso;
    }

    
    
   
    
    
}
