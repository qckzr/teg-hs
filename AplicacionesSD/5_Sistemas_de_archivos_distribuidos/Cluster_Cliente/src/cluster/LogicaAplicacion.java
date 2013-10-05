/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cluster;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;
import java.io.*;
import java.net.Socket;
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
    private ArrayList<String> nodos;
    private static final int PUERTO_ARCHIVO = 3500;
    private String nombreArchivoCompleto = "/home/pi/Desktop/archivo.txt";
    private String nombreArchivo1 = "/home/pi/Desktop/1_archivo.txt";
    private String nombreArchivo2 = "/home/pi/Desktop/2_archivo.txt";
    private String nombreArchivo3 = "/home/pi/Desktop/3_archivo.txt";
    private int archivoRecibido;
    private Tiempo tiempo;

    public int getArchivoRecibido() {
        return archivoRecibido;
    }

    public LibreriaMensajes getLibreriaMensajes() {
        return libreriaMensajes;
    }

    public void setLibreriaMensajes(LibreriaMensajes libreriaMensajes) {
        this.libreriaMensajes = libreriaMensajes;
    }
    
    

    public void setArchivoRecibido(int archivoRecibido) {
        this.archivoRecibido = archivoRecibido;
    }

    public Tiempo getTiempo() {
        return tiempo;
    }

    public void setTiempo(Tiempo tiempo) {
        this.tiempo = tiempo;
    }
    
    
   
    
    

    public LogicaAplicacion(LibreriaMensajes libreriaMensajes, DatosAplicacion datosAplicacion,int puertoAgente) {
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        nodos = new ArrayList<>();
        
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
                if (mensaje.getMensaje().contains("archivo_partes")){
                    libreriaMensajes.enviarMensaje("Archivo por partes...");
                    esperarArchivos();
                }
                else if (mensaje.getMensaje().contains("archivo_completo")){
                    libreriaMensajes.enviarMensaje("Archivo completo...");
                    solicitarArchivo(nombreArchivoCompleto,nodos.get(0),PUERTO_ARCHIVO);
                    
                }
                
            }
        };
        return false;
    }
    
    public boolean agregarNodo(String ip){
        nodos.add(ip);
        return true;
    }
     
    public void enviarId(String ipServidor){
        libreriaMensajes.enviarMensaje("id<"+datosAplicacion.getIdProceso(),ipServidor);
    }
    
    
    
//    public void dividirArchivo(String rutaArchivo){
//        try {
//            SplitFiles splitFiles = new SplitFiles(rutaArchivo);
//            splitFiles.split(CANTIDAD_ARCHIVOS);
//            nombreArchivo = rutaArchivo.substring(rutaArchivo.indexOf("archivoCluster.txt"));
//            System.out.println("El archivo fue dividido");
//        } catch (FileNotFoundException ex) {
//            Logger.getLogger(LogicaAplicacion.class.getName()).log(Level.SEVERE, null, ex);
//        } catch (IOException ex) {
//            Logger.getLogger(LogicaAplicacion.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        
//    }
    
    
    public void solicitarArchivo(String fichero, String servidor, int puerto)
    {
        try
        {
            // Se abre el socket.
            Tiempo tiempo = new Tiempo();
            tiempo.start();
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
            System.out.println("\n Segundos que tardó el archivo: "+tiempo.getSegundos());
            libreriaMensajes.enviarMensaje("\n Segundos que tardó el archivo: "+tiempo.getSegundos());
            tiempo.kill();
        } catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    
    public void esperarArchivos(){
        try {
            archivoRecibido = 0;
            File file = new File("archivoRecibido.txt");
            file.createNewFile();
            EscuchaArchivo escuchaArchivo1 = new EscuchaArchivo(this, nombreArchivo1, nodos.get(0), PUERTO_ARCHIVO);
            EscuchaArchivo escuchaArchivo2 = new EscuchaArchivo(this, nombreArchivo2, nodos.get(1), PUERTO_ARCHIVO);
            EscuchaArchivo escuchaArchivo3 = new EscuchaArchivo(this, nombreArchivo3, nodos.get(2), PUERTO_ARCHIVO);
            tiempo = new Tiempo();
            tiempo.start();
            escuchaArchivo1.start();
            escuchaArchivo2.start();
            escuchaArchivo3.start();
        } catch (IOException ex) {
            Logger.getLogger(LogicaAplicacion.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    
        
   
}
