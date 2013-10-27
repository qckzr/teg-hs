/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;
import java.io.*;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Clase que implementa la lógica de la aplicación para el tópico Modelo Carga
 * y Descarga - Servidor.
 * @author Héctor Sam.
 */
public class LogicaAplicacion {

    private static LogicaAplicacion instancia = null;
    private LibreriaMensajes libreriaMensajes;
    private int puertoAgente;
    private DatosAplicacion datosAplicacion;
    private static final String archivo = "/home/pi/Desktop/ModeloCargaDescarga.txt";
    private static final int PUERTO = 5555;
    private ObjectOutputStream objectOutputStream;
    private boolean archivoEnviado = false;
    private EsperaArchivo esperaArchivo;
    

    public String getArchivo(){
        return archivo;
    }
    
    public int getPuerto(){
        return PUERTO;
    }

    public boolean isArchivoEnviado() {
        return archivoEnviado;
    }

    public void setArchivoEnviado(boolean archivoEnviado) {
        this.archivoEnviado = archivoEnviado;
    }

    public LibreriaMensajes getLibreriaMensajes() {
        return libreriaMensajes;
    }

    public void setLibreriaMensajes(LibreriaMensajes libreriaMensajes) {
        this.libreriaMensajes = libreriaMensajes;
    }
    
    
    
    
    
    private LogicaAplicacion(LibreriaMensajes libreriaMensajes,
            DatosAplicacion datosAplicacion,int puertoAgente) {
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        esperaArchivo = new EsperaArchivo(this);
        esperaArchivo.start();
        
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
        if (instancia == null){
            instancia = new LogicaAplicacion(libreriaMensajes,
                    datosAplicacion, puertoAgente);
        }
        return instancia;
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

    public ObjectOutputStream getObjectOutputStream() {
        return objectOutputStream;
    }

    public void setObjectOutputStream(ObjectOutputStream objectOutputStream) {
        this.objectOutputStream = objectOutputStream;
    }

    public EsperaArchivo getEsperaArchivo() {
        return esperaArchivo;
    }

    public void setEsperaArchivo(EsperaArchivo esperaArchivo) {
        this.esperaArchivo = esperaArchivo;
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
                        getNumeroNodoAplicacion(),"localhost",puertoAgente)) {
                    return true;
                }
                break;
            default:{
                
                System.out.println("Se ha recibido el mensaje: \""
                        +mensaje.getMensaje()+"\" proveniente del host: "
                        +mensaje.getIpOrigen());
                if (mensaje.getMensaje().contains("enviar:")){
                    solicitarArchivo(archivo,mensaje.getIpOrigen(), PUERTO);
                    archivoEnviado = false;
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
        libreriaMensajes.enviarMensaje("id<"
                +datosAplicacion.getIdProceso(),ipServidor);
    }
    
    
    
    /**
     * Método que permite escribir en el archivo local.
     * @param mensaje El mensaje a escribir
     * @return True si se pudo escribir. False en caso contrario.
     */
    public boolean escribirArchivo(Mensaje mensaje){
        String datos = mensaje.getMensaje().substring(
                mensaje.getMensaje().indexOf(":"));
        FileWriter fileWritter = null;
        File file = new File(archivo);
        BufferedWriter bufferWritter;
         try {
                if(!file.exists()){
    			file.createNewFile();
    		}
                fileWritter = new FileWriter(file.getName(),true);
                bufferWritter = new BufferedWriter(fileWritter);
                bufferWritter.write(datos);
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
                return false;
            }
        }
         return true;
    }
    
//    public void leerArchivo(){
//        File file = new File(archivo);
//		FileInputStream fis = null;
// 
//		try {
//			fis = new FileInputStream(file);
//			int content;
//			while ((content = fis.read()) != -1) {
//				// convert to char and display it
//				System.out.print((char) content);
//			}
//		} catch (IOException e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if (fis != null)
//					fis.close();
//			} catch (IOException ex) {
//				ex.printStackTrace();
//			}
//		}
//    }
    
    /**
     * Método que permite leer el archivo local.
     * @return True si el archivo pudo ser leido. False en caso contrario.
     */
    public boolean leerArchivo(){
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
    
//     public void sendFile(Mensaje mensaje) {
//        try {
//            Socket socket = new Socket(mensaje.getIpOrigen(),PUERTO);
//              objectOutputStream = 
//                     new ObjectOutputStream(socket.getOutputStream());
//          
//            objectOutputStream.flush();
//            streamFile(new File(archivo));
//        } catch (IOException ex) {
//            Logger.getLogger(LogicaAplicacion.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        
//    }    
// 
//    public void streamFile(File file) throws IOException {
//        long fileSize = file.length();
//        long completed = 0;
//        int step = 150000;
// 
//        // creates the file stream
//        FileInputStream fileStream = new FileInputStream(file);
// 
//        // sending a message before streaming the file
//        objectOutputStream.writeObject("SENDING_FILE|" + 
//                             file.getName() + 
//                             "|" + fileSize);
// 
//        byte[] buffer = new byte[step];
//        while (completed <= fileSize) {
//            fileStream.read(buffer);
//            objectOutputStream.write(buffer);
//            completed += step;
//        }
//        objectOutputStream.writeObject("SEND_COMPLETE"); 
//        fileStream.close();
//    }
    
//     public void descargar(Mensaje mensaje){
//        try {
//            Socket socket = new Socket(mensaje.getMensaje(),PUERTO);
//            InputStream in = socket.getInputStream();
//            OutputStream out = new FileOutputStream(archivo);
//            copy(in, out);
//            socket.close();
//        } catch (UnknownHostException ex) {
//            Logger.getLogger(LogicaAplicacion.class.getName()).log(Level.SEVERE, null, ex);
//        } catch (IOException ex) {
//            Logger.getLogger(LogicaAplicacion.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
//    
//    void copy(InputStream in, OutputStream out) throws IOException {
//        byte[] buf = new byte[8192];
//        int len = 0;
//        while ((len = in.read(buf)) != -1) {
//            out.write(buf, 0, len);
//        }
//    }
    
    /**
     * Método que permite solicitar un archivo específico a un servidor.
     * @param fichero El nombre del archivo a solicitar.
     * @param servidor La dirección ip del servidor.
     * @param puerto El puerto de conexión.
     * @return True si el archivo pudo ser recibido. False en caso contrario.
     */
     public boolean solicitarArchivo(String fichero, String servidor, int puerto) {
        
         Socket socket;
         ObjectOutputStream oos;
         MensajeDameFichero mensaje;
         FileOutputStream fos;
         ObjectInputStream ois;
         MensajeTomaFichero mensajeRecibido;
         Object mensajeAux;
         try {
            // Se abre el socket.
            socket = new Socket(servidor, puerto);

            
            oos = new ObjectOutputStream(socket
                    .getOutputStream());
            mensaje = new MensajeDameFichero();
            mensaje.nombreFichero = fichero;
            oos.writeObject(mensaje);

            fos = new FileOutputStream(mensaje.nombreFichero);

            
            ois = new ObjectInputStream(socket
                    .getInputStream());
            
            do {
                mensajeAux = ois.readObject();
                if (mensajeAux instanceof MensajeTomaFichero) {
                    mensajeRecibido = (MensajeTomaFichero) mensajeAux;
                    fos.write(mensajeRecibido.contenidoFichero, 0,
                            mensajeRecibido.bytesValidos);
                } else {

                    System.err.println("Mensaje no esperado "
                            + mensajeAux.getClass().getName());
                    break;
                }
            } while (!mensajeRecibido.ultimoMensaje);
            
            fos.close();
            ois.close();
            socket.close();
            libreriaMensajes.enviarMensaje("Archivo recibido");
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    
    
    
    
    
   
    
    
   
    
   
    }

    public boolean eliminarArchivo() {
        File file = new File(archivo);
        if (file.delete())
            return true;
        else
            return false;
    }
    
    
   
}
