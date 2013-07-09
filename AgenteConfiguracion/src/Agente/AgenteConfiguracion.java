/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Agente;

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
        
        lib = new LibreriaMensajes(true,2000);
        lib.agregarIpDestino("");//ip del servidor central.
        Monitoreo monitoreo = new Monitoreo(lib);
        monitoreo.start();
        
    }
    

}
