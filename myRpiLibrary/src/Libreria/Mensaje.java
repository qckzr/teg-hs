package Libreria;


import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Hector
 */
public class Mensaje implements Serializable{

    
    private String mensaje;
    private String fecha;
    private String hora;
    private String ipOrigen;

    public Mensaje(String ipOrigen,String mensaje) {

        Date d = new Date();
        DateFormat fecha = new SimpleDateFormat("dd/MM/yyyy");
        DateFormat hora = new SimpleDateFormat("HH:mm:ss");
        this.fecha = fecha.format(d).toString();
        this.hora = hora.format(d).toString();
        this.mensaje = mensaje;
        this.ipOrigen = ipOrigen;
   
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

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public String getIpOrigen() {
        return ipOrigen;
    }

    public void setIpOrigen(String ipOrigen) {
        this.ipOrigen = ipOrigen;
    }
            
    @Override
    public String toString(){
        return fecha+" "+hora+"  "+ipOrigen+": "+mensaje;
    }

  
   



}
