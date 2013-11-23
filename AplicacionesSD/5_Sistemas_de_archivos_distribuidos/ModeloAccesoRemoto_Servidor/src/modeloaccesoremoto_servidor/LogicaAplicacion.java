/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloaccesoremoto_servidor;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;
import java.io.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Clase que implementa la lógica de la aplicación para el tópico Modelo de
 * Acceso Remoto - Servidor.
 * @author Héctor Sam.
 */
public class LogicaAplicacion {

    private static LogicaAplicacion instancia = null;
    private LibreriaMensajes libreriaMensajes;
    private int puertoAgente;
    private DatosAplicacion datosAplicacion;
    private static final String archivo = "/home/pi/Desktop/ModeloAccesoRemoto.txt";
    

    private LogicaAplicacion(LibreriaMensajes libreriaMensajes,
            DatosAplicacion datosAplicacion,int puertoAgente) {
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        
    }
    
    /**
     * Singleton.
     * @param libreriaMensajes
     * @param datosAplicacion
     * @param puertoAgente
     * @return 
     */
    public static LogicaAplicacion getInstancia(LibreriaMensajes libreriaMensajes,
            DatosAplicacion datosAplicacion,int puertoAgente) {
        if (instancia == null) {
            instancia = new LogicaAplicacion(libreriaMensajes,
                    datosAplicacion, puertoAgente);
        }
        return  instancia;
    }

    public LibreriaMensajes getLibreriaMensajes() {
        return libreriaMensajes;
    }

    public void setLibreriaMensajes(LibreriaMensajes libreriaMensajes) {
        this.libreriaMensajes = libreriaMensajes;
    }

    public int getPuertoAgente() {
        return puertoAgente;
    }

    public void setPuertoAgente(int puertoAgente) {
        this.puertoAgente = puertoAgente;
    }

    public DatosAplicacion getDatosAplicacion() {
        return datosAplicacion;
    }

    public void setDatosAplicacion(DatosAplicacion datosAplicacion) {
        this.datosAplicacion = datosAplicacion;
    }
    
    
    
    /**
     * Método que permite chequear el mensaje recibido para decidir si pertenece
     * al agente de configuración, al módulo de ciclo de vida o a un nodo.
     * @param mensaje El mensaje recibido.
     * @return True si pertence al agente. False en caso contrario.
     */
    public boolean verificarMensajeRecibido(Mensaje mensaje){
        
        switch (mensaje.getMensaje()){
            case "aplicacion": 
                if (libreriaMensajes.enviarMensaje(datosAplicacion.
                        getNombreAplicacion(),"localhost", puertoAgente)) {
                    return true;
                }
                break;
            case "nodo":
                if (libreriaMensajes.enviarMensaje(datosAplicacion.
                        getNumeroNodoAplicacion(),"localhost",puertoAgente)){
                    return true;
                }
                break;
            default:{
                
                System.out.println("Se ha recibido el mensaje: \""
                        +mensaje.getMensaje()+"\" proveniente del host: "
                        +mensaje.getIpOrigen());
           
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
     
    /**
     * Método que permite enviar el número de proceso al servidor central.
     * @param ipServidor 
     */
    public void enviarId(String ipServidor){
        libreriaMensajes.enviarMensaje("id<"+datosAplicacion.
                getIdProceso(),ipServidor);
        libreriaMensajes.enviarMensaje("Ejecutable inicializado");
    }
    
    
    /**
     * Método que permite escribir en el archivo local un texto.
     * @param mensaje El mensaje con el contenido a escribir en el archivo.
     * @return True si se pudo escribir en el archivo. False en caso contrario.
     */
    public boolean escribirArchivo(Mensaje mensaje){
        String datos = mensaje.getMensaje().substring(mensaje.
                getMensaje().indexOf(":")+1);
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
            Logger.getLogger(LogicaAplicacion.class.getName()).
                    log(Level.SEVERE, null, ex);
            return  false;
        } finally {
            try {
                fileWritter.close();
                
            } catch (IOException ex) {
                Logger.getLogger(LogicaAplicacion.class.getName()).
                        log(Level.SEVERE, null, ex);
                return  false;
            } catch (NullPointerException ex){
                Logger.getLogger(LogicaAplicacion.class.getName()).
                        log(Level.SEVERE, null, ex);
                return  false;
            }
        }
          libreriaMensajes.enviarMensaje("Se ha escrito en el archivo "
                  + "el mensaje: "+datos);
          return  true;
    }

    /**
     * Método que permite leer el archivo que se encuentra alojado localmente.
     * @return True si el archivo pudo ser leido. False en caso contrario.
     */
    public boolean leerArchivo(){
        libreriaMensajes.enviarMensaje("Leyendo el contenido del archivo...");
        BufferedReader br = null;
        String sCurrentLine;
        try {
            
            br = new BufferedReader(new FileReader(archivo));
            while ((sCurrentLine = br.readLine()) != null) {
                System.out.println(sCurrentLine);
                libreriaMensajes.enviarMensaje(sCurrentLine);
            }
            return  true;
        } catch (IOException ex) {
            Logger.getLogger(LogicaAplicacion.class.getName()).
                    log(Level.SEVERE, null, ex);
            return  false;
        }

    }
    
    
   
}
