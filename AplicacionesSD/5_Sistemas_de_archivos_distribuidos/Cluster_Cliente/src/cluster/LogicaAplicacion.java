/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cluster;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;
import java.io.*;
import java.net.Socket;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 * Clase que implementa la lógica de la aplicación para el tópico Sistemas de 
 * archivos basados en cluster - Cliente.
 * @author Héctor Sam.
 */
public class LogicaAplicacion {

    private static LogicaAplicacion instancia = null;
    private LibreriaMensajes libreriaMensajes;
    private int puertoAgente;
    private DatosAplicacion datosAplicacion;
    private ArrayList<String> nodos;
    private static final int PUERTO_ARCHIVO = 3500;
    private String nombreArchivoCompleto = "/home/pi/Desktop/archivo.txt";
    private String nombreArchivo1 = "/home/pi/Desktop/1_archivo.txt";
    private String nombreArchivo2 = "/home/pi/Desktop/2_archivo.txt";
    private String nombreArchivo3 = "/home/pi/Desktop/3_archivo.txt";
    private int archivoRecibido;
    private Tiempo tiempo;

    
    
    private LogicaAplicacion(LibreriaMensajes libreriaMensajes,
            DatosAplicacion datosAplicacion,int puertoAgente) {
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        nodos = new ArrayList<>();
        
    }
    
    /**
     * Singleton
     * @param libreriaMensajes
     * @param datosAplicacion
     * @param puertoAgente
     * @return 
     */
    public static LogicaAplicacion getInstancia (LibreriaMensajes libreriaMensajes,
            DatosAplicacion datosAplicacion,int puertoAgente) {
        if (instancia == null) {
            instancia = new LogicaAplicacion(libreriaMensajes,
                    datosAplicacion, puertoAgente);
        }
        return  instancia;
        
    }
    
    
    
    public int getArchivoRecibido() {
        return archivoRecibido;
    }

    public LibreriaMensajes getLibreriaMensajes() {
        return libreriaMensajes;
    }

    public void setLibreriaMensajes(LibreriaMensajes libreriaMensajes) {
        this.libreriaMensajes = libreriaMensajes;
    }
    
    

    public void setArchivoRecibido(int archivoRecibido) {
        this.archivoRecibido = archivoRecibido;
    }

    public Tiempo getTiempo() {
        return tiempo;
    }

    public void setTiempo(Tiempo tiempo) {
        this.tiempo = tiempo;
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

    public ArrayList<String> getNodos() {
        return nodos;
    }

    public void setNodos(ArrayList<String> nodos) {
        this.nodos = nodos;
    }

    public String getNombreArchivoCompleto() {
        return nombreArchivoCompleto;
    }

    public void setNombreArchivoCompleto(String nombreArchivoCompleto) {
        this.nombreArchivoCompleto = nombreArchivoCompleto;
    }

    public String getNombreArchivo1() {
        return nombreArchivo1;
    }

    public void setNombreArchivo1(String nombreArchivo1) {
        this.nombreArchivo1 = nombreArchivo1;
    }

    public String getNombreArchivo2() {
        return nombreArchivo2;
    }

    public void setNombreArchivo2(String nombreArchivo2) {
        this.nombreArchivo2 = nombreArchivo2;
    }

    public String getNombreArchivo3() {
        return nombreArchivo3;
    }

    public void setNombreArchivo3(String nombreArchivo3) {
        this.nombreArchivo3 = nombreArchivo3;
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
                if (mensaje.getMensaje().contains("archivo_partes")){
                    libreriaMensajes.enviarMensaje("Archivo por partes...");
                    esperarArchivos();
                } else if (mensaje.getMensaje().contains("archivo_completo")){
                    libreriaMensajes.enviarMensaje("Archivo completo...");
                    solicitarArchivo(nombreArchivoCompleto,nodos.get(0),
                            PUERTO_ARCHIVO);
                    
                }
                
            }
        };
        return false;
    }
    
    /**
     * Método que permite agregar un nodo servidor a la lista de nodos 
     * @param ip La dirección ip del nodo.
     * @return True.
     */
    public boolean agregarNodo(String ip){
        nodos.add(ip);
        return true;
    }
     
    /**
     * Método que permite enviar el número de proceso al servidor central.
     * @param ipServidor 
     */
    public void enviarId(String ipServidor){
        libreriaMensajes.enviarMensaje("id<"+datosAplicacion.getIdProceso(),ipServidor);
        libreriaMensajes.enviarMensaje("Ejecutable inicializado");
    }
    
    
    
//    public void dividirArchivo(String rutaArchivo){
//        try {
//            SplitFiles splitFiles = new SplitFiles(rutaArchivo);
//            splitFiles.split(CANTIDAD_ARCHIVOS);
//            nombreArchivo = rutaArchivo.substring(rutaArchivo.indexOf("archivoCluster.txt"));
//            System.out.println("El archivo fue dividido");
//        } catch (FileNotFoundException ex) {
//            Logger.getLogger(LogicaAplicacion.class.getName()).log(Level.SEVERE, null, ex);
//        } catch (IOException ex) {
//            Logger.getLogger(LogicaAplicacion.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        
//    }
    
    
    /**
     * Método que permite solicitar un archivo específico al nodo servidor.
     * @param fichero El archivo a solicitar.
     * @param servidor La dirección ip del servidor.
     * @param puerto El puerto de conexión.
     * @return True si se pudo recibir el archivo. False en caso contrario.
     */
    public boolean solicitarArchivo(String fichero, String servidor, int puerto) {
        Tiempo tiempo;
        Socket socket;
        ObjectOutputStream oos;
        MensajeDameFichero mensaje;
        FileOutputStream fos;
        ObjectInputStream ois;
        MensajeTomaFichero mensajeRecibido;
        Object mensajeAux;
        try {
            
            tiempo = new Tiempo();
            tiempo.start();
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
            
            fos.close();
            ois.close();
            socket.close();
            System.out.println("\n Segundos que tardó el archivo: "
                    +tiempo.getSegundos());
            libreriaMensajes.enviarMensaje("\n Segundos que tardó el archivo: "
                    +tiempo.getSegundos());
            tiempo.kill();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    /**
     * Método que permite esperar por los archivos enviados por cada nodo
     * servidor.
     * @return True si se pudo crear el archivo y recibir la información. False
     * en caso contrario.
     */
    public boolean esperarArchivos(){
        try {
            archivoRecibido = 0;
            File file = new File("archivoRecibido.txt");
            file.createNewFile();
            EscuchaArchivo escuchaArchivo1 = 
                    new EscuchaArchivo(this, nombreArchivo1,
                    nodos.get(0), PUERTO_ARCHIVO);
            EscuchaArchivo escuchaArchivo2 = 
                    new EscuchaArchivo(this, nombreArchivo2,
                    nodos.get(1), PUERTO_ARCHIVO);
            EscuchaArchivo escuchaArchivo3 = 
                    new EscuchaArchivo(this, nombreArchivo3,
                    nodos.get(2), PUERTO_ARCHIVO);
            tiempo = new Tiempo();
            tiempo.start();
            escuchaArchivo1.start();
            escuchaArchivo2.start();
            escuchaArchivo3.start();
            return  true;
        } catch (IOException ex) {
            Logger.getLogger(LogicaAplicacion.class.getName()).
                    log(Level.SEVERE, null, ex);
            return  false;
        }
        
    }
    
    
        
   
}
