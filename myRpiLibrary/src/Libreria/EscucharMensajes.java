
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.logging.Level;
import java.util.logging.Logger;
import sun.net.www.http.Hurryable;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Hector
 */
public class HiloDeEscucha extends Thread {

    private Boolean control = Boolean.TRUE;
    private ServerSocket serverSocket;

    public HiloDeEscucha(int puerto){
        try {
            serverSocket = new ServerSocket(puerto);
        } catch (IOException ex) {
            Logger.getLogger(HiloDeEscucha.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


    @Override
    public void run(){

        while (control){
            try {
                Socket s = serverSocket.accept();
                ObjectInputStream o = new ObjectInputStream(s.getInputStream()) ;
                Mensaje mensaje = (Mensaje) o.readObject();
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(HiloDeEscucha.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
                Logger.getLogger(HiloDeEscucha.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

}
