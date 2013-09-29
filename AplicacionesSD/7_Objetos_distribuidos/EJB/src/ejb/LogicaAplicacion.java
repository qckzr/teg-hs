/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
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
public class LogicaAplicacion {

    private LibreriaMensajes libreriaMensajes;
    private int puertoAgente;
    private DatosAplicacion datosAplicacion;
    private URL url;
    private String ipServidor;
    

    public LogicaAplicacion(LibreriaMensajes libreriaMensajes, DatosAplicacion datosAplicacion,int puertoAgente, String ipServidor) {
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        this.ipServidor = ipServidor;
        
    }
    
    public boolean verificarMensajeRecibido(Mensaje mensaje){
        
        switch (mensaje.getMensaje()){
            case "aplicacion": 
                if (libreriaMensajes.enviarMensaje(datosAplicacion.getNombreAplicacion(),"localhost", puertoAgente))
                    return true;
                break;
            case "nodo":
                if (libreriaMensajes.enviarMensaje(datosAplicacion.getNumeroNodoAplicacion(),"localhost",puertoAgente))
                    return true;
                break;
            default:{
                
                System.out.println("Se ha recibido el mensaje: \""+mensaje.getMensaje()+"\" proveniente del host: "+mensaje.getIpOrigen());
                enviarInformacion(mensaje);
                
            }
        };
        return false;
    }
     
    public void enviarId(String ipServidor){
        libreriaMensajes.enviarMensaje("id<"+datosAplicacion.getIdProceso(),ipServidor);
    }
    
    
    public void enviarInformacion(Mensaje mensaje){
        try {
            CloseableHttpClient httpclient = HttpClients.createDefault();
             HttpPost httpPost = new HttpPost("http://"+ipServidor+":8080/taller2Distribuidos2012/TallerServlet");
             List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(1);
             String [] valores = mensaje.getMensaje().split("-");
             if (valores[0].contains(" ")) valores[0] = "";
             if (valores[1].contains(" ")) valores[1] = "";
             if (valores[2].contains(" ")) valores[2] = "";
           nameValuePairs.add(new BasicNameValuePair("nombre",valores[0]));
           nameValuePairs.add(new BasicNameValuePair("apellido",valores[1]));
           nameValuePairs.add(new BasicNameValuePair("cedula",valores[2]));
           httpPost.setEntity(new UrlEncodedFormEntity(nameValuePairs));
            HttpResponse response = httpclient.execute(httpPost);
             recibirInformacion(response);  
        } catch (IOException ex) {
            Logger.getLogger(LogicaAplicacion.class.getName()).log(Level.SEVERE, null, ex);
        } 
             
    }
    
    public void recibirInformacion(HttpResponse httpResponse){
        
        try {
            BufferedReader rd = new BufferedReader(new InputStreamReader(httpResponse.getEntity().getContent()));
                   String line = "";
                   while ((line = rd.readLine()) != null) {
                       if (line.contains("<h2>"))
                             System.out.println(line.substring(line.indexOf("<h2>")));
                   }
        } catch (IOException ex) {
            Logger.getLogger(LogicaAplicacion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
  
   

    
    
   
}
