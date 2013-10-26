/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package fallasbizantinas;

import Libreria.LibreriaMensajes;

/**
 *
 * @author sam
 */
public class FallasBizantinas {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        LibreriaMensajes libreriaMensajes = new LibreriaMensajes();
        DatosAplicacion datosAplicacion = new DatosAplicacion(args[0],args[1]);//args[0] = nombreApp, args[1] = numeroNodo
        libreriaMensajes.agregarIpDestino(args[2]); //args[2] ip del servidor central
        LogicaAplicacion logicaAplicacion = LogicaAplicacion.getInstance(libreriaMensajes, datosAplicacion, Integer.valueOf(args[3]));
        logicaAplicacion.enviarId(args[2]);
        EscucharClientes escucharMensajes = new EscucharClientes(logicaAplicacion, libreriaMensajes);
        logicaAplicacion.agregarNodo(args[4]);
        logicaAplicacion.agregarNodo(args[5]);
        logicaAplicacion.agregarNodo(args[6]);
        escucharMensajes.start();
        logicaAplicacion.iniciar(Integer.valueOf(args[1]));
    }
}
