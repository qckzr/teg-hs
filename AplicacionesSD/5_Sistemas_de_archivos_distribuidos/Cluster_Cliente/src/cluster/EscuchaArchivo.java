/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cluster;

import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;

/**
 *
 * @author Héctor Sam
 */
public class EscuchaArchivo extends Thread{
    
    private LogicaAplicacion logicaAplicacion;
    private String nombreArchivo;
    private String ipServidor;
    private int puerto;

    public EscuchaArchivo(LogicaAplicacion logicaAplicacion, 
            String nombreArchivo, String ipServidor,int puerto) {
        this.logicaAplicacion = logicaAplicacion;
        this.nombreArchivo = nombreArchivo;
        this.puerto = puerto;
        this.ipServidor = ipServidor;
    }
    
    
    
    @Override
    public void run(){
        
        solicitarArchivo(nombreArchivo,ipServidor, puerto);
        
    }
    
    
    public boolean solicitarArchivo(String fichero, String servidor, int puerto) {
        Socket socket;
        ObjectOutputStream oos;
        MensajeDameFichero mensaje;
        FileOutputStream fos;
        ObjectInputStream ois;
        MensajeTomaFichero mensajeRecibido;
        Object mensajeAux;
        try {
            
            socket = new Socket(servidor, puerto);
            oos = new ObjectOutputStream(socket
                    .getOutputStream());
            mensaje = new MensajeDameFichero();
            mensaje.nombreFichero = fichero;
            oos.writeObject(mensaje);
            fos = new FileOutputStream("archivoRecibido.txt",true);

            ois = new ObjectInputStream(socket
                    .getInputStream());
            
            
            do{
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
            logicaAplicacion.setArchivoRecibido(logicaAplicacion.getArchivoRecibido()+1);
            if (logicaAplicacion.getArchivoRecibido() == 3){
                System.out.println("Segundos que tardó el archivo por partes: "
                        +logicaAplicacion.getTiempo().getSegundos());
                logicaAplicacion.getLibreriaMensajes().enviarMensaje(
                        "Segundos que tardó el archivo: "
                                +logicaAplicacion.getTiempo().getSegundos());
                logicaAplicacion.getTiempo().kill();
                return  true;
            }
        
        } catch (Exception e) {
            e.printStackTrace();
            return  false;
        }
        return  false;
    }
    
}
