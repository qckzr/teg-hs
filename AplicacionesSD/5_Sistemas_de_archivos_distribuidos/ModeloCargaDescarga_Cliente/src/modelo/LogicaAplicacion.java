/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;
import java.io.*;
import java.net.Socket;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Clase que implementa la lógica de la aplicación para el tópico Módelo de 
 * Carga Descarga - Cliente.
 * @author Héctor Sam.
 */
public class LogicaAplicacion {

    private static LogicaAplicacion instancia = null;
    private LibreriaMensajes libreriaMensajes;
    private int puertoAgente;
    private DatosAplicacion datosAplicacion;
    private static final String archivo = "/home/pi/Desktop/ModeloCargaDescarga.txt";
    private static final int PUERTO = 5555;
    private String ipServidor;
    private ObjectOutputStream objectOutputStream;
    private boolean archivoRecibido = false;
    private EsperaArchivo esperaArchivo;
    

    private LogicaAplicacion(LibreriaMensajes libreriaMensajes,
            DatosAplicacion datosAplicacion,int puertoAgente,String ipServidor) {
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        this.ipServidor = ipServidor;
        esperaArchivo = new EsperaArchivo(this);
        esperaArchivo.start();
        eliminarArchivo();
        
    }
    
    public static LogicaAplicacion getInstancia (LibreriaMensajes libreriaMensajes,
            DatosAplicacion datosAplicacion,int puertoAgente,String ipServidor) {
        if (instancia == null) {
            instancia = new LogicaAplicacion(libreriaMensajes,
                    datosAplicacion, puertoAgente, ipServidor);
        }
        return instancia;
    }
    
    public String getArchivo(){
        return archivo;
    }
    
    public int getPuerto(){
        return PUERTO;
    }

    public boolean isArchivoRecibido() {
        return archivoRecibido;
    }

    public void setArchivoRecibido(boolean archivoRecibido) {
        this.archivoRecibido = archivoRecibido;
    }
    
    /**
     * Método que permite chequear el mensaje recibido para decidir si pertenece
     * al agente de configuración, al módulo de ciclo de vida o a un nodo.
     * @param mensaje El mensaje recibido.
     * @return True si pertence al agente. False en caso contrario.
     */
    public boolean verificarMensajeRecibido(Mensaje mensaje) throws InterruptedException{
        
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
                recibirMensaje(mensaje);
                
            }
        };
        return false;
    }
     
    /**
     * Método que permite enviar el número de proceso al servidor central.
     * @param ipServidor 
     */
    public void enviarId(String ipServidor){
        libreriaMensajes.enviarMensaje("id<"+datosAplicacion.getIdProceso(),ipServidor);
    }
    
    /**
     * Método que permite recibir el mensaje envíado por el usuario para ejecutar
     * la instrucción solicitada.
     * @param mensaje El mensaje con la instrucción a realizar.
     * @return True si la instrucción fue correcta. False en caso contrario o
     * si hubo error.
     */
    public boolean recibirMensaje(Mensaje mensaje) {
        try {
        if (mensaje.getMensaje().contains("archivo:")){
            
                libreriaMensajes.enviarMensaje("Solicitando archivo...");
                solicitarArchivo(archivo, ipServidor, PUERTO);
                Thread.sleep(5000);
                existeArchivo();
                return  true;
           
                } else if (mensaje.getMensaje().contains("escribir:") 
                        && archivoRecibido == true){
                    libreriaMensajes.enviarMensaje("Escribiendo \""
                            +mensaje.getMensaje().substring(mensaje.getMensaje().
                            indexOf(":")+1,mensaje.getMensaje().length())+"\"");
                    escribirArchivo(mensaje);
                    return  true;
                } else if (mensaje.getMensaje().contains("enviar:") 
                        && archivoRecibido == true){
                    libreriaMensajes.enviarMensaje("Enviando archivo...");
                    libreriaMensajes.enviarMensaje("enviar:", ipServidor);
                    Thread.sleep(5000);
                    eliminarArchivo();
                    return  true;
                } else if (mensaje.getMensaje().contains("ver:") 
                        && archivoRecibido == true){
                    leerArchivo();
                    return  true;
                    
                }
                else {
                    return  false;
                }
         } catch (InterruptedException ex) {
                Logger.getLogger(LogicaAplicacion.class.getName()).
                        log(Level.SEVERE, null, ex);
                return  false;
            }
        
    }
    
    /**
     * Método que permite escribir en el archivo recibido.
     * @param mensaje El mensaje a escribir en el archivo.
     * @return True si se pudo escribir en el archivo. False en caso contrario.
     */
    public boolean escribirArchivo(Mensaje mensaje){
        String datos = mensaje.getMensaje().substring(mensaje.
                getMensaje().indexOf(":")+1);
        FileWriter fileWritter = null;
        File file = new File(archivo);
         try {
                if(!file.exists()){
    			file.createNewFile();
    		}
                fileWritter = new FileWriter(file.getName(),true);
                BufferedWriter bufferWritter = new BufferedWriter(fileWritter);
                bufferWritter.write(datos+"\n");
                bufferWritter.close();
        } catch (IOException ex) {
            Logger.getLogger(LogicaAplicacion.class.getName()).
                    log(Level.SEVERE, null, ex);
            return  false;
        } finally {
            try {
                fileWritter.close();
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
         libreriaMensajes.enviarMensaje("Se ha escrito en "
                 + "el archivo el mensaje: "+datos);
         return true;
    }
    
    
    /**
     * Método que permite leer el archivo recibido.
     * @return True si el archivo se pudo leer. False en caso contrario.
     */
    public boolean leerArchivo(){
        libreriaMensajes.enviarMensaje("Leyendo el contenido del archivo...");
        BufferedReader br = null;
        String sCurrentLine;
        try {
            
            br = new BufferedReader(new FileReader(archivo));
            while ((sCurrentLine = br.readLine()) != null) {
                System.out.println(sCurrentLine);
                libreriaMensajes.enviarMensaje(sCurrentLine);
            }
            return  true;
        } catch (IOException ex) {
            Logger.getLogger(LogicaAplicacion.class.getName()).
                    log(Level.SEVERE, null, ex);
            return  false;
        }

    }

    
    /**
     * Método que permite soliciar un archivo al servidor.
     * @param fichero El archivo a solicitar.
     * @param servidor La dirección ip del servidor.
     * @param puerto El puerto de conexión.
     * @return True si se recibió el archivo. False en caso contrario.
     */
    public boolean solicitarArchivo(String fichero, String servidor, int puerto) {
        Socket socket;
        ObjectOutputStream oos;
        BufferedReader br;
        MensajeDameFichero mensaje;
        FileOutputStream fos;
        ObjectInputStream ois;
        MensajeTomaFichero mensajeRecibido;
        Object mensajeAux;
        try
        {

            socket = new Socket(servidor, puerto);
            oos = new ObjectOutputStream(socket
                    .getOutputStream());
            mensaje = new MensajeDameFichero();
            mensaje.nombreFichero = fichero;
            oos.writeObject(mensaje);
            fos = new FileOutputStream(mensaje.nombreFichero);
            ois = new ObjectInputStream(socket
                    .getInputStream());
            
            do {
               
                mensajeAux = ois.readObject();
                if (mensajeAux instanceof MensajeTomaFichero) {
                    mensajeRecibido = (MensajeTomaFichero) mensajeAux;

                    fos.write(mensajeRecibido.contenidoFichero, 0,
                            mensajeRecibido.bytesValidos);
                } else {

                    System.err.println("Mensaje no esperado "
                            + mensajeAux.getClass().getName());
                    break;
                }
            } while (!mensajeRecibido.ultimoMensaje);
            br = new BufferedReader(new FileReader(archivo));     
            if (br.readLine() == null) {
                System.out.println("Sin errores.");
                eliminarArchivo();
            }
            fos.close();
            ois.close();
            socket.close();
            return true;
          
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
     
     
    /**
     * Método que elimina el archivo del cliente.
     * @return True si el archivo fue eliminado. False en caso contrario.
     */
    public boolean eliminarArchivo(){
        File file = new File(archivo);
        if (file.delete())
            return true;
        else
            return false;
    }
    
    /**
     * Método que permite validar si el archivo existe.
     * @return True si el archivo existe. False en caso contrario.
     */
    public boolean existeArchivo(){
        File f = new File(archivo);
 
	  if(f.exists()){
                    archivoRecibido = true;
                    libreriaMensajes.enviarMensaje("Archivo recibido");
		  return true;
	  }else{
		  return false;
	  }
    }
    
    
    
    
    
   
    
    
   
    
   

    
    
   
}
