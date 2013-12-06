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
 * Clase que permite generar la lógica del tópico Características de los
 * Sistemas Distribuidos - Servidor.
 * @author Héctor Sam
 */
public class LogicaAplicacion {

    private static LogicaAplicacion instancia = null;
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

    public static LogicaAplicacion getInstancia() {
        return instancia;
    }

    public static void setInstancia(LogicaAplicacion instancia) {
        LogicaAplicacion.instancia = instancia;
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

    public String getArchivo() {
        return archivo;
    }

    public void setArchivo(String archivo) {
        this.archivo = archivo;
    }

    public String getIpServidor() {
        return ipServidor;
    }

    public void setIpServidor(String ipServidor) {
        this.ipServidor = ipServidor;
    }

    public boolean isServidorWeb() {
        return servidorWeb;
    }

    public void setServidorWeb(boolean servidorWeb) {
        this.servidorWeb = servidorWeb;
    }
    
    
    
    
    

    private LogicaAplicacion(LibreriaMensajes libreriaMensajes,
            DatosAplicacion datosAplicacion,int puertoAgente, String ipServidor) {
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        this.ipServidor = ipServidor;
        preguntarEstado();
        
    }
    
    /**
     * Singleton
     * @param libreriaMensajes
     * @param datosAplicacion
     * @param puertoAgente
     * @param ipServidor
     * @return 
     */
    public static LogicaAplicacion getInstance(LibreriaMensajes libreriaMensajes,
            DatosAplicacion datosAplicacion,int puertoAgente, String ipServidor){
        if (instancia == null){
            instancia = new LogicaAplicacion(libreriaMensajes,
                datosAplicacion, puertoAgente, ipServidor);
        }
        return instancia;
    }
    
    
    /**
     * Método que permite chequear si el mensaje recibido es de un agente,
     * de un nodo o del ciclo de vida.
     * @param mensaje El mensaje recibido.
     * @return True si pertenece a un agente. False en caso contrario.
     */
    public boolean verificarMensajeRecibido(Mensaje mensaje){
        
        switch (mensaje.getMensaje()){
            case "aplicacion": 
                if (libreriaMensajes.enviarMensaje(datosAplicacion.
                        getNombreAplicacion(),"localhost", puertoAgente))
                    return true;
                break;
            case "nodo":
                if (libreriaMensajes.enviarMensaje(datosAplicacion.
                        getNumeroNodoAplicacion(),"localhost",puertoAgente))
                    return true;
                break;
            default:{
                
                System.out.println("Se ha recibido el mensaje: \""
                        +mensaje.getMensaje()+"\" proveniente del host: "
                        +mensaje.getIpOrigen());
                if (mensaje.getMensaje().contains("iniciar_servidor:")){
                    servidorWeb(1);
                }
                else if (mensaje.getMensaje().contains("detener_servidor:")){
                    servidorWeb(0);
                }
                else if (mensaje.getMensaje().contains("leer:")){
                    libreriaMensajes.enviarMensaje(
                            "Leyendo el contenido del archivo...");
                    leerArchivo();
                }
                else if (mensaje.getMensaje().contains("pagina:")){
                    imprimirPagina();
                }
                else if (mensaje.getMensaje().contains("~server")){
                    enviarEstado();
                }
                else if (mensaje.getMensaje().contains("~true") 
                        || mensaje.getMensaje().contains("~false")){
                    evaluarEstado(mensaje.getMensaje());
                }
                    
                
            }
        };
        return false;
    }
    
    /**
     * Método que permite enviar el número de proceso al servidor central.
     * @param ipServidor La dirección ip del servidor central.
     */
    public void enviarId(String ipServidor){
        libreriaMensajes.enviarMensaje("id<"+datosAplicacion.getIdProceso(),ipServidor);
        libreriaMensajes.enviarMensaje("Ejecutable inicializado");
    }
    
    
    /**
     * Método que permite iniciar o detener el servidor web en el nodo.
     * @param opcion 1 para iniciarlo. 0 para detenerlo.
     * @return True si se logró iniciar. False en caso contrario.
     */
    public boolean servidorWeb(int opcion){
        Process process;
        try {
            if (opcion==1){
                process = Runtime.getRuntime().exec("sudo /etc/init.d/apache2 start");
                System.out.println("Servidor Iniciado");
                libreriaMensajes.enviarMensaje("Servidor Iniciado");
                if (servidorWeb == false)
                    enviarInformacionSiguienteNodo(1); 
                // CAUSA CICLO INFINITO
                servidorWeb = true;
            }
            else{
                process = Runtime.getRuntime().exec("sudo /etc/init.d/apache2 stop");
                System.out.println("Servidor Detenido");
                libreriaMensajes.enviarMensaje("Servidor Detenido");
                if (servidorWeb == true)
                    enviarInformacionSiguienteNodo(2);
                // CAUSA CICLO INFINITO
                servidorWeb = false;
            }
        } catch (IOException ex) {
                Logger.getLogger(LogicaAplicacion.class.getName()).
                        log(Level.SEVERE, null, ex);
                return  false;
            }
        return true;
        
    }
    
    /**
     * Método que permite leer el archivo de texto.
     * @return True si se pudo leer. False en caso contrario.
     */
    public boolean leerArchivo(){
        File file = new File(archivo);
        FileInputStream fis = null;
        int content;
        String mensaje = "";
        try {
                fis = new FileInputStream(file);
                
                
                while ((content = fis.read()) != -1) {
                        System.out.print((char) content);
                        mensaje = mensaje + (char) content;
                }
                libreriaMensajes.enviarMensaje(mensaje);
        } catch (IOException e) {
                e.printStackTrace();
                return  false;
        } finally {
                try {
                        if (fis != null)
                                fis.close();
                } catch (IOException ex) {
                        ex.printStackTrace();
                        return  false;
                }
        }
        return true;
    }
    
    /**
     * Método que permite enviar la información del estado del servidor web al
     * nodo siguiente.
     * @param opcion 1 Si es para iniciar el servidor. 0 para detenerlo.
     * @return 
     */
    public boolean enviarInformacionSiguienteNodo(int opcion){
        
        if (opcion == 1){
            if (libreriaMensajes.enviarMensaje("iniciar_servidor:",
                    ipServidor) == true){
                return true;
            } else {
                return  false;
            
            }
        } else {
            if (libreriaMensajes.enviarMensaje("detener_servidor:",
                    ipServidor)==true){
                return true;
            } 
        }
        return false;
    }

    
    /**
     * Método que permite imprimir el contenido de la página de prueba del
     * servidor web.
     * @return True si se logró imprimir. False en caso contrario.
     */
    public boolean imprimirPagina(){
        if (servidorWeb == true){
            URL pagina;
            BufferedReader in = null;
            String inputLine;
            if (servidorWeb == true){
                try {
                    pagina = new URL("http://localhost/");
                    in = new BufferedReader(new InputStreamReader(pagina.openStream()));
                    while ((inputLine = in.readLine()) != null){  
                        System.out.println(inputLine);
                        libreriaMensajes.enviarMensaje(inputLine);
                    }
                    in.close();
                    return true;
                } catch (IOException ex) {
                    Logger.getLogger(LogicaAplicacion.class.getName()).
                            log(Level.SEVERE, null, ex);
                    return false;
                }
            }   else{
                    return false;
                }
        }
        else {
            libreriaMensajes.enviarMensaje("El servidor no se encuentra iniciado");
            return false;
        }
       
    }
    
    
    /**
     * Método que envía un mensaje de estatus del servidor web al nodo
     * siguiente.
     * @return True si el mensaje fue envíado. False en caso contrario.
     */
    public boolean preguntarEstado(){
        if (libreriaMensajes.enviarMensaje("~server",ipServidor) == true){
            return  true;
        }  else{
            return  false;
        } 
    }
    
    /**
     * Método que envía el estado del servidor web al siguiente nodo.
     * @return True si el mensaje fue envíado. False en caso contrario.
     */
    public boolean enviarEstado(){
        if (servidorWeb == true){
            if (libreriaMensajes.enviarMensaje("~true", ipServidor) == true){
                return  true;
            } else{
                return  false;
            }
        } else{
             if (libreriaMensajes.enviarMensaje("~false", ipServidor) == true){
                 return  true;
             } else{
                 return  false;
             }
        }
    }
    
    /**
     * Método que permite evaluar el estado del servidor web del nodo siguiente.
     * @param mensaje El mensaje a evaluar (True o False).
     */
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
