/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cluster;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Clase que permite escuchar a través de un hilo por las peticiones de los 
 * clientes para el envío de los archivos mediante sockets.
 * @author Héctor Sam
 */
public class EscuchaArchivo extends Thread{
    
    private boolean control = true;
    private ServerSocket serverSocket;
    private LogicaAplicacion logicaAplicacion;

    public EscuchaArchivo(int puerto, LogicaAplicacion logicaAplicacion) {
        try {
            serverSocket = new ServerSocket(puerto);
            this.logicaAplicacion = logicaAplicacion;
        } catch (IOException ex) {
            Logger.getLogger(EscuchaArchivo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    
    /**
     * Bucle infinito del hilo para esperar por las peticiones de los clientes.
     */
    @Override
    public void run(){
        
        while (control){
            escucha();
            logicaAplicacion.getLibreriaMensajes().enviarMensaje("Esperando...");
        }
    }
    
    
    /**
     * Método que espera por las peticiones del cliente para enviar el archivo 
     * (fichero)
     */
     public void escucha() {
         
         Socket cliente;
         ObjectInputStream ois;
         Object mensaje;
         try {
 
            cliente = serverSocket.accept();

            
            System.out.println("Aceptado cliente");
            logicaAplicacion.getLibreriaMensajes().enviarMensaje("Aceptado cliente");

            cliente.setSoLinger(true, 10);
            ois = new ObjectInputStream(cliente
                    .getInputStream());
            mensaje = ois.readObject();
            
            if (mensaje instanceof MensajeDameFichero) {
                
                enviaFichero(((MensajeDameFichero) mensaje).nombreFichero,
                        new ObjectOutputStream(cliente.getOutputStream()));
            } else {
                
                System.err.println (
                        "Mensaje no esperado "+mensaje.getClass().getName());
            }
            
            cliente.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Método que envía el fichero indicado a través del ObjectOutputStream indicado.
     * @param fichero Nombre de fichero a enviar.
     * @param oos ObjectOutputStream por el que enviar el fichero
     */
    private void enviaFichero(String fichero, ObjectOutputStream oos) {
        boolean enviadoUltimo;
        FileInputStream fis;
        int leidos;
        MensajeTomaFichero mensaje;
        try {
            enviadoUltimo = false;
            fis = new FileInputStream(fichero);
            
            mensaje = new MensajeTomaFichero();
            mensaje.nombreFichero = fichero;                       
            leidos = fis.read(mensaje.contenidoFichero);
            
            while (leidos > -1) { 
                
                mensaje.bytesValidos = leidos;

                if (leidos < MensajeTomaFichero.LONGITUD_MAXIMA) {
                    mensaje.ultimoMensaje = true;
                    enviadoUltimo = true;
                } else {
                    mensaje.ultimoMensaje = false;
                }
                
                oos.writeObject(mensaje);
                
                if (mensaje.ultimoMensaje) {
                    break;
                }
                
                mensaje = new MensajeTomaFichero();
                mensaje.nombreFichero = fichero;
                leidos = fis.read(mensaje.contenidoFichero);
            }
            
            if (enviadoUltimo == false) {
                mensaje.ultimoMensaje=true;
                mensaje.bytesValidos=0;
                oos.writeObject(mensaje);
            }
            oos.close();
            logicaAplicacion.getLibreriaMensajes().enviarMensaje("Archivo enviado");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    
}
