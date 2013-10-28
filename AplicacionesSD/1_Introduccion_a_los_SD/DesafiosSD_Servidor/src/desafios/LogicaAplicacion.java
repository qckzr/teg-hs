/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package desafios;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;
import java.io.*;
import java.net.URL;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Clase que proporciona la lógica del tópico Desafíos de los SD.
 * @author Héctor Sam
 */
public class LogicaAplicacion {

    private static LogicaAplicacion instancia;
    private LibreriaMensajes libreriaMensajes;
    private int puertoAgente;
    private DatosAplicacion datosAplicacion;
    private String archivo1 = "/home/pi/Desktop/archivoDesafios1.txt";
    private String archivo2 = "/home/pi/Desktop/archivoDesafios2.txt";
    private String archivo3 = "/home/pi/Desktop/archivoDesafios3.txt";
    private static final int PUERTO = 5555; 
    private boolean archivoOcupado = false;

    

    public int getPuerto(){
        return PUERTO;
    }

    public boolean isArchivoOcupado() {
        return archivoOcupado;
    }

    public void setArchivoOcupado(boolean archivoOcupado) {
        this.archivoOcupado = archivoOcupado;
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
     * Constructor de la clase
     * @param libreriaMensajes La librería de mensajes.
     * @param datosAplicacion Objeto de la clase datos de la aplicación
     * @param puertoAgente Puerto de escucha del agente.
     */
    private LogicaAplicacion(LibreriaMensajes libreriaMensajes, 
            DatosAplicacion datosAplicacion,int puertoAgente) {
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        HiloSSL hiloSSL = new HiloSSL(this);
        hiloSSL.start();
    }
    



    public static LogicaAplicacion getInstance(LibreriaMensajes libreriaMensajes, 
            DatosAplicacion datosAplicacion,int puertoAgente){
        if (instancia == null){
            instancia = new LogicaAplicacion(libreriaMensajes,
                    datosAplicacion, puertoAgente);
        }
        return instancia;     
    }
    
    /**
     * Método que chequea el tipo de mensaje recibido.
     * @param mensaje El mensaje recibido.
     * @return True si es un mensaje del agente. False en caso contrario.
     */
    public boolean verificarMensajeRecibido(Mensaje mensaje){
        boolean retornar = false;
        switch (mensaje.getMensaje()){
            case "aplicacion": 
                if (libreriaMensajes.enviarMensaje(datosAplicacion.
                        getNombreAplicacion(),"localhost", puertoAgente))
                    retornar = true;
                break;
            case "nodo":
                if (libreriaMensajes.enviarMensaje(datosAplicacion.
                        getNumeroNodoAplicacion(),"localhost",puertoAgente))
                    retornar = true;
                break;
            default:{
                
                System.out.println("Se ha recibido el mensaje: \""
                        +mensaje.getMensaje()+"\" proveniente del host: "
                        +mensaje.getIpOrigen()); 
                libreriaMensajes.enviarMensaje("Se ha recibido el mensaje: \""
                        +mensaje.getMensaje()+"\" proveniente del host: "
                        +mensaje.getIpOrigen());
            }
        };
        return retornar;
    }
    
    /**
     * Método que envía el número de proceso al servidor central.
     * @param ipServidor Dirección ip del servidor central.
     */
    public void enviarId(String ipServidor){
        libreriaMensajes.enviarMensaje("id<"+datosAplicacion.getIdProceso(),
                ipServidor);
    }
    
    /**
     * Método que inicia el comportamiento de la clase, inicia el hilo con 
     * el socket seguro.
     */
    public void iniciar(){
        System.setProperty("javax.net.ssl.keyStorePassword","password");
        HiloSSL hiloSSL = new HiloSSL(this);
        hiloSSL.start();
        
    }
     
     /**
      * Método que permite enviar un archivo indicado a un cliente.
      * @param fichero El archivo a enviar
      * @param oos El socket por donde se enviará la información.
      */
     public boolean enviaFichero(String fichero, ObjectOutputStream oos){
         int leidos;
         boolean enviadoUltimo;
         FileInputStream fis;
         MensajeTomaFichero mensaje;
         try
        {
            enviadoUltimo = false;
            fis = new FileInputStream(fichero);
            mensaje = new MensajeTomaFichero();
            mensaje.nombreFichero = fichero;
            leidos = fis.read(mensaje.contenidoFichero);
            
            while (leidos > -1){
                
                mensaje.bytesValidos = leidos;
                if (leidos < MensajeTomaFichero.LONGITUD_MAXIMA){
                    mensaje.ultimoMensaje = true;
                    enviadoUltimo=true;
                } else{
                    mensaje.ultimoMensaje = false;
                }
                
                oos.writeObject(mensaje);
                if (mensaje.ultimoMensaje){
                    break;
                }
                
                mensaje = new MensajeTomaFichero();
                mensaje.nombreFichero = fichero;
                
                leidos = fis.read(mensaje.contenidoFichero);
                Thread.sleep(1000);
            }
            
            if (enviadoUltimo == false){
                
                mensaje.ultimoMensaje=true;
                mensaje.bytesValidos=0;
                oos.writeObject(mensaje);
            }
            return true;
            
        } catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }
     
     
    /**
     * Método que permite enviar el hash de un archivo a un cliente.
     * @param archivo El nombre del archivo a calcular el hash
     * @param objectOutputStream El canal donde se enviará el hash.
     */ 
    public boolean enviarHash(String archivo, ObjectOutputStream objectOutputStream){
        FileInputStream fis = null;
        String datafile;
        MessageDigest messageDigest;
        byte[] dataBytes;
        int nread = 0;
        byte[] mdbytes;
        StringBuffer stringBuffer;
        try {
            datafile = archivo;
            messageDigest = MessageDigest.getInstance("MD5");
            fis = new FileInputStream(datafile);
            dataBytes = new byte[1024]; 
            while ((nread = fis.read(dataBytes)) != -1) {
                messageDigest.update(dataBytes, 0, nread);
            }

            mdbytes = messageDigest.digest();

             //convert the byte to hex format
            stringBuffer = new StringBuffer("");
            for (int i = 0; i < mdbytes.length; i++) {
                stringBuffer.append(Integer.toString((mdbytes[i] & 0xff) + 
                                    0x100, 16).substring(1));
            }

            objectOutputStream.writeObject(stringBuffer.toString());
            fis.close();
            objectOutputStream.close();
            return  true;
            } catch (IOException ex) {
                Logger.getLogger(LogicaAplicacion.class.getName()).
                                log(Level.SEVERE, null, ex);
                return  false;
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(LogicaAplicacion.class.getName()).
                                log(Level.SEVERE, null, ex);
                return false;
            } 
        }
        
    

}    

