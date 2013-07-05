/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package javaapplication1;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.Socket;

/**
 *
 * @author hectorsam
 */
public class AgenteConfiguracion {
    
    
    
    public String procesosActivos(){
        
         try {
            String line;
            Process p = Runtime.getRuntime().exec("ps -e");
            int procesos=0;
            BufferedReader input = new BufferedReader(new InputStreamReader(p.getInputStream()));
            while ((line = input.readLine()) != null) 
                procesos++;
            input.close();
            return "Procesos: "+(procesos-1);
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
                if (i==1){
                    String s = line.substring(36,41);
                    return "Memoria: "+s+" Mb";
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
            int i=0; float total=0;
            while ((line = input.readLine()) != null) {
                if (i>1)
                    if (Float.valueOf(line)>0 && Float.valueOf(line)<80)
                        total = total + Float.valueOf(line);
                
                i++;
            }
            input.close();
            return "%CPU: "+total;

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
            return "Ip: "+ip;
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
             return puertos;
        } catch (Exception err) {
            err.printStackTrace();
        } 
        return "";
    }
    
//    public String aplicacionActiva(){
//        Socket s = new Socket();
//    }

}
