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
    private String ipServidor;
    private ObjectOutputStream objectOutputStream;
    private boolean archivoRecibido = false;
    private EsperaArchivo esperaArchivo;
    

    public String getArchivo(){
        return archivo;
    }
    
    public int getPuerto(){
        return PUERTO;
    }

    public boolean isArchivoRecibido() {
        return archivoRecibido;
    }

    public void setArchivoRecibido(boolean archivoRecibido) {
        this.archivoRecibido = archivoRecibido;
    }
    
    
    
    
    

    public LogicaAplicacion(LibreriaMensajes libreriaMensajes, DatosAplicacion datosAplicacion,int puertoAgente,String ipServidor) {
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        this.ipServidor = ipServidor;
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
                if (mensaje.getMensaje().contains("archivo:")){
         //           descargar();
                    solicitarArchivo(archivo, ipServidor, PUERTO);
                    archivoRecibido = true;
                }
                else if (mensaje.getMensaje().contains("escribir:") && archivoRecibido == true){
                    escribirArchivo(mensaje);
                }
                else if (mensaje.getMensaje().contains("enviar:") && archivoRecibido == true){
                    libreriaMensajes.enviarMensaje("enviar:", ipServidor);
                }
                else if (mensaje.getMensaje().contains("ver:") && archivoRecibido == true){
                    leerArchivo();
                    
                }
            }
        };
        return false;
    }
     
    public void enviarId(String ipServidor){
        libreriaMensajes.enviarMensaje(datosAplicacion.getIdProceso(),ipServidor);
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
     
     
    public boolean eliminarArchivo(){
        File file = new File(archivo);
        if (file.delete())
            return true;
        else
            return false;
    }
    
    
    
    
    
   
    
    
   
    
   

    
    
   
}
