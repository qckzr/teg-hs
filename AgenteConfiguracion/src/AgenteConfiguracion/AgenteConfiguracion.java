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
        
        lib = new LibreriaMensajes(2000);
        lib.agregarIpDestino("9.177.12.133");//ip del servidor central.
        Monitoreo monitoreo = new Monitoreo(lib);
        monitoreo.start();
        
    }
    

}
