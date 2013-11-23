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
 * Clase que implementa la lógica de la aplicación para el tópico EJB.
 * @author Héctor Sam.
 */
public class LogicaAplicacion {

    private static LogicaAplicacion instancia = null;
    private LibreriaMensajes libreriaMensajes;
    private int puertoAgente;
    private DatosAplicacion datosAplicacion;
    private URL url;
    private String ipServidor;
    

    private LogicaAplicacion(LibreriaMensajes libreriaMensajes,
            DatosAplicacion datosAplicacion,int puertoAgente, String ipServidor) {
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        this.ipServidor = ipServidor;
        
    }
    
    /**
     * Singleton.
     * @param libreriaMensajes
     * @param datosAplicacion
     * @param puertoAgente
     * @param ipServidor
     * @return 
     */
    public static LogicaAplicacion getInstancia (LibreriaMensajes libreriaMensajes,
            DatosAplicacion datosAplicacion,int puertoAgente, String ipServidor){
        if (instancia == null){
            instancia = new LogicaAplicacion(libreriaMensajes,
                    datosAplicacion, puertoAgente, ipServidor);
        }
        return  instancia;
    }

    public LibreriaMensajes getLibreriaMensajes() {
        return libreriaMensajes;
    }

    public void setLibreriaMensajes(LibreriaMensajes libreriaMensajes) {
        this.libreriaMensajes = libreriaMensajes;
    }

    public int getPuertoAgente() {
        return puertoAgente;
    }

    public void setPuertoAgente(int puertoAgente) {
        this.puertoAgente = puertoAgente;
    }

    public DatosAplicacion getDatosAplicacion() {
        return datosAplicacion;
    }

    public void setDatosAplicacion(DatosAplicacion datosAplicacion) {
        this.datosAplicacion = datosAplicacion;
    }

    public URL getUrl() {
        return url;
    }

    public void setUrl(URL url) {
        this.url = url;
    }

    public String getIpServidor() {
        return ipServidor;
    }

    public void setIpServidor(String ipServidor) {
        this.ipServidor = ipServidor;
    }
    
    
    
    /**
     * Método que permite chequear el mensaje recibido para decidir si pertenece
     * al agente de configuración, al módulo de ciclo de vida o a un nodo.
     * @param mensaje El mensaje recibido.
     * @return True si pertence al agente. False en caso contrario.
     */
    public boolean verificarMensajeRecibido(Mensaje mensaje){
        
        switch (mensaje.getMensaje()){
            case "aplicacion": 
                if (libreriaMensajes.enviarMensaje(datosAplicacion.
                        getNombreAplicacion(),"localhost", puertoAgente)) {
                    return true;
                }
                break;
            case "nodo":
                if (libreriaMensajes.enviarMensaje(datosAplicacion.
                        getNumeroNodoAplicacion(),"localhost",puertoAgente)) {
                    return true;
                }
                break;
            default:{
                
                System.out.println("Se ha recibido el mensaje: \""
                        +mensaje.getMensaje()+"\" proveniente del host: "
                        +mensaje.getIpOrigen());
                enviarInformacion(mensaje);
                
            }
        };
        return false;
    }
     
    /**
     * Método que permite enviar el número de proceso al servidor central.
     * @param ipServidor 
     */
    public void enviarId(String ipServidor){
        libreriaMensajes.enviarMensaje("id<"
                +datosAplicacion.getIdProceso(),ipServidor);
        libreriaMensajes.enviarMensaje("Ejecutable inicializado");
    }
    
    
    /**
     * Metodo que permite enviar la inforamción al servlet de manera que se pueda
     * consultar los beans con sesión y sin sesión.
     * @param mensaje El mensaje con los campos envíados por el usuario.
     * @return True si la información pudo ser enviada. False en caso contrario.
     */
    public boolean enviarInformacion(Mensaje mensaje){
        CloseableHttpClient httpclient;
        HttpPost httpPost;
        List<NameValuePair> nameValuePairs;
        String [] valores;
        HttpResponse response;
        try {
             httpclient = HttpClients.createDefault();
             httpPost = new HttpPost("http://"+ipServidor+":8080"
                     + "/taller2Distribuidos2012/TallerServlet");
             nameValuePairs = new ArrayList<NameValuePair>(1);
             valores = mensaje.getMensaje().split("-");
             if (valores[0].contains(" ")){ 
                 valores[0] = "";
             }
             if (valores[1].contains(" ")){
                 valores[1] = "";
             }
             if (valores[2].contains(" ")){
                 valores[2] = "";
             }
           nameValuePairs.add(new BasicNameValuePair("nombre",valores[0]));
           nameValuePairs.add(new BasicNameValuePair("apellido",valores[1]));
           nameValuePairs.add(new BasicNameValuePair("cedula",valores[2]));
           httpPost.setEntity(new UrlEncodedFormEntity(nameValuePairs));
           response = httpclient.execute(httpPost);
           recibirInformacion(response);  
           return true;
        } catch (IOException ex) {
            Logger.getLogger(LogicaAplicacion.class.getName()).
                    log(Level.SEVERE, null, ex);
            return  false;
        } 
             
    }
    
    /**
     * Método que permite recibir la información de la petición HTTP realizada.
     * @param httpResponse La petición HTTP.
     * @return True si se logró enviar el contenido de la petición. False si
     * hubo un error.
     */
    public boolean recibirInformacion(HttpResponse httpResponse){
        BufferedReader rd;
        String line = "";
        try {
            rd = new BufferedReader(new InputStreamReader(
                    httpResponse.getEntity().getContent()));
                   line = "";
                   while ((line = rd.readLine()) != null) {
                       if (line.contains("<h2>")){
                             System.out.println(line.substring(
                                     line.indexOf("<h2>")+1,
                                     line.indexOf("</h2>")-1));
                             libreriaMensajes.enviarMensaje(
                                     line.substring(line.indexOf("<h2>")+4,
                                             line.indexOf("</h2>")));
                       }
                   }
                   return true;
        } catch (IOException ex) {
            Logger.getLogger(LogicaAplicacion.class.getName()).
                    log(Level.SEVERE, null, ex);
                return  false;
        } catch (NullPointerException ex){
            Logger.getLogger(LogicaAplicacion.class.getName()).
                    log(Level.SEVERE, null, ex);
                return  false;
        }
    }
    
    
  
   

    
    
   
}
