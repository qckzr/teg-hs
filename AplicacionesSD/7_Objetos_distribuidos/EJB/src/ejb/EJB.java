/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import Libreria.LibreriaMensajes;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;

/**
 *
 * @author sam
 */
public class EJB {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {

//try {
//    
//               
//                 CloseableHttpClient httpclient = HttpClients.createDefault();
//            HttpPost httpPost = new HttpPost("http://192.168.0.191:8080/taller2Distribuidos2012/TallerServlet");
//            List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(1);
//          nameValuePairs.add(new BasicNameValuePair("nombre",""));
//          nameValuePairs.add(new BasicNameValuePair("apellido",""));
//          nameValuePairs.add(new BasicNameValuePair("cedula",""));
//          httpPost.setEntity(new UrlEncodedFormEntity(nameValuePairs));
//           HttpResponse response = httpclient.execute(httpPost);
//              BufferedReader rd = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
//              String line = "";
//              while ((line = rd.readLine()) != null) {
//                  if (line.contains("<h2>"))
//                        System.out.println(line.substring(line.indexOf("<h2>")));
//              }
//            } catch (IOException ex) {
//                Logger.getLogger(EJB.class.getName()).log(Level.SEVERE, null, ex);
//            } 
//
//        
////       
//   
        LibreriaMensajes libreriaMensajes = new LibreriaMensajes();
        DatosAplicacion datosAplicacion = new DatosAplicacion(args[0],args[1]);//args[0] = nombreApp, args[1] = numeroNodo
        libreriaMensajes.agregarIpDestino(args[2]); //args[2] ip del servidor central
            LogicaAplicacion logicaAplicacion = new LogicaAplicacion(libreriaMensajes, datosAplicacion, Integer.valueOf(args[3]),args[4]);
            EscucharClientes escucharMensajes = new EscucharClientes(logicaAplicacion, libreriaMensajes);
            escucharMensajes.start();
    }
}
