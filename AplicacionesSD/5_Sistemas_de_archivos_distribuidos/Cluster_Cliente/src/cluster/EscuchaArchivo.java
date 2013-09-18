/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cluster;

import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;

/**
 *
 * @author sam
 */
public class EscuchaArchivo extends Thread{
    
 //   private boolean control;
    private LogicaAplicacion logicaAplicacion;
    private String nombreArchivo;
    private String ipServidor;
    private int puerto;

    public EscuchaArchivo(LogicaAplicacion logicaAplicacion, String nombreArchivo, String ipServidor,int puerto) {
        this.logicaAplicacion = logicaAplicacion;
        this.nombreArchivo = nombreArchivo;
        this.puerto = puerto;
        this.ipServidor = ipServidor;
    }
    
    
    
    @Override
    public void run(){
        
        solicitarArchivo(nombreArchivo, ipServidor, puerto);
        
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
            FileOutputStream fos = new FileOutputStream("archivoRecibido.txt",true);

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
        //            System.out.print(new String(
          //                  mensajeRecibido.contenidoFichero, 0,
            //                mensajeRecibido.bytesValidos));
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
            logicaAplicacion.setArchivoRecibido(logicaAplicacion.getArchivoRecibido()+1);
            if (logicaAplicacion.getArchivoRecibido()==3){
                System.out.println("Segundos que tardó el archivo: "+logicaAplicacion.getTiempo().getSegundos());
                logicaAplicacion.getTiempo().kill();
            }

        } catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    
}
