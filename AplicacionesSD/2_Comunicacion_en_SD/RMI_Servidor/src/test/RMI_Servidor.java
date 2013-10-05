/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import Libreria.LibreriaMensajes;

/**
 *
 * @author sam
 */
public class RMI_Servidor {

    /**
     * @param args the command line arguments
     */
    
    public static void main(String[] args) {
        
        LibreriaMensajes libreriaMensajes = new LibreriaMensajes(5000);
        System.setProperty("java.rmi.server.hostname", libreriaMensajes.getIpOrigen());
        DatosAplicacion datosAplicacion = new DatosAplicacion(args[0],args[1]);//args[0] = nombreApp, args[1] = numeroNodo
        libreriaMensajes.agregarIpDestino(args[2]); //args[2] ip del servidor central
        LogicaAplicacion logicaAplicacion = new LogicaAplicacion(libreriaMensajes, datosAplicacion, Integer.valueOf(args[3]));
        logicaAplicacion.enviarId(args[2]);
        EscucharClientes escucharMensajes = new EscucharClientes(logicaAplicacion, libreriaMensajes);
        escucharMensajes.start();
    }
}
