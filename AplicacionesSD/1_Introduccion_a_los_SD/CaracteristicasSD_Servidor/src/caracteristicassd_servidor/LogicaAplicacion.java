/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package caracteristicassd_servidor;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;
import java.io.*;
import java.net.URL;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author sam
 */
public class LogicaAplicacion {

    private LibreriaMensajes libreriaMensajes;
    private int puertoAgente;
    private DatosAplicacion datosAplicacion;
    private String archivo = "/home/pi/Desktop/archivoCaracteristicasSD.txt";
    private static final int PUERTO = 5555;
    private String ipServidor;
    private boolean servidorWeb = false;

    public int getPuerto(){
        return PUERTO;
    }
    
    
    

    public LogicaAplicacion(LibreriaMensajes libreriaMensajes, DatosAplicacion datosAplicacion,int puertoAgente, String ipServidor) {
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        this.ipServidor = ipServidor;
        preguntarEstado();
        
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
                libreriaMensajes.enviarMensaje("Se ha recibido el mensaje: \""+mensaje.getMensaje()+"\" proveniente del host: "+mensaje.getIpOrigen());
                if (mensaje.getMensaje().contains("iniciar_servidor:")){
                    servidorWeb(1);
                }
                else if (mensaje.getMensaje().contains("detener_servidor:")){
                    servidorWeb(0);
                }
                else if (mensaje.getMensaje().contains("leer:")){
                    leerArchivo();
                }
                else if (mensaje.getMensaje().contains("pagina:")){
                    imprimirPagina();
                }
                else if (mensaje.getMensaje().contains("~server")){
                    enviarEstado();
                }
                else if (mensaje.getMensaje().contains("~true") || mensaje.getMensaje().contains("~false")){
                    evaluarEstado(mensaje.getMensaje());
                }
                    
                
            }
        };
        return false;
    }
     
    public void enviarId(String ipServidor){
        libreriaMensajes.enviarMensaje("id<"+datosAplicacion.getIdProceso(),ipServidor);
    }
    
    
    
    public boolean servidorWeb(int opcion){
        try {
            if (opcion==1){
                Process p = Runtime.getRuntime().exec("sudo /etc/init.d/apache2 start");
                System.out.println("Servidor Iniciado");
                libreriaMensajes.enviarMensaje("Servidor Iniciado");
                if (servidorWeb == false)
                    enviarInformacionSiguienteNodo(1); 
                // CAUSA CICLO INFINITO
                servidorWeb = true;
            }
            else{
                Process p = Runtime.getRuntime().exec("sudo /etc/init.d/apache2 stop");
                System.out.println("Servidor Detenido");
                libreriaMensajes.enviarMensaje("Servidor Detenido");
                if (servidorWeb == true)
                    enviarInformacionSiguienteNodo(2);
                // CAUSA CICLO INFINITO
                servidorWeb = false;
            }
        } catch (IOException ex) {
                Logger.getLogger(LogicaAplicacion.class.getName()).log(Level.SEVERE, null, ex);
            }
        return true;
        
    }
    
    public boolean leerArchivo(){
         File file = new File(archivo);
        FileInputStream fis = null;
 
        try {
                fis = new FileInputStream(file);
                int content;
                String mensaje = "";
                while ((content = fis.read()) != -1) {
                        // convert to char and display it
                        System.out.print((char) content);
                        mensaje = mensaje + (char) content;
                }
                libreriaMensajes.enviarMensaje(mensaje);
        } catch (IOException e) {
                e.printStackTrace();
        } finally {
                try {
                        if (fis != null)
                                fis.close();
                } catch (IOException ex) {
                        ex.printStackTrace();
                }
        }
        return true;
    }
    
    public boolean enviarInformacionSiguienteNodo(int opcion){
        if (opcion==1){
            if (libreriaMensajes.enviarMensaje("iniciar_servidor:",ipServidor)==true)
                return true;
        }
        else{
            if (libreriaMensajes.enviarMensaje("detener_servidor:",ipServidor)==true)
                return true;
        }
        return false;
    }
    
    
    
    public boolean ejecutarSiguienteServidor(){
        String nombreEjecutable = null;
        libreriaMensajes.enviarMensaje("ejecutar_"+nombreEjecutable+":"+ipServidor,libreriaMensajes.getIpDestino().get(0));
        
        return true;
    }
    
    
    
    public boolean imprimirPagina(){
        if (servidorWeb == true){
            BufferedReader in = null;
            try {
                URL pagina = new URL("http://localhost/");
                in = new BufferedReader(new InputStreamReader(pagina.openStream()));
                String inputLine;
                while ((inputLine = in.readLine()) != null){  
         //               System.out.println(inputLine.substring(inputLine.indexOf("1>")+2,inputLine.indexOf("</")-1));
                    System.out.println(inputLine);
                    libreriaMensajes.enviarMensaje(inputLine);
                }
                in.close();
                return true;
            } catch (IOException ex) {
                Logger.getLogger(LogicaAplicacion.class.getName()).log(Level.SEVERE, null, ex);
                return false;
            }
            }
        else
            return false;
       
    }
    
    
    public void preguntarEstado(){
        libreriaMensajes.enviarMensaje("~server",ipServidor);   
    }
    
    public void enviarEstado(){
        if (servidorWeb == true)
            libreriaMensajes.enviarMensaje("~true", ipServidor);
        else
            libreriaMensajes.enviarMensaje("~false", ipServidor);
    }
    
    public void evaluarEstado(String mensaje){
        if (mensaje.contains("~true")){
            servidorWeb = true;
            servidorWeb(1);
        }
        else{
            servidorWeb = false;
            servidorWeb(2);
        }
    }
    
   
   
    
  
    
    
   
}
