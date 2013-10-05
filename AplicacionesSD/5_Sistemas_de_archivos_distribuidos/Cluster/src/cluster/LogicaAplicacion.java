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


/**
 *
 * @author sam
 */
public class LogicaAplicacion {

    private LibreriaMensajes libreriaMensajes;
    private int puertoAgente;
    private DatosAplicacion datosAplicacion;
    private ArrayList<String> nodos;
    private String rutaArchivo;
    private final static int PUERTO_ESCUCHA = 3500;
    private EscuchaArchivo escuchaArchivo;

    public LibreriaMensajes getLibreriaMensajes() {
        return libreriaMensajes;
    }

    public void setLibreriaMensajes(LibreriaMensajes libreriaMensajes) {
        this.libreriaMensajes = libreriaMensajes;
    }
    
    
    
  
    
    
    
   
    
    

    public LogicaAplicacion(LibreriaMensajes libreriaMensajes, DatosAplicacion datosAplicacion,int puertoAgente) {
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        nodos = new ArrayList<>();
        escuchaArchivo = new EscuchaArchivo(PUERTO_ESCUCHA, this);
        escuchaArchivo.start();
   //     dividirArchivo(rutaArchivo);
    //    iniciar();
        
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
                    System.out.print(new String(
                            mensajeRecibido.contenidoFichero, 0,
                            mensajeRecibido.bytesValidos));
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
    
    
        
   
}
