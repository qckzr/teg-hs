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
 *
 * @author sam
 */
public class LogicaAplicacion {

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
    
    
    
    
    

    public LogicaAplicacion(LibreriaMensajes libreriaMensajes, DatosAplicacion datosAplicacion,int puertoAgente) {
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        HiloSSL hiloSSL = new HiloSSL(this);
        hiloSSL.start();
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
            }
        };
        return false;
    }
     
    public void enviarId(String ipServidor){
        libreriaMensajes.enviarMensaje(datosAplicacion.getIdProceso(),ipServidor);
    }
    
    public void iniciar(){
     //   System.setProperty("javax.net.ssl.keyStore","/home/pi/Desktop/certificadoSSL");  
        System.setProperty("javax.net.ssl.keyStorePassword","password");
        HiloSSL hiloSSL = new HiloSSL(this);
        hiloSSL.start();
        
    }
    
     public void enviaFichero(String fichero, ObjectOutputStream oos){
        try
        {
            boolean enviadoUltimo=false;
            // Se abre el fichero.
            FileInputStream fis = new FileInputStream(fichero);
            
            // Se instancia y rellena un mensaje de envio de fichero
            MensajeTomaFichero mensaje = new MensajeTomaFichero();
            mensaje.nombreFichero = fichero;
            
            // Se leen los primeros bytes del fichero en un campo del mensaje
            int leidos = fis.read(mensaje.contenidoFichero);
            
            // Bucle mientras se vayan leyendo datos del fichero
            while (leidos > -1)
            {
                
                // Se rellena el n�mero de bytes leidos
                mensaje.bytesValidos = leidos;
                
                // Si no se han leido el m�ximo de bytes, es porque el fichero
                // se ha acabado y este es el �ltimo mensaje
                if (leidos < MensajeTomaFichero.LONGITUD_MAXIMA)
                {
                    mensaje.ultimoMensaje = true;
                    enviadoUltimo=true;
                }
                else
                    mensaje.ultimoMensaje = false;
                
                // Se env�a por el socket
                oos.writeObject(mensaje);
                
                // Si es el �ltimo mensaje, salimos del bucle.
                if (mensaje.ultimoMensaje)
                    break;
                
                // Se crea un nuevo mensaje
                mensaje = new MensajeTomaFichero();
                mensaje.nombreFichero = fichero;
                
                // y se leen sus bytes.
                leidos = fis.read(mensaje.contenidoFichero);
                Thread.sleep(1000);
            }
            
            if (enviadoUltimo==false)
            {
                mensaje.ultimoMensaje=true;
                mensaje.bytesValidos=0;
                oos.writeObject(mensaje);
            }
            // Se cierra el ObjectOutputStream
           // oos.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
     
     
     
    public void enviarHash(String archivo, ObjectOutputStream objectOutputStream){
        FileInputStream fis = null;
        try {
            String datafile = archivo;
            MessageDigest md = MessageDigest.getInstance("MD5");
            fis = new FileInputStream(datafile);
            byte[] dataBytes = new byte[1024];
            int nread = 0; 
            while ((nread = fis.read(dataBytes)) != -1) {
            md.update(dataBytes, 0, nread);
            }

            byte[] mdbytes = md.digest();

             //convert the byte to hex format
            StringBuffer sb = new StringBuffer("");
            for (int i = 0; i < mdbytes.length; i++) {
                sb.append(Integer.toString((mdbytes[i] & 0xff) + 0x100, 16).substring(1));
            }

         //   System.out.println("Digest(in hex format):: " + sb.toString());
            
            objectOutputStream.writeObject(sb.toString());
            fis.close();
            objectOutputStream.close();
            } catch (IOException ex) {
                Logger.getLogger(LogicaAplicacion.class.getName()).log(Level.SEVERE, null, ex);
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(LogicaAplicacion.class.getName()).log(Level.SEVERE, null, ex);
            } 
        }
        
    

}    

