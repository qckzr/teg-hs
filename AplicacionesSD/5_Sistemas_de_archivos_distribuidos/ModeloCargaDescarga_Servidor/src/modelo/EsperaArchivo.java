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
 * Clase que permite esperar por la solicitud de archivo del cliente para 
 * enviarlo.
 * @author Héctor Sam
 */
public class EsperaArchivo extends Thread{
    
    private boolean control = true;
    private ServerSocket serverSocket;
    private LogicaAplicacion logicaAplicacion;
    
    
    public EsperaArchivo(LogicaAplicacion logicaAplicacion){
        try {
             serverSocket = new ServerSocket(logicaAplicacion.getPuerto());
             this.logicaAplicacion = logicaAplicacion;
        } catch (IOException ex) {
            Logger.getLogger(EsperaArchivo.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
    }
    
    
    
    @Override
    public void run(){

        while (control){
            System.out.println("Esperando...");
            escucha();
            logicaAplicacion.getLibreriaMensajes().enviarMensaje("Esperando...");
        }
    }
    
    /**
     * Método que permite escuchar por las peticiones de archivos de los clientes.
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
            if (mensaje instanceof MensajeDameFichero 
                    && !logicaAplicacion.isArchivoEnviado()){
                logicaAplicacion.getLibreriaMensajes().enviarMensaje("Enviando archivo...");
                enviaFichero(((MensajeDameFichero) mensaje).nombreFichero,
                        new ObjectOutputStream(cliente.getOutputStream()));
                logicaAplicacion.setArchivoEnviado(true);
                logicaAplicacion.eliminarArchivo();
            }
            else {
            
                System.out.println("El archivo ya fue enviado a un nodo");
                logicaAplicacion.getLibreriaMensajes().enviarMensaje(""
                        + "El archivo ya fue enviado a un nodo");
            }
            
            cliente.close();
        } catch (Exception e)
        {
            e.printStackTrace();
        }
    }

    /**
     * Método que envía el archivo indicado a través del ObjectOutputStream.
     * @param fichero Nombre del archivo.
     * @param oos ObjectOutputStream por el que enviará el archivo.
     * @return True si pudo ser enviado. False en caso contrario.
     */
    private boolean enviaFichero(String fichero, ObjectOutputStream oos) {
        
        boolean enviadoUltimo = false;
        FileInputStream fis;
        MensajeTomaFichero mensaje;
        int leidos;
        try {
            
            
            fis = new FileInputStream(fichero);
            
            mensaje = new MensajeTomaFichero();
            mensaje.nombreFichero = fichero;
            
            
            leidos = fis.read(mensaje.contenidoFichero);
            
            while (leidos > -1) {
                
                mensaje.bytesValidos = leidos;
                if (leidos < MensajeTomaFichero.LONGITUD_MAXIMA) {
                    mensaje.ultimoMensaje = true;
                    enviadoUltimo = true;
                }
                else {
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
                mensaje.ultimoMensaje = true;
                mensaje.bytesValidos = 0;
                oos.writeObject(mensaje);
            }
            
            oos.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    /**
     * Método que permite eliminar el hilo de ejecución.
     */
    public void kill(){
        control = false;
    }
    
}
