/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloaccesoremoto_servidor;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;
import java.io.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author sam
 */
public class LogicaAplicacion {

    private LibreriaMensajes libreriaMensajes;
    private int puertoAgente;
    private DatosAplicacion datosAplicacion;
    private static final String archivo = "/home/pi/Desktop/ModeloAccesoRemoto.txt";
    

    public LogicaAplicacion(LibreriaMensajes libreriaMensajes, DatosAplicacion datosAplicacion,int puertoAgente) {
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        
    }
    
    public boolean verificarMensajeRecibido(Mensaje mensaje){
        
        switch (mensaje.getMensaje()){
            case "aplicacion": 
                if (libreriaMensajes.enviarMensaje(datosAplicacion.getNombreAplicacion(),"localhost", puertoAgente))
                    return true;
                break;
            case "nodo":
                if (libreriaMensajes.enviarMensaje(datosAplicacion.getNumeroNodoAplicacion(),"localhost",puertoAgente))
                    return true;
                break;
            default:{
                
                System.out.println("Se ha recibido el mensaje: \""+mensaje.getMensaje()+"\" proveniente del host: "+mensaje.getIpOrigen());
           
                if (mensaje.getMensaje().contains("ver:")){
                    leerArchivo();
                }
                else if (mensaje.getMensaje().contains("escribir:")){
                    escribirArchivo(mensaje);
                }
            }
        };
        return false;
    }
     
    public void enviarId(String ipServidor){
        libreriaMensajes.enviarMensaje("id<"+datosAplicacion.getIdProceso(),ipServidor);
    }
    
    
    public void escribirArchivo(Mensaje mensaje){
        String datos = mensaje.getMensaje().substring(mensaje.getMensaje().indexOf(":")+1);
        FileWriter fileWritter = null;
        File file = new File(archivo);
         try {
                if(!file.exists()){
    			file.createNewFile();
    		}
                fileWritter = new FileWriter(file.getName(),true);
                BufferedWriter bufferWritter = new BufferedWriter(fileWritter);
                bufferWritter.write(datos+"\n");
                bufferWritter.close();
        } catch (IOException ex) {
            Logger.getLogger(LogicaAplicacion.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                fileWritter.close();
            } catch (IOException ex) {
                Logger.getLogger(LogicaAplicacion.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
          libreriaMensajes.enviarMensaje("Se ha escrito en el archivo el mensaje: "+datos);
    }

    public void leerArchivo(){
        libreriaMensajes.enviarMensaje("Leyendo el contenido del archivo...");
        try {
            BufferedReader br = null;
            String sCurrentLine;
            br = new BufferedReader(new FileReader(archivo));
            while ((sCurrentLine = br.readLine()) != null) {
                System.out.println(sCurrentLine);
                libreriaMensajes.enviarMensaje(sCurrentLine);
            }
        } catch (IOException ex) {
            Logger.getLogger(LogicaAplicacion.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
    
   
}
