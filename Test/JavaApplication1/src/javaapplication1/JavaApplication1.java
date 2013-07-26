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
import java.net.*;
import java.util.Enumeration;







/**
 *
 * @author hectorsam
 */
public class JavaApplication1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws UnknownHostException, SocketException {
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
// try {
//            String line;
//            Process p = Runtime.getRuntime().exec("free -m");
//            BufferedReader input = new BufferedReader(new InputStreamReader(p.getInputStream()));
//            int i=0;
//            while ((line = input.readLine()) != null) {
//                if (i==2){
//                    String memoria = line.substring(37,40);
//                    System.out.println(memoria);
//                       System.out.println(line);
//                }
//                i++;
//            }
//            input.close();
//        } catch (Exception err) {
//            err.printStackTrace();
//        }
        
        
           LibreriaMensajes lib = new LibreriaMensajes(5000);
           lib.enviarMensaje("ejecutar_AgenteConfiguracion.jar:192.168.1.201","192.168.1.101");
  //         lib.enviarMensaje("id-4609","192.168.1.101");
   //        lib.enviarMensaje("eliminar_AgenteConfiguracion.jar:192.168.1.201","192.168.1.101");
  //          lib.enviarMensaje("eliminarTodos_","192.168.1.101");
    //       lib.getHiloDeEscucha().setControl(false);
//          String ipOrigen = InetAddress.getLocalHost().getHostAddress();
//          System.out.println(Inet4Address.getLocalHost().getHostAddress());
//          System.out.println(InetAddress.getLocalHost().getHostAddress());
//          System.out.println("ip: "+ipOrigen);
          // System.out.println(InetAddress.getLocalHost());
//          Enumeration e=NetworkInterface.getNetworkInterfaces();
//            while(e.hasMoreElements())
//            {
//                NetworkInterface n=(NetworkInterface) e.nextElement();
//                Enumeration ee = n.getInetAddresses();
//                while(ee.hasMoreElements())
//                {
//                    InetAddress i= (InetAddress) ee.nextElement();
//                    if (i.getHostAddress().contains("192.168.1."))
//                    System.out.println(i.getHostAddress());
//                }
//            }
//           while (true){
//               if (lib.ultimoMensajeAgente()!=null){
//               System.out.println(lib.ultimoMensajeAgente().getUsoCpu());
//               System.out.println(lib.ultimoMensajeAgente().getProcesosActivos());
//               System.out.println(lib.ultimoMensajeAgente().getMemoriaDisponible());
//               System.out.println(lib.ultimoMensajeAgente().getDireccionIp());
//               System.out.println(lib.ultimoMensajeAgente().getPuertosDisponibles());
//               }
//            try {
//                Thread.sleep(1000);
//            } catch (InterruptedException ex) {
//                Logger.getLogger(JavaApplication1.class.getName()).log(Level.SEVERE, null, ex);
//            }
//          }
        
//        while (true){
//         String line, id = null;
//        try {
//           
//            Process p = Runtime.getRuntime().exec("ps -ax");
//            BufferedReader input = new BufferedReader(new InputStreamReader(p.getInputStream()));
//            while ((line = input.readLine()) != null) {
//                if (line.contains("java -jar Agente")){
//                   id =line.substring(0,line.indexOf(" "));
//                   break;
//                   
//                }
//                
//            }
//            input.close();
//             } catch (Exception err) {
//            err.printStackTrace();
//           
//        }
//         System.out.println(id);
//        }
//            
            
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
       // String a = "id-123123";
//        String a = "ejecutar_hectorSam.jar:127.0.0.1";
//        if (a.contains("_")==true){
//            String b = a.substring(0,a.indexOf("_"));
//            if (b.contentEquals("eliminarTodos")==true){
//                //metodo eliminarTodos;
//            }
//            else{
//                String c = a.substring(a.indexOf("_")+1, a.indexOf(":"));
//                String ip = a.substring(a.indexOf(":")+1, a.length());
//                System.out.println("c:"+c+" ip:"+ip);
//            }
           
            
//        }
//        else if (a.contains("id-")){
//            System.out.println(a.substring(a.indexOf("-")+1, a.length()));
//        }
//            else{
//            //mensaje entre nodos, modulo de monitoreo;
//            
//        }
    }
    
    
    
}
