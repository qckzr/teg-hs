/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package javaapplication1;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;







/**
 *
 * @author hectorsam
 */
public class JavaApplication1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
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

        //cantidad de procesos.
//           try {
//        String line;
//        Process p = Runtime.getRuntime().exec("ps -e");
//        int i=0;
//        BufferedReader input =
//                new BufferedReader(new InputStreamReader(p.getInputStream()));
//        while ((line = input.readLine()) != null) {
//            System.out.println(line); //<-- Parse data here.
//            i++;
//        }
//        input.close();
//               System.out.println("i: "+(i-1));
//    } catch (Exception err) {
//        err.printStackTrace();
//    } 
        
        
        while (true){
         try {
        String line,puertos="";
        Process p = Runtime.getRuntime().exec("nmap localhost");

        BufferedReader input =
                new BufferedReader(new InputStreamReader(p.getInputStream()));
        int i=0;
        while ((line = input.readLine()) != null){
            if (line.substring(0).contains("N")==true && i>6)
                break;
            if (i>6 && line.substring(0).contains(" ")!=false)
                puertos = puertos+line.substring(0,line.indexOf(" "))+"\n";
            i++;
        }
             System.out.println(puertos);
             input.close();
    } catch (Exception err) {
        err.printStackTrace();
    } 

    }
    }

    public JavaApplication1() {
    }
    
    
    
}
