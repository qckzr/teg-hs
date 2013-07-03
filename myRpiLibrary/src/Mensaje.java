
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Hector
 */
public class Mensaje {

    
    private String mensaje;
    private String fecha;
    private String hora;

    public Mensaje(String ipOrigen,String mensaje) {

        Date d = new Date();
        DateFormat fecha = new SimpleDateFormat("dd/MM/yyyy");
        DateFormat hora = new SimpleDateFormat("HH:mm:ss");
        this.fecha = fecha.format(d).toString();
        this.hora = hora.format(d).toString();
        this.mensaje = mensaje;
   
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

  
   



}
