/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package socketcliente;

import Libreria.LibreriaMensajes;

/**
 *
 * @author sam
 */
public class Arquitectura_C_S_Cliente {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
        LibreriaMensajes libreriaMensajes = new LibreriaMensajes();
        DatosAplicacion datosAplicacion = new DatosAplicacion(args[0],args[1]);//args[0] = nombreApp, args[1] = numeroNodo
        libreriaMensajes.agregarIpDestino(args[2]); //args[2] ip del servidor central
        LogicaAplicacion logicaAplicacion = LogicaAplicacion.getInstance(libreriaMensajes, datosAplicacion, Integer.valueOf(args[3]),args[4]);
        logicaAplicacion.enviarId(args[2]);
        Escuchar escucharMensajes = new Escuchar(logicaAplicacion, libreriaMensajes);
        escucharMensajes.start();
    }
}
