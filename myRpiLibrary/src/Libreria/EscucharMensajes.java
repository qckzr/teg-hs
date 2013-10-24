package Libreria;


import agente.InformacionAgente;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.SocketException;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * Clase que espera por los mensajes provenientes de un agente o de un host
 * determinado.
 * 
 * @author Hector
 */
public class  EscucharMensajes extends Thread {

    private boolean control = true;
    private ServerSocket serverSocket;
    private LibreriaMensajes lib;

    
    /**
     * Constructor de la clase
     * 
     * @param lib Libreria de mensajes.
     * @param puerto Puerto de escucha
     */
    public EscucharMensajes(LibreriaMensajes lib,int puerto){
        try {
            serverSocket = new ServerSocket(puerto);
            this.lib = lib;
        } catch (IOException ex) {
            Logger.getLogger(EscucharMensajes.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
    }

    public Boolean getControl() {
        return control;
    }

    public void setControl(Boolean control) {
        this.control = control;
    }

    public LibreriaMensajes getLib() {
        return lib;
    }

    public void setLib(LibreriaMensajes lib) {
        this.lib = lib;
    }

    public ServerSocket getServerSocket() {
        return serverSocket;
    }

    public void setServerSocket(ServerSocket serverSocket) {
        this.serverSocket = serverSocket;
    }
    
    
    
    /**
     * Espera por mensajes, si se recibe un objeto tipo Mensaje entonces se
     * almacena en la lista de mensajes. Si se recibe un objeto de tipo Informacion
     * Agente entonces se almacena en la lista de mensajesAgentes.
     */
    @Override
    public void run(){
        Socket socket;
        ObjectInputStream objectInputStream;
        while (control){
            
            try {
                
                socket = serverSocket.accept(); 
                 objectInputStream = new ObjectInputStream(socket.getInputStream()) ;
                Object object = objectInputStream.readObject();
                if (object instanceof Mensaje){
                    lib.agregarMensajeRecibido((Mensaje) object);
                }
                else if (object instanceof InformacionAgente){
                    lib.agregarMensajeRecibido((InformacionAgente)object);
                }
                socket.close();

            } catch (ClassNotFoundException ex) {
            } catch (SocketException ex){
                System.out.println("Se está reseteando...!");
        
            } catch (IOException ex) {
        
            }
        }
    }
    
    /**
     * Método que elimina el socket y mata al hilo actual.
     */
    public void kill(){
        control = false;
        try {
            serverSocket.close();
        } catch (IOException ex) {
            Logger.getLogger(EscucharMensajes.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
    }

}
