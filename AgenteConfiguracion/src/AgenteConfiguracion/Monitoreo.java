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
 *Clase que permite recolectar la información con relación al sistema operativo
 * redes y aplicaciones para posteriormente enviarla hacia el servidor central.
 * @author hectorsam
 */
public class Monitoreo extends Thread{
    
    private boolean control = true;
    private static int TIEMPO_SLEEP = 10000;
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
    
    
    
    /**
     * Método que permite ejecutar la recolección de información en un tiempo
     * indicado.
     */
    @Override
    public void run(){
        
        
        while (control){
            try {
               if (comprobarConexion()) {
                    enviarInformacion();    
               }
                Monitoreo.sleep(TIEMPO_SLEEP);
                
            } catch (InterruptedException ex) {
                Logger.getLogger(Monitoreo.class.getName()).
                        log(Level.SEVERE, null, ex);
            }
            }
       
    }
    
    
    
    /**
     * Método que permite enviar la información recolectada al servidor central.
     */
    public void enviarInformacion(){
        
        InformacionAgente informacion = new InformacionAgente();
        informacion.setUsoCpu(usoCpu());
        informacion.setProcesosActivos(procesosActivos());
        informacion.setMemoriaDisponible(memoriaDisponible());
        informacion.setDireccionIp(direccionIp(intefaz));
        informacion.setPuertosDisponibles(puertosDiponibles());
        informacion.setIdProceso(idProceso());
        
        if (comprobarAplicacionActiva() == true){
            informacion.setAplicacionActiva(aplicacionActiva("localhost"));
            informacion.setNumeroNodo(numeroNodo("localhost"));
        }
        libreria.enviarMensaje(informacion);
        
    }
    
    
    /**
     * Método que permite conocer si se encuentra en ejecución una aplicación
     * en el nodo.
     * @return True si existe conexión. False en caso contrario.
     */
    public boolean comprobarAplicacionActiva(){
        Socket s;
        boolean retorno = false;
        try {
            s = new Socket("localhost",libreria.getPuerto());
            s.close();
            retorno = true;
        } catch (UnknownHostException ex) {
            ex.getMessage();
        } catch (SocketException ex){
            ex.getMessage();
        } catch (IOException ex) {
            ex.getMessage();
        } 
        return retorno;
        
    }
    
    /**
     * Método que devuelve la cantidad de procesos que se encuentran activos
     * en el sistema.
     * @return  La cantidad de procesos activos.
     */
    public String procesosActivos(){
        String cantidad = "";
         try {
            String line;
            Process p = Runtime.getRuntime().exec("ps -e");
            int procesos=0;
            BufferedReader input = new BufferedReader(new InputStreamReader
                                            (p.getInputStream()));
            while ((line = input.readLine()) != null) {
                procesos++;
            }
            input.close();
            cantidad = String.valueOf(procesos-1);
        } 
         catch (Exception err) {
            err.printStackTrace();
        }
         return cantidad;
    }
    
    /**
     * Método que devuelve la cantidad de memoria disponible en el nodo.
     * @return La cantidad de memoria disponible en mb.
     */
    public String memoriaDisponible(){
        String memoria = "";
        try {
            String line;
            Process p = Runtime.getRuntime().exec("free -m");
            BufferedReader input = new BufferedReader(new InputStreamReader
                                        (p.getInputStream()));
            int i=0;
            while ((line = input.readLine()) != null) {
                if (i==1){
                    memoria = line.substring(37,40);
                }
                i++;
            }
            input.close();
        } catch (Exception err) {
            err.printStackTrace();
        }
        return memoria;
    }
    
    /**
     * Método que devuelve el porcentaje de uso del cpu del nodo.
     * @return El porcentaje utilizado de cpu por el nodo.
     */
    public String usoCpu(){
        String porcentajeCpu = "";
        int i = 0;
        float cpu = 0;
        try {
            String line;
            Process p = Runtime.getRuntime().exec("ps -eo pcpu");
            BufferedReader input = new BufferedReader(new 
                    InputStreamReader(p.getInputStream()));

            while ((line = input.readLine()) != null) {
                if (i>1){
                    if (Float.valueOf(line)>0){
                        cpu = cpu + Float.valueOf(line);
                    }
                }
                i++;
            }
            input.close();
            porcentajeCpu = String.valueOf(cpu/2);

        } catch (Exception err) {
            err.printStackTrace();
        } 
            return porcentajeCpu;
    }
    
    
    /**
     * Método que devuelve la dirección ip del nodo.
     * @param intefaz Interfaz de red para realizar la consulta de su dirección.
     * @return La dirección ip del nodo.
     */
    public String direccionIp(String intefaz){
        String ip = "";
        try {
            String line = "";
            Process p = Runtime.getRuntime().exec("/sbin/ifconfig "+intefaz);
            BufferedReader input =
                new BufferedReader(new InputStreamReader(p.getInputStream()));
            int i = 0;
            while ((line = input.readLine()) != null) {
                if (i == 1){
                    ip = line.substring(line.indexOf(":")+1,
                    line.indexOf(' ',line.indexOf(':')));
                    break;
                }
                i++;
            }
            input.close();  
        } catch (Exception err) {
            err.printStackTrace();
        } 
        return ip;
    }
    
    /**
     * Método que devuelve los puertos que se encuentran disponibles en el 
     * nodo.
     * @return Los puertos disponibles junto a su protocolo y nombre de servicio.
     */
    public String puertosDiponibles(){
        String puertos = "";
        try {
            String line = "";
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
             puertos = puertos;
        } catch (Exception err) {
            err.printStackTrace();
        } 
        return puertos;
    }
    
    /**
     * Método que devuelve la aplicación activa que se encuentra en el nodo.
     * @param ip La dirección ip del nodo.
     * @return El nombre de la aplicación.
     */
    public String aplicacionActiva(String ip){
        String aplicacion = "";
        libreria.enviarMensaje("aplicacion",ip);
        try {
            Thread.sleep(2000);
        } catch (InterruptedException ex) {
            Logger.getLogger(Monitoreo.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (libreria.ultimoMensaje() != null){
            aplicacion = libreria.ultimoMensaje().getMensaje();
        }
        return aplicacion;
        
    }
    
    /**
     * Método que devuelve el número de nodo de la aplicación en ejecución.
     * @param ip La dirección ip del Nodo.
     * @return El número de nodo de la aplicación.
     */
    public String numeroNodo (String ip){
        
        String numeroNodo = "";
        libreria.enviarMensaje("nodo",ip);
        try {
            Thread.sleep(2000);
        } catch (InterruptedException ex) {
            Logger.getLogger(Monitoreo.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        if (libreria.ultimoMensaje() != null){
            numeroNodo = libreria.ultimoMensaje().getMensaje();
        }
        return  numeroNodo;
        
    }
    
    /**
     * Método que devuelve el número de proceso del Agente de configuración
     * en el nodo.
     * @return El número de proceso del Agente.
     */
    public String idProceso(){
        
        String line;
        String id = "";
        BufferedReader input;
        try {
           
            Process p = Runtime.getRuntime().exec("ps -ax");
            input = new BufferedReader(new InputStreamReader(p.getInputStream()));
            
            while ((line = input.readLine()) != null) {
                
                if (line.contains("java -jar /home/pi/Desktop/Agente")){
                  id = line.substring(0,5);
                  for (int i = 0; i < id.length(); i++) {
                    if (id.charAt(i)!=' '){
                        id = id.substring(i,id.length());
                        break;
                    }
                   
                    }
                }
                
            }          
            input.close();
             } catch (Exception err) {
            err.printStackTrace();
        }
        return id;
    }
    
    
    /**
     * Método que permite comprobar la conexion del servidor central para enviar
     * la informacion.
     * @return True si la conexion fue exitosa. False en caso contrario.
     */
    public boolean comprobarConexion(){
        try {      
            Socket socket = new Socket(libreria.getIpDestino().get(0),
                    LibreriaMensajes.getPuerto());
            socket.close();
            Socket socket1 = new Socket("localhost",LibreriaMensajes.getPuerto());
            socket1.close();
            return true;
        } catch (IOException ex) {
            System.out.println("Puerto cerrado...");
//            Logger.getLogger(Monitoreo.class.getName()).
//                    log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
}
