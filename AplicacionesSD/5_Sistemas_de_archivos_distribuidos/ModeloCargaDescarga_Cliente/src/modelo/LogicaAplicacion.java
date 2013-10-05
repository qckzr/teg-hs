/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;
import java.io.*;
import java.net.Socket;
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
        eliminarArchivo();
        
    }
    
    public boolean verificarMensajeRecibido(Mensaje mensaje) throws InterruptedException{
        
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
                    libreriaMensajes.enviarMensaje("Solicitando archivo...");
                    solicitarArchivo(archivo, ipServidor, PUERTO);
                    Thread.sleep(5000);
                    existeArchivo();
                }
                else if (mensaje.getMensaje().contains("escribir:") && archivoRecibido == true){
                    libreriaMensajes.enviarMensaje("Escribiendo \""+mensaje.getMensaje().substring(mensaje.getMensaje().indexOf(":")+1,mensaje.getMensaje().length())+"\"");
                    escribirArchivo(mensaje);
                }
                else if (mensaje.getMensaje().contains("enviar:") && archivoRecibido == true){
                    libreriaMensajes.enviarMensaje("Enviando archivo...");
                    libreriaMensajes.enviarMensaje("enviar:", ipServidor);
                    Thread.sleep(5000);
                    eliminarArchivo();
                }
                else if (mensaje.getMensaje().contains("ver:") && archivoRecibido == true){
                    leerArchivo();
                    
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
            BufferedReader br = new BufferedReader(new FileReader(archivo));     
            if (br.readLine() == null) {
                System.out.println("No errors, and file empty");
                eliminarArchivo();
            }
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
    
    public boolean existeArchivo(){
        File f = new File(archivo);
 
	  if(f.exists()){
                    archivoRecibido = true;
                    libreriaMensajes.enviarMensaje("Archivo recibido");
		  return true;
	  }else{
		  return false;
	  }
    }
    
    
    
    
    
   
    
    
   
    
   

    
    
   
}
