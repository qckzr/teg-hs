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
    private String ipServidor;
    private SSLSocket socketCliente;
    private int archivoActual;
    

    public int getPuerto(){
        return PUERTO;
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

    public String getIpServidor() {
        return ipServidor;
    }

    public void setIpServidor(String ipServidor) {
        this.ipServidor = ipServidor;
    }
    
    
    
    
    /**
     * Constructor de la clase
     * @param libreriaMensajes Librería de mensajes.
     * @param datosAplicacion Datos de la aplicación.
     * @param puertoAgente Puerto de escucha del agente.
     * @param ipServidor Dirección ip del servidor para el socket SSL.
     */
    private LogicaAplicacion(LibreriaMensajes libreriaMensajes, 
            DatosAplicacion datosAplicacion,int puertoAgente, String ipServidor) {
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        this.ipServidor = ipServidor;
        eliminarArchivos();
        
    }
    
    public static LogicaAplicacion getInstancia(LibreriaMensajes libreriaMensajes, 
            DatosAplicacion datosAplicacion,int puertoAgente, String ipServidor){
        if (instancia == null){
            instancia = new LogicaAplicacion(libreriaMensajes,
                    datosAplicacion, puertoAgente, ipServidor);
        }
        return instancia;     
    }
    
    /**
     * Método que chequea el tipo de mensaje recibido.
     * @param mensaje El mensaje recibido.
     * @return True si es un mensaje del agente. False en caso contrario.
     */
    public boolean verificarMensajeRecibido(Mensaje mensaje){
        boolean retorno = false;
        switch (mensaje.getMensaje()){
            case "aplicacion": 
                if (libreriaMensajes.enviarMensaje(
                        datosAplicacion.getNombreAplicacion(),"localhost",
                        puertoAgente))
                    retorno = true;
                break;
            case "nodo":
                if (libreriaMensajes.enviarMensaje(
                        datosAplicacion.getNumeroNodoAplicacion(),"localhost",
                        puertoAgente))
                    retorno = true;
                break;
            default:{
                
                System.out.println("Se ha recibido el mensaje: \""
                        +mensaje.getMensaje()+"\" proveniente del host: "
                        +mensaje.getIpOrigen());
                if (mensaje.getMensaje().contains("archivo:")){
                    libreriaMensajes.enviarMensaje("Solicitando archivo...");
                    eliminarArchivos();
                    solicitarArchivo(retornarArchivo(mensaje.getMensaje()),
                            ipServidor, PUERTO);    
                }
                
            }
        };
        return retorno;
    }
    
    /**
     * Método que permite enviar el número de proceso al servidor central.
     * @param ipServidor Dirección Ip del servidor central.
     */
    public void enviarId(String ipServidor){
        libreriaMensajes.enviarMensaje("id<"+datosAplicacion.getIdProceso(),
                ipServidor);
        libreriaMensajes.enviarMensaje("Ejecutable inicializado");
    }
    
   

   /**
    * Método que permite establecer una conexión segura entre dos hosts a través
    * de Sockets SSL.
    * @param ip La dirección ip del servidor.
    * @param puerto El puerto del servidor.
    * @return True si se realiza la conexión. False en caso contrario.
    */
    public boolean conectarse(String ip,int puerto) {
  
       boolean retorno = false;
       if (socketCliente == null || socketCliente.isClosed()){
            SSLSocketFactory fact = (SSLSocketFactory)SSLSocketFactory.getDefault();
            try {
                socketCliente = (SSLSocket)fact.createSocket( ip,puerto );
                System.out.println("Clase: "+socketCliente.getClass());
                libreriaMensajes.enviarMensaje("Clase: "+socketCliente.getClass());
                
                retorno = true;
            } catch (IOException ex) {
                Logger.getLogger(LogicaAplicacion.class.getName()).
                        log(Level.SEVERE, null, ex);
                retorno = false;
            }
        }
        return  retorno;
    }
  
    /**
     * Método que permite solicitar un archivo particular al servidor.
     * @param fichero El archivo a buscar en el servidor.
     * @param servidor La dirección ip del servidor.
     * @param puerto El puerto de escucha.
     */
  public void solicitarArchivo(String fichero, String servidor, int puerto){
      
        try{
            conectarse(ipServidor,PUERTO);

            ObjectOutputStream oos = new ObjectOutputStream(socketCliente
                    .getOutputStream());
            MensajeDameFichero mensaje = new MensajeDameFichero();
            mensaje.nombreFichero = fichero;
            oos.writeObject(mensaje);

            FileOutputStream fos = new FileOutputStream(mensaje.nombreFichero);

            ObjectInputStream ois = new ObjectInputStream(socketCliente
                    .getInputStream());
            MensajeTomaFichero mensajeRecibido;
            Object mensajeAux;
            do{
                
                mensajeAux = ois.readObject();
                
                if (mensajeAux instanceof MensajeTomaFichero){
                    mensajeRecibido = (MensajeTomaFichero) mensajeAux;
                    fos.write(mensajeRecibido.contenidoFichero, 0,
                            mensajeRecibido.bytesValidos);
                } else{
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
            fos.close();
            ois.close();
            socketCliente.close();
          
        } catch (Exception e){
            e.printStackTrace();
        }
    }
  
  /**
   * Método que permite obtener el hash MD5 de un archivo.
   * @param archivo El archivo al que se le quiere obtener el hash
   * @return El hash md5 del archivo.
   */
  public String hashArchivo(String archivo){
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
            stringBuffer = new StringBuffer("");
            for (int i = 0; i < mdbytes.length; i++) {
                stringBuffer.append(Integer.toString((mdbytes[i] & 0xff) 
                        + 0x100, 16).substring(1));
            }

            
            return stringBuffer.toString();
            } catch (IOException ex) {
                Logger.getLogger(LogicaAplicacion.class.getName()).
                        log(Level.SEVERE, null, ex);
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(LogicaAplicacion.class.getName()).
                        log(Level.SEVERE, null, ex);
            } 
        return "";
    }
  
    /**
     * Método que permite devolver un archivo obtenido por el mensaje recibido.
     * @param mensaje El mensaje con el nombre del archivo.
     * @return El nombre del archivo actual
     */
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
    
    /**
     * Método que permite eliminar los archivos del nodo actual.
     */
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
    
    /**
     * Método que permite comparar el hash recibido con un hash del archivo.
     * @param hashActual El hash recibido por parte del servidor.
     */
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
        } else{
            System.out.println("Los hash son distintos");
            libreriaMensajes.enviarMensaje("Los hash son distintos");
        }
            
    }
  
  
        
   
   
    
  
    
    
   
}
