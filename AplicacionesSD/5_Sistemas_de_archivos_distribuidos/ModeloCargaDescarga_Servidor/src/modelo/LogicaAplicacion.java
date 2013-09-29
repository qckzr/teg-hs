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
 *
 * @author sam
 */
public class LogicaAplicacion {

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
    
    
    
    
    public LogicaAplicacion(LibreriaMensajes libreriaMensajes, DatosAplicacion datosAplicacion,int puertoAgente) {
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        esperaArchivo = new EsperaArchivo(this);
        esperaArchivo.start();
        
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
                if (mensaje.getMensaje().contains("enviar:")){
                    solicitarArchivo(archivo,mensaje.getIpOrigen(), PUERTO);
                    archivoEnviado = false;
                }
//                else if (archivoEnviado == true){
//                    libreriaMensajes.enviarMensaje("No se puede acceder al archivo",mensaje.getIpOrigen());
//                }
                
            }
        };
        return false;
    }
     
    public void enviarId(String ipServidor){
        libreriaMensajes.enviarMensaje("id<"+datosAplicacion.getIdProceso(),ipServidor);
    }
    
    public void enviarArchivo(){
        
    }
    
    
    public void escribirArchivo(Mensaje mensaje){
        String datos = mensaje.getMensaje().substring(mensaje.getMensaje().indexOf(":"));
        FileWriter fileWritter = null;
        File file = new File(archivo);
         try {
                if(!file.exists()){
    			file.createNewFile();
    		}
                fileWritter = new FileWriter(file.getName(),true);
                BufferedWriter bufferWritter = new BufferedWriter(fileWritter);
                bufferWritter.write(datos);
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
    }
    
    public void leerArchivo(){
        File file = new File(archivo);
		FileInputStream fis = null;
 
		try {
			fis = new FileInputStream(file);
			int content;
			while ((content = fis.read()) != -1) {
				// convert to char and display it
				System.out.print((char) content);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (fis != null)
					fis.close();
			} catch (IOException ex) {
				ex.printStackTrace();
			}
		}
    }
    
     public void sendFile(Mensaje mensaje) {
        try {
            Socket socket = new Socket(mensaje.getIpOrigen(),PUERTO);
              objectOutputStream = 
                     new ObjectOutputStream(socket.getOutputStream());
          
            objectOutputStream.flush();
            streamFile(new File(archivo));
        } catch (IOException ex) {
            Logger.getLogger(LogicaAplicacion.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }    
 
    public void streamFile(File file) throws IOException {
        long fileSize = file.length();
        long completed = 0;
        int step = 150000;
 
        // creates the file stream
        FileInputStream fileStream = new FileInputStream(file);
 
        // sending a message before streaming the file
        objectOutputStream.writeObject("SENDING_FILE|" + 
                             file.getName() + 
                             "|" + fileSize);
 
        byte[] buffer = new byte[step];
        while (completed <= fileSize) {
            fileStream.read(buffer);
            objectOutputStream.write(buffer);
            completed += step;
        }
        objectOutputStream.writeObject("SEND_COMPLETE"); 
        fileStream.close();
    }
    
     public void descargar(Mensaje mensaje){
        try {
            Socket socket = new Socket(mensaje.getMensaje(),PUERTO);
            InputStream in = socket.getInputStream();
            OutputStream out = new FileOutputStream(archivo);
            copy(in, out);
            socket.close();
        } catch (UnknownHostException ex) {
            Logger.getLogger(LogicaAplicacion.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(LogicaAplicacion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    void copy(InputStream in, OutputStream out) throws IOException {
        byte[] buf = new byte[8192];
        int len = 0;
        while ((len = in.read(buf)) != -1) {
            out.write(buf, 0, len);
        }
    }
    
     public void solicitarArchivo(String fichero, String servidor, int puerto)
    {
        try
        {
            // Se abre el socket.
            Socket socket = new Socket(servidor, puerto);

            // Se env�a un mensaje de petici�n de fichero.
            ObjectOutputStream oos = new ObjectOutputStream(socket
                    .getOutputStream());
            MensajeDameFichero mensaje = new MensajeDameFichero();
            mensaje.nombreFichero = fichero;
            oos.writeObject(mensaje);

            // Se abre un fichero para empezar a copiar lo que se reciba.
            FileOutputStream fos = new FileOutputStream(mensaje.nombreFichero);

            // Se crea un ObjectInputStream del socket para leer los mensajes
            // que contienen el fichero.
            ObjectInputStream ois = new ObjectInputStream(socket
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
                    // Se escribe en pantalla y en el fichero
                 //   System.out.print(new String(
                   //         mensajeRecibido.contenidoFichero, 0,
                     //       mensajeRecibido.bytesValidos));
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
            
            // Se cierra socket y fichero
            fos.close();
            ois.close();
            socket.close();
        } catch (Exception e)
        {
            e.printStackTrace();
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
