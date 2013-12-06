/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package desafios;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.net.ssl.SSLServerSocket;
import javax.net.ssl.SSLServerSocketFactory;
import javax.net.ssl.SSLSocket;

/**
 * Clase que implementa un hilo que  permite esperar por los mensajes enviados 
 * a través de Sockets seguros.
 * @author sam
 */
public class HiloSSL extends Thread{
    
    private boolean control = true;
    private LogicaAplicacion logicaAplicacion;
    private SSLServerSocket serverSocket;
    
    /**
     * Constructor de la clase, inicia el servidor en el puerto indicado en 
     * la lógica.
     * @param logicaAplicacion 
     */
    public HiloSSL(LogicaAplicacion logicaAplicacion){
        this.logicaAplicacion = logicaAplicacion;
        iniciarServidor(logicaAplicacion.getPuerto());
    }
    
    
    /**
     * Método que permite escuchar constantemente.
     */
    @Override
    public void run(){
        
        while (control){
            escucha();
        }
        
    }
    
   /**
    * Método que inicia el socket servidor en un puerto específico.
    * @param puerto El puerto para iniciar la escucha
    * @return True si se crea el socket servidor. False en caso contrario.
    */ 
   public boolean iniciarServidor(int puerto){
         
        SSLServerSocketFactory fact = (SSLServerSocketFactory)SSLServerSocketFactory.getDefault();
        try {
            // Utilizamos el objeto para crear un socket servidor seguro
            serverSocket = (SSLServerSocket)fact.createServerSocket(puerto );
            return true;
        } catch (IOException ex) {
            ex.printStackTrace();
            return false;
        }
        
    }
   
   /**
    * Método que espera por la espera de un cliente para enviarle el archivo
    * deseado.
    */
   public void escucha()
    {
        SSLSocket cliente;
        ObjectInputStream objectInputStream;
        try{
           
            cliente = (SSLSocket) serverSocket.accept();

            System.out.println("Aceptado cliente");
            logicaAplicacion.getLibreriaMensajes().enviarMensaje("Aceptado cliente");
            cliente.setSoLinger(true, 10);

            objectInputStream = new ObjectInputStream(cliente.getInputStream());
            Object mensaje = objectInputStream.readObject();
            if (logicaAplicacion.isArchivoOcupado()){
                while (true){
                    System.out.println("Archivo ocupado...!");
                    logicaAplicacion.getLibreriaMensajes().
                            enviarMensaje("Archivo ocupado...!");
                    Thread.sleep(1000);
                    if (!logicaAplicacion.isArchivoOcupado())
                        break;
                }
            } else{
                
                logicaAplicacion.setArchivoOcupado(true);
                if (mensaje instanceof MensajeDameFichero){
                    logicaAplicacion.getLibreriaMensajes().enviarMensaje("Enviando archivo al cliente...");
                    enviar(cliente, (MensajeDameFichero) mensaje);
                
                } else{
                
                System.err.println (
                        "Mensaje no esperado "+mensaje.getClass().getName());
                }
            
                cliente.close();
            }
        } catch (Exception e){
            e.printStackTrace();
        }
    }
   
   
   /**
    * Método que envía el archivo hacia el cliente.
    * @param cliente El socket por donde enviará la información.
    * @param mensajeDameFichero El mensaje a enviar.
    */
   public void enviar(Socket cliente, MensajeDameFichero mensajeDameFichero){

        ObjectOutputStream objectOutputStream = null;
        try {            
            objectOutputStream = new ObjectOutputStream(cliente.getOutputStream());    
            logicaAplicacion.enviaFichero(((MensajeDameFichero) mensajeDameFichero)
                    .nombreFichero,objectOutputStream);
            logicaAplicacion.enviarHash(((MensajeDameFichero) mensajeDameFichero).
                    nombreFichero,objectOutputStream);
            logicaAplicacion.setArchivoOcupado(false);
            logicaAplicacion.getLibreriaMensajes().enviarMensaje("Archivo enviado...");
        } catch (IOException ex) {
            Logger.getLogger(HiloSSL.class.getName()).log(Level.SEVERE, null, ex);
        }
       
   }

   
    
   
   
   
    
}
