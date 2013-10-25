/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package socket;

import Libreria.LibreriaMensajes;

/**
 *
 * @author sam
 */
public class Socket {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
        LibreriaMensajes libreriaMensajes = new LibreriaMensajes();
        DatosAplicacion datosAplicacion = new DatosAplicacion(args[0],args[1]);//args[0] = nombreApp, args[1] = numeroNodo
        libreriaMensajes.agregarIpDestino(args[2]); //args[2] ip del servidor central
        LogicaAplicacion logicaAplicacion = LogicaAplicacion.getInstancia(libreriaMensajes, datosAplicacion, Integer.valueOf(args[3]));
        logicaAplicacion.enviarId(args[2]);
        logicaAplicacion.agregarDestinatario(args[4],args[5]); //id, nodo
        logicaAplicacion.agregarDestinatario(args[6],args[7]);
        logicaAplicacion.agregarDestinatario(args[8],args[9]);
        EscucharClientes escucharClientes = new EscucharClientes(logicaAplicacion, libreriaMensajes);
        escucharClientes.start();
    }

}
