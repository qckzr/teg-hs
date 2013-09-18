/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package rest_cliente;

import Libreria.LibreriaMensajes;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author sam
 */
public class REST_Cliente {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
//        try {
            // TODO code application logic here
            
       
     //   URL url = new URL("http://localhost:8080/REST_Servidor/resources/fecha");
            //    URL url = new URL("http://192.168.0.191:8080/REST_Servidor/resources/helloworld");
              //      HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                //    conn.setRequestMethod("GET");
                //    conn.setRequestProperty("Accept", "application/html");
     
                  //  if (conn.getResponseCode() != 200) {
                    //        throw new RuntimeException("Failed : HTTP error code : "
                      //                      + conn.getResponseCode());
                   // }
     
                    //BufferedReader br = new BufferedReader(new InputStreamReader(
                      //      (conn.getInputStream())));
     
//                    String output;
//                    System.out.println("Output from Server .... \n");
//                    while ((output = br.readLine()) != null) {
//                            System.out.println(output);
//                    }
//     
//                    conn.disconnect();
//        } catch (IOException ex) {
//            Logger.getLogger(REST_Cliente.class.getName()).log(Level.SEVERE, null, ex);
//        }
        
         LibreriaMensajes libreriaMensajes = new LibreriaMensajes();
        DatosAplicacion datosAplicacion = new DatosAplicacion(args[0],args[1]);//args[0] = nombreApp, args[1] = numeroNodo
        libreriaMensajes.agregarIpDestino(args[2]); //args[2] ip del servidor central
            LogicaAplicacion logicaAplicacion = new LogicaAplicacion(libreriaMensajes, datosAplicacion, Integer.valueOf(args[3]),args[4]);
            EscucharClientes escucharMensajes = new EscucharClientes(logicaAplicacion, libreriaMensajes);
            escucharMensajes.start();
    }
}
