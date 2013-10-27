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


/**
 * Clase que implementa la lógica de la aplicación para el tópico Sistemas de
 * Archivos basados en Cluster - Servidor.
 * @author Héctor Sam.
 */
public class LogicaAplicacion {

    private static LogicaAplicacion instancia = null;
    private LibreriaMensajes libreriaMensajes;
    private int puertoAgente;
    private DatosAplicacion datosAplicacion;
    private ArrayList<String> nodos;
    private String rutaArchivo;
    private final static int PUERTO_ESCUCHA = 3500;
    private EscuchaArchivo escuchaArchivo;

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

    public ArrayList<String> getNodos() {
        return nodos;
    }

    public void setNodos(ArrayList<String> nodos) {
        this.nodos = nodos;
    }

    public String getRutaArchivo() {
        return rutaArchivo;
    }

    public void setRutaArchivo(String rutaArchivo) {
        this.rutaArchivo = rutaArchivo;
    }

    public EscuchaArchivo getEscuchaArchivo() {
        return escuchaArchivo;
    }

    public void setEscuchaArchivo(EscuchaArchivo escuchaArchivo) {
        this.escuchaArchivo = escuchaArchivo;
    }
    

    
    
    private LogicaAplicacion(LibreriaMensajes libreriaMensajes,
            DatosAplicacion datosAplicacion,int puertoAgente) {
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        nodos = new ArrayList<>();
        escuchaArchivo = new EscuchaArchivo(PUERTO_ESCUCHA, this);
        escuchaArchivo.start();
        
    }
    
    /**
     * Singleton.
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
                libreriaMensajes.enviarMensaje("Se ha recibido el mensaje: \""
                        +mensaje.getMensaje()+"\" proveniente del host: "
                        +mensaje.getIpOrigen());

                
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
    }
 
   
    /**
     * Método que permite solicitar un archivo específico a otro nodo..
     * @param fichero El archivo a solicitar.
     * @param ip La dirección ip del nodo.
     * @param puerto Puerto de conexión.
     */
    public boolean solicitarArchivo(String fichero, String ip, int puerto){
        FileOutputStream fos;
        ObjectInputStream ois;
        ObjectOutputStream oos;
        Socket socket;
        try
        {

            socket = new Socket(ip, puerto);
            oos = new ObjectOutputStream(socket
                    .getOutputStream());
            MensajeDameFichero mensaje = new MensajeDameFichero();
            mensaje.nombreFichero = fichero;
            oos.writeObject(mensaje);


            fos = new FileOutputStream(mensaje.nombreFichero);
            ois = new ObjectInputStream(socket
                    .getInputStream());
            MensajeTomaFichero mensajeRecibido;
            Object mensajeAux;
            do {
                mensajeAux = ois.readObject();
                
                if (mensajeAux instanceof MensajeTomaFichero) {
                    mensajeRecibido = (MensajeTomaFichero) mensajeAux;
                    System.out.print(new String(
                            mensajeRecibido.contenidoFichero, 0,
                            mensajeRecibido.bytesValidos));
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
            return  true;
        } catch (Exception e) {
            e.printStackTrace();
            return  false;
        }
    }
    
    
        
   
}
