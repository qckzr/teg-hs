/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package desafios;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import javax.net.ssl.SSLServerSocket;
import javax.net.ssl.SSLServerSocketFactory;
import javax.net.ssl.SSLSocket;

/**
 *
 * @author sam
 */
public class HiloSSL extends Thread{
    
    private boolean control = true;
    private LogicaAplicacion logicaAplicacion;
    private SSLServerSocket serverSocket;
    
    
    public HiloSSL(LogicaAplicacion logicaAplicacion){
        this.logicaAplicacion = logicaAplicacion;
        iniciarServidor(logicaAplicacion.getPuerto());
    }
    
    
    @Override
    public void run(){
        
        while (control){
            escucha();
        }
        
    }
    
    
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
   
   public void escucha()
    {
        try
        {
            // Se abre el socket servidor
       

            // Se espera un cliente
            SSLSocket cliente = (SSLSocket) serverSocket.accept();

            // Llega un cliente.
            System.out.println("Aceptado cliente");
            logicaAplicacion.getLibreriaMensajes().enviarMensaje("Aceptado cliente");

            // Cuando se cierre el socket, esta opci�n hara que el cierre se
            // retarde autom�ticamente hasta 10 segundos dando tiempo al cliente
            // a leer los datos.
            cliente.setSoLinger(true, 10);

            // Se lee el mensaje de petici�n de fichero del cliente.
            ObjectInputStream ois = new ObjectInputStream(cliente
                    .getInputStream());
            Object mensaje = ois.readObject();
            if (logicaAplicacion.isArchivoOcupado()){
                while (true){
                    System.out.println("Archivo ocupado...!");
                    logicaAplicacion.getLibreriaMensajes().enviarMensaje("Archivo ocupado...!");
                    Thread.sleep(1000);
                    if (!logicaAplicacion.isArchivoOcupado())
                        break;
                }
            }
            else{
                
             logicaAplicacion.setArchivoOcupado(true);
            // Si el mensaje es de petici�n de fichero
            if (mensaje instanceof MensajeDameFichero)
            {
                // Se muestra en pantalla el fichero pedido y se envia
                ObjectOutputStream objectOutputStream = new ObjectOutputStream(cliente.getOutputStream());
                logicaAplicacion.enviaFichero(((MensajeDameFichero) mensaje).nombreFichero,
                        objectOutputStream);
                logicaAplicacion.enviarHash(((MensajeDameFichero) mensaje).nombreFichero,
                objectOutputStream);
                logicaAplicacion.setArchivoOcupado(false);
            }
            else
            {
                // Si no es el mensaje esperado, se avisa y se sale todo.
                System.err.println (
                        "Mensaje no esperado "+mensaje.getClass().getName());
            }
            
            // Cierre de sockets 
            cliente.close();
            }
        } catch (Exception e)
        {
            e.printStackTrace();
        }
    }

    /**
     * Env�a el fichero indicado a trav�s del ObjectOutputStream indicado.
     * @param fichero Nombre de fichero
     * @param oos ObjectOutputStream por el que enviar el fichero
     */
   
    
   
   
   
    
}
