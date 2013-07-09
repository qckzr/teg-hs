/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package javaapplication1;

import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.logging.Level;
import java.util.logging.Logger;
import Libreria.LibreriaMensajes;







/**
 *
 * @author hectorsam
 */
public class JavaApplication1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
//        try {
            // TODO code application logic here

    //         LibreriaMensajes b = new LibreriaMensajes(true);
    //         b.agregarIpDestino("localhost");
    //         b.enviarMensaje("mensaje 1");
    //         b.enviarMensaje("mensaje 2"); Thread.sleep(1000);
    //         b.enviarMensaje("mensaje 3"); Thread.sleep(1000);
    //         b.enviarMensaje("mensaje 4"); Thread.sleep(1000);
    //         b.enviarMensaje("mensaje 5"); Thread.sleep(1000);
    //         b.enviarMensaje("mensaje 6"); Thread.sleep(1000);
    //         Iterator i = b.getMensajesRecibidos().iterator();
    //         while (i.hasNext())
    //             System.out.println(i.next().toString());

           LibreriaMensajes lib = new LibreriaMensajes(true);
           while (true){
               lib.getMensajesRecibidos();
            try {
                Thread.sleep(1000);
            } catch (InterruptedException ex) {
                Logger.getLogger(JavaApplication1.class.getName()).log(Level.SEVERE, null, ex);
            }
           }
            
            
//            ServerSocket s = new ServerSocket(2000);
//            while (true){
//                Socket a = s.accept();
//                ObjectInputStream ois = new ObjectInputStream(a.getInputStream());
//                System.out.println(ois.readObject().toString());
//            }
//        } catch (IOException ex) {
//            Logger.getLogger(JavaApplication1.class.getName()).log(Level.SEVERE, null, ex);
//        } catch (ClassNotFoundException ex) {
//            Logger.getLogger(JavaApplication1.class.getName()).log(Level.SEVERE, null, ex);
//        }
    }
    
    
    
}
