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
 * Clase que permite esperar por el archivo enviado por el servidor al momento
 * de realizar la solicitud.
 * @author Héctor Sam
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
            Logger.getLogger(EsperaArchivo.class.getName()).
                    log(Level.SEVERE, null, ex);
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
            if (serverSocket == null) {
                serverSocket = new ServerSocket(logicaAplicacion.getPuerto());
            } else if (serverSocket.isClosed()) {
                serverSocket = new ServerSocket(logicaAplicacion.getPuerto());
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
    
    /**
     * Método que permite escuchar por las peticiones de un cliente.
     */
    public void escucha(){
        
        Socket cliente;
        ObjectInputStream ois;
        Object mensaje;
        try {
           
            cliente = serverSocket.accept();
            cliente.setSoLinger(true, 10);

            ois = new ObjectInputStream(cliente
                    .getInputStream());
            mensaje = ois.readObject();
            
            if (mensaje instanceof MensajeDameFichero) {
                enviaFichero(((MensajeDameFichero) mensaje).nombreFichero,
                        new ObjectOutputStream(cliente.getOutputStream()));
                logicaAplicacion.eliminarArchivo();
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
     * Método que envía el archivo solicitado�a través del ObjectOutputStream
     * indicado.
     * @param fichero Nombre del archivo
     * @param oos ObjectOutputStream por el que se enviará el archivo
     */
    private void enviaFichero(String fichero, ObjectOutputStream oos) {
        boolean enviadoUltimo;
        FileInputStream fis;
        MensajeTomaFichero mensaje;
        int leidos;
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
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    
    /**
     * Método que permite eliminar el hilo de ejecución.
     */
    public void kill(){
        control = true;
    }
    
}
