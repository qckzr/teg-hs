/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author sam
 */
public class EsperaArchivo extends Thread{
    
    private boolean control = true;
    private LogicaAplicacion logicaAplicacion;
    private ServerSocket serverSocket;
    
    
    public EsperaArchivo(LogicaAplicacion logicaAplicacion){
        try {
            serverSocket = new ServerSocket(logicaAplicacion.getPuerto());
            this.logicaAplicacion = logicaAplicacion;
        } catch (IOException ex) {
            Logger.getLogger(EsperaArchivo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    @Override
    public void run(){
        while (control){
           escucha();
         
        }    
    }
    
    
    public final void iniciar(){
        try {
            if (serverSocket == null)
                serverSocket = new ServerSocket(logicaAplicacion.getPuerto());
            else if (serverSocket.isClosed())
                serverSocket = new ServerSocket(logicaAplicacion.getPuerto());
        } catch (IOException ex) {
        //    Logger.getLogger(EsperaArchivo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
     public void escucha()
    {
        try
        {
            // Se abre el socket servidor
       

            // Se espera un cliente
            Socket cliente = serverSocket.accept();

   

            // Cuando se cierre el socket, esta opci�n hara que el cierre se
            // retarde autom�ticamente hasta 10 segundos dando tiempo al cliente
            // a leer los datos.
            cliente.setSoLinger(true, 10);

            // Se lee el mensaje de petici�n de fichero del cliente.
            ObjectInputStream ois = new ObjectInputStream(cliente
                    .getInputStream());
            Object mensaje = ois.readObject();
            
            // Si el mensaje es de petici�n de fichero
            if (mensaje instanceof MensajeDameFichero)
            {
                // Se muestra en pantalla el fichero pedido y se envia
                enviaFichero(((MensajeDameFichero) mensaje).nombreFichero,
                        new ObjectOutputStream(cliente.getOutputStream()));
                logicaAplicacion.eliminarArchivo();
            }
            else
            {
                // Si no es el mensaje esperado, se avisa y se sale todo.
                System.err.println (
                        "Mensaje no esperado "+mensaje.getClass().getName());
            }
            
            // Cierre de sockets 
            cliente.close();
        } catch (Exception e)
        {
            e.printStackTrace();
        }
    }

    /**
     * Env�a el fichero indicado a trav�s del ObjectOutputStream indicado.
     * @param fichero Nombre de fichero
     * @param oos ObjectOutputStream por el que enviar el fichero
     */
    private void enviaFichero(String fichero, ObjectOutputStream oos)
    {
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
            }
            
            if (enviadoUltimo==false)
            {
                mensaje.ultimoMensaje=true;
                mensaje.bytesValidos=0;
                oos.writeObject(mensaje);
            }
            // Se cierra el ObjectOutputStream
            oos.close();
        } catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    
    
    public void kill(){
        control = true;
    }
    
}
