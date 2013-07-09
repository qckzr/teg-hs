/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Agente;

import Libreria.LibreriaMensajes;
import java.io.IOException;
import java.net.Socket;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.media.j3d.SoundException;

/**
 *
 * @author hectorsam
 */
public class Monitoreo extends Thread{
    
    private boolean control=true;
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
                String informacionSO = "INFORMACION DE SO: \n"+informacion.usoCpu()+"\n"+
                        informacion.procesosActivos()+"\n"+informacion.
                        memoriaDisponible()+"\n----------------";
                System.out.println(informacionSO);
//                libreria.enviarMensaje(informacionSO);
                String informacionRedes = "INFORMACION DE RED: \n"+informacion.direccionIp("eth0")+"\n"+
                        informacion.puertosDiponibles()+"----------------";
                System.out.println(informacionRedes);
//                libreria.enviarMensaje(informacionRedes);
                String informacionApp = "";
                if (comprobarAplicacionActiva()==true){
                    informacionApp = "INFORMACION DE APLICACION: \n"+informacion.
                    aplicacionActiva("localhost")+"\n"+
                    informacion.numeroNodo("localhost")+"\n----------------";
                    System.out.println(informacionApp);
       //             libreria.enviarMensaje(informacionApp);
                }
                    
                Monitoreo.sleep(TIEMPO_SLEEP);
            } catch (InterruptedException ex) {
                Logger.getLogger(Monitoreo.class.getName()).log(Level.SEVERE, null, ex);
            }
            }
       
    }
    
    
    public boolean comprobarAplicacionActiva(){
        
        try {
            Socket s = new Socket("localhost",libreria.getPuerto());
            s.close();
        
        } catch (UnknownHostException ex) {
            return false;
        } catch (SocketException ex){
            return false;
        }
          catch (IOException ex) {
            return  false;
        } 
        return true;
        
    }
    
}
