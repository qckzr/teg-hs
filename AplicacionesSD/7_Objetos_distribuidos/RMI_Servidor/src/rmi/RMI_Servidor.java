/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rmi;

import Libreria.LibreriaMensajes;

/**
 *
 * @author hectorsam
 */
public class RMI_Servidor {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
         LibreriaMensajes libreriaMensajes = new LibreriaMensajes();
        System.setProperty("java.rmi.server.hostname", libreriaMensajes.getIpOrigen());
        DatosAplicacion datosAplicacion = new DatosAplicacion(args[0],args[1]);//args[0] = nombreApp, args[1] = numeroNodo
        libreriaMensajes.agregarIpDestino(args[2]); //args[2] ip del servidor central
        LogicaAplicacion logicaAplicacion = LogicaAplicacion.getInstancia(libreriaMensajes, datosAplicacion, Integer.valueOf(args[3]));
        logicaAplicacion.enviarId(args[2]);
        EscucharClientes escucharMensajes = new EscucharClientes(logicaAplicacion, libreriaMensajes);
        escucharMensajes.start();
    }
    
}
