/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Agente;

import Libreria.LibreriaMensajes;
import java.io.IOException;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author hectorsam
 */
public class Monitoreo extends Thread{
    
    private boolean control;
    private static int TIEMPO_SLEEP = 3000;
    private Informacion informacion;
    private LibreriaMensajes libreria;
    

    public Monitoreo(LibreriaMensajes libreria) {
        
        informacion = new Informacion(libreria);
        this.libreria = libreria;
    }

    public static int getTIEMPO_SLEEP() {
        return TIEMPO_SLEEP;
    }


    public boolean isControl() {
        return control;
    }

    public void setControl(boolean control) {
        this.control = control;
    }

    public Informacion getInformacion() {
        return informacion;
    }

    public void setInformacion(Informacion informacion) {
        this.informacion = informacion;
    }

    public LibreriaMensajes getLibreria() {
        return libreria;
    }

    public void setLibreria(LibreriaMensajes libreria) {
        this.libreria = libreria;
    }
    
    @Override
    public void run(){
        
        
        while (control){
            try {
                String informacionSO = informacion.usoCpu()+"\n"+
                        informacion.procesosActivos()+"\n"+informacion.
                        memoriaDisponible();
                libreria.enviarMensaje(informacionSO);
                String informacionRedes = informacion.direccionIp("eth0")+"\n"+
                        informacion.puertosDiponibles()+"\n";
                libreria.enviarMensaje(informacionRedes);
                String informacionApp = "";
                if (comprobarAplicacionActiva()==true){
                    informacionApp = informacion.
                    aplicacionActiva("localhost")+"\n"+
                    informacion.numeroNodo("localhost")+"\n";
                    libreria.enviarMensaje(informacionApp);
                }
                    
                this.sleep(TIEMPO_SLEEP);
            } catch (InterruptedException ex) {
                Logger.getLogger(Monitoreo.class.getName()).log(Level.SEVERE, null, ex);
            }
            }
       
    }
    
    
    public boolean comprobarAplicacionActiva(){
        
        try {
            Socket s = new Socket("localhost",libreria.getPuerto());
            s.close();
            return true;
        } catch (UnknownHostException ex) {
            return false;
        } catch (IOException ex) {
            return  false;
        }
    }
    
}
