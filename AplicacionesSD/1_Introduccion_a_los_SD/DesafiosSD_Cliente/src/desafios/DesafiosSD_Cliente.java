/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package desafios;

import Libreria.LibreriaMensajes;

/**
 *
 * @author sam
 */
public class DesafiosSD_Cliente {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        System.setProperty("javax.net.ssl.trustStore","/home/pi/Desktop/certificadoSSL");
        System.setProperty("javax.net.ssl.trustStorePassword","password");
         LibreriaMensajes libreriaMensajes = new LibreriaMensajes();
            DatosAplicacion datosAplicacion = new DatosAplicacion(args[0],args[1]);//args[0] = nombreApp, args[1] = numeroNodo
            libreriaMensajes.agregarIpDestino(args[2]); //args[2] ip del servidor central
            //lo nuevo
            LogicaAplicacion logicaAplicacion = LogicaAplicacion.dameLogica();
            logicaAplicacion.setLibreriaMensajes(libreriaMensajes);
            logicaAplicacion.setDatosAplicacion(datosAplicacion);
            logicaAplicacion.setPuertoAgente(Integer.valueOf(args[3]));
            logicaAplicacion.setIpServidor(args[4]);
            
            logicaAplicacion.enviarId(args[2]);
            EscucharClientes escucharMensajes = new EscucharClientes(logicaAplicacion, libreriaMensajes);
             
            escucharMensajes.start();
    }
}
