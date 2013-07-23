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
 * @author Hector
 */
public class EscucharMensajes extends Thread {

    private boolean control = true;
    private ServerSocket serverSocket;
    private LibreriaMensajes lib;

    public EscucharMensajes(LibreriaMensajes lib,int puerto){
        try {
            serverSocket = new ServerSocket(puerto);
            this.lib = lib;
        } catch (IOException ex) {
            Logger.getLogger(EscucharMensajes.class.getName()).log(Level.SEVERE, null, ex);
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
    
    
    @Override
    public void run(){

        while (control){
            
            try {
                
                Socket s = serverSocket.accept(); 
                ObjectInputStream o = new ObjectInputStream(s.getInputStream()) ;
                Object object = o.readObject();
                if (object instanceof Mensaje)
                    lib.agregarMensajeRecibido((Mensaje) object);
                else if (object instanceof InformacionAgente)
                    lib.agregarMensajeRecibido((InformacionAgente)object);
                s.close();
                 
                
                
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(EscucharMensajes.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SocketException ex){
                System.out.println("Se está reseteando...!");
            } catch (IOException ex) {
                Logger.getLogger(EscucharMensajes.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

}
