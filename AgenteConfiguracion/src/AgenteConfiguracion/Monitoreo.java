/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package AgenteConfiguracion;

import Libreria.LibreriaMensajes;
import agente.InformacionAgente;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.Socket;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author hectorsam
 */
public class Monitoreo extends Thread{
    
    private boolean control=true;
    private static int TIEMPO_SLEEP = 5000;
    private LibreriaMensajes libreria;
    private String intefaz;
    

    public Monitoreo(LibreriaMensajes libreria) {   
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


    public LibreriaMensajes getLibreria() {
        return libreria;
    }

    public void setLibreria(LibreriaMensajes libreria) {
        this.libreria = libreria;
    }

    public String getIntefaz() {
        return intefaz;
    }

    public void setIntefaz(String intefaz) {
        this.intefaz = intefaz;
    }
    
    
    
    @Override
    public void run(){
        
        
        while (control){
            try {
               
                enviarInformacion();    
                Monitoreo.sleep(TIEMPO_SLEEP);
            } catch (InterruptedException ex) {
                Logger.getLogger(Monitoreo.class.getName()).log(Level.SEVERE, null, ex);
            }
            }
       
    }
    
    
    
    public void enviarInformacion(){
        
        InformacionAgente informacion = new InformacionAgente();
        informacion.setUsoCpu(usoCpu());
        informacion.setProcesosActivos(procesosActivos());
        informacion.setMemoriaDisponible(memoriaDisponible());
        informacion.setDireccionIp(direccionIp(intefaz));
        informacion.setPuertosDisponibles(puertosDiponibles());
        informacion.setIdProceso(idProceso());
        if (comprobarAplicacionActiva()==true){
            informacion.setAplicacionActiva(aplicacionActiva("localhost"));
            informacion.setNumeroNodo(numeroNodo("localhost"));
        }
        libreria.enviarMensaje(informacion);
        
    }
    public boolean comprobarAplicacionActiva(){
        
        try {
            Socket s = new Socket("localhost",libreria.getPuerto());
            s.close();
        
        } catch (UnknownHostException ex) {
            return false;
        } catch (SocketException ex){
            return false;
        } catch (IOException ex) {
            return  false;
        } 
        return true;
        
    }
    
    
    public String procesosActivos(){
        
         try {
            String line;
            Process p = Runtime.getRuntime().exec("ps -e");
            int procesos=0;
            BufferedReader input = new BufferedReader(new InputStreamReader(p.getInputStream()));
            while ((line = input.readLine()) != null) 
                procesos++;
            input.close();
            return String.valueOf(procesos-1);
        } 
         catch (Exception err) {
            err.printStackTrace();
        }
         return "";
    }
    
    public String memoriaDisponible(){
        try {
            String line;
            Process p = Runtime.getRuntime().exec("free -m");
            BufferedReader input = new BufferedReader(new InputStreamReader(p.getInputStream()));
            int i=0;
            while ((line = input.readLine()) != null) {
                if (i==2){
                    String memoria = line.substring(37,40);
                    return memoria;
                }
                i++;
            }
            input.close();
        } catch (Exception err) {
            err.printStackTrace();
        }
        return "";
    }
    
    
    public String usoCpu(){
        try {
            String line;
            Process p = Runtime.getRuntime().exec("ps -eo pcpu");
            BufferedReader input = new BufferedReader(new InputStreamReader(p.getInputStream()));
            int i=0; float cpu=0;
            while ((line = input.readLine()) != null) {
                if (i>1)
                    if (Float.valueOf(line)>0)
                        cpu = cpu + Float.valueOf(line);
                
                i++;
            }
            input.close();
            return String.valueOf(cpu);

        } catch (Exception err) {
            err.printStackTrace();
        } 
            return "";
    }
    
    
    public String direccionIp(String intefaz){
        try {
            String line,ip = "";
            Process p = Runtime.getRuntime().exec("/sbin/ifconfig "+intefaz);
            BufferedReader input =
                new BufferedReader(new InputStreamReader(p.getInputStream()));
            int i=0;
            while ((line = input.readLine()) != null) {
                if (i==1){
                    ip=line.substring(line.indexOf(":")+1,
                    line.indexOf(' ',line.indexOf(':')));
                    break;
                }
                i++;
            }
            input.close();  
            return ip;
        } catch (Exception err) {
            err.printStackTrace();
        } 
        return "";
    }
    
    public String puertosDiponibles(){
        try {
            String line,puertos="";
            Process p = Runtime.getRuntime().exec("nmap localhost");
            BufferedReader input =
                new BufferedReader(new InputStreamReader(p.getInputStream()));
            int i=0;
            while ((line = input.readLine()) != null){
                if (line.substring(0).contains("N")==true && i>6)
                    break;
                if (i>6 && line.substring(0).contains(" ")!=false)
                    puertos = puertos+line.substring(0,line.indexOf(" "))+"\n";
                i++;
            }
             input.close();
             return "Puertos abiertos: \n"+puertos;
        } catch (Exception err) {
            err.printStackTrace();
        } 
        return "";
    }
    
    public String aplicacionActiva(String ip){
        
        libreria.enviarMensaje("aplicacion",ip);
        return "Aplicacion: "+libreria.ultimoMensaje().getMensaje();
        
    }
    
    public String numeroNodo (String ip){
        
        libreria.enviarMensaje("nodo",ip);
        return "Nodo #: "+libreria.ultimoMensaje().getMensaje();
        
    }
    
    public String idProceso(){
        
        String line, id = null;
        try {
           
            Process p = Runtime.getRuntime().exec("ps -ax");
            BufferedReader input = new BufferedReader(new InputStreamReader(p.getInputStream()));
            while ((line = input.readLine()) != null) {
                if (line.contains("java -jar Agente")){
                   id =line.substring(0,line.indexOf(" "));
                   break;
                   
                }
                
            }
            input.close();
             } catch (Exception err) {
            err.printStackTrace();
        }
        return id;
    }
    
}
