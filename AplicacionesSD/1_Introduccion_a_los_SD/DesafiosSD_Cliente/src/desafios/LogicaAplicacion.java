/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package desafios;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;
import java.io.*;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.SSLSocketFactory;

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
    private String ipServidor;
    private SSLSocket socketCliente;
    private int archivoActual;
    

    public int getPuerto(){
        return PUERTO;
    }
    
    
    

    public LogicaAplicacion(LibreriaMensajes libreriaMensajes, DatosAplicacion datosAplicacion,int puertoAgente, String ipServidor) {
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        this.ipServidor = ipServidor;
        
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
                libreriaMensajes.enviarMensaje("Se ha recibido el mensaje: \""+mensaje.getMensaje()+"\" proveniente del host: "+mensaje.getIpOrigen());
                if (mensaje.getMensaje().contains("archivo:"))
                    eliminarArchivos();
                    solicitarArchivo(retornarArchivo(mensaje.getMensaje()), ipServidor, PUERTO);    
                
            }
        };
        return false;
    }
     
    public void enviarId(String ipServidor){
        libreriaMensajes.enviarMensaje("id<"+datosAplicacion.getIdProceso(),ipServidor);
    }
    
   

   
    public boolean conectarse(String ip,int puerto) {
  
      // Obtenemos el objeto de tipo Factory para crear sockets SSL
       if (socketCliente==null || socketCliente.isClosed()){
            SSLSocketFactory fact = (SSLSocketFactory)SSLSocketFactory.getDefault();
            try {
                socketCliente = (SSLSocket)fact.createSocket( ip,puerto );
                System.out.println("Clase: "+socketCliente.getClass());
                libreriaMensajes.enviarMensaje("Clase: "+socketCliente.getClass());
                
                return true;
            } catch (IOException ex) {
                Logger.getLogger(LogicaAplicacion.class.getName()).log(Level.SEVERE, null, ex);
                return false;
            }
        }
           else return true;
    }
  
  public void solicitarArchivo(String fichero, String servidor, int puerto)
    {
        try
        {
            // Se abre el socket.
            conectarse(ipServidor,PUERTO);
            // Se env�a un mensaje de petici�n de fichero.
            ObjectOutputStream oos = new ObjectOutputStream(socketCliente
                    .getOutputStream());
            MensajeDameFichero mensaje = new MensajeDameFichero();
            mensaje.nombreFichero = fichero;
            oos.writeObject(mensaje);

            // Se abre un fichero para empezar a copiar lo que se reciba.
            FileOutputStream fos = new FileOutputStream(mensaje.nombreFichero);

            // Se crea un ObjectInputStream del socket para leer los mensajes
            // que contienen el fichero.
            ObjectInputStream ois = new ObjectInputStream(socketCliente
                    .getInputStream());
            MensajeTomaFichero mensajeRecibido;
            Object mensajeAux;
            do
            {
                // Se lee el mensaje en una variabla auxiliar
                mensajeAux = ois.readObject();
                
                // Si es del tipo esperado, se trata
                if (mensajeAux instanceof MensajeTomaFichero)
                {
                    mensajeRecibido = (MensajeTomaFichero) mensajeAux;
                    fos.write(mensajeRecibido.contenidoFichero, 0,
                            mensajeRecibido.bytesValidos);
                } else
                {
                    // Si no es del tipo esperado, se marca error y se termina
                    // el bucle
                    System.err.println("Mensaje no esperado "
                            + mensajeAux.getClass().getName());
                    break;
                }
            } while (!mensajeRecibido.ultimoMensaje);
            System.out.println("Archivo recibido");
            libreriaMensajes.enviarMensaje("Archivo recibido");
            String hash = (String) ois.readObject();
            System.out.println("Hash recibido: "+hash);
            libreriaMensajes.enviarMensaje("Hash recibido: "+hash);
            compararHash(hash);
            // Se cierra socket y fichero
            fos.close();
            ois.close();
            socketCliente.close();
          
        } catch (Exception e)
        {
            e.printStackTrace();
        }
    }
  
  public String hashArchivo(String archivo){
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
            
            return sb.toString();
            } catch (IOException ex) {
                Logger.getLogger(LogicaAplicacion.class.getName()).log(Level.SEVERE, null, ex);
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(LogicaAplicacion.class.getName()).log(Level.SEVERE, null, ex);
            } 
        return "";
    }
  
  
    public String retornarArchivo(String mensaje){
        String archivo = mensaje.substring(mensaje.indexOf(":")+1);
        switch (archivo){
            case "1":  archivoActual = 1;
                    return archivo1;
            case "2": archivoActual = 2;
                    return archivo2;
            case "3": archivoActual = 3;
                    return archivo3;
                
                
        }
        return "";
    }
    
    
    public void eliminarArchivos(){
        File file1 = new File(archivo1);
        if (file1.exists())
            file1.delete();
        File file2 = new File(archivo2);
        if (file2.exists())
            file2.delete();
        File file3 = new File(archivo3);
        if (file3.exists())
            file3.delete();
    }
    
    public void compararHash(String hashActual){
        String hashArchivoActual = "";
        switch (archivoActual){
            case 1: hashArchivoActual = hashArchivo(archivo1);
                break;
            case 2: hashArchivoActual = hashArchivo(archivo2);
                break;
            case 3: hashArchivoActual = hashArchivo(archivo3);
                break;
        }
        System.out.println("Hash archivo recibido: "+hashArchivoActual);
        libreriaMensajes.enviarMensaje("Hash archivo recibido: "+hashArchivoActual);
        if (hashActual.contentEquals(hashArchivoActual)){
            System.out.println("Los hash son iguales");
            libreriaMensajes.enviarMensaje("Los hash son iguales");
        }
        else{
            System.out.println("Los hash son distintos");
            libreriaMensajes.enviarMensaje("Los hash son distintos");
        }
            
    }
  
  
        
   
   
    
  
    
    
   
}
