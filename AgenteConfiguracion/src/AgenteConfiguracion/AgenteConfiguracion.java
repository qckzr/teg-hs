/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package AgenteConfiguracion;

import Libreria.LibreriaMensajes;

/**
 *
 * @author hectorsam
 */
public class AgenteConfiguracion {

    /**
     * @param args the command line arguments
     */
    
    private static LibreriaMensajes lib;
    
    public static void main(String[] args) {
        // TODO code application logic here
        
        lib = new LibreriaMensajes(Integer.valueOf(args[0]));
        lib.agregarIpDestino(args[1]);//ip del servidor central.
        Monitoreo monitoreo = new Monitoreo(lib);
        monitoreo.setIntefaz(args[2]);
        monitoreo.start();
        
    }
    

}
