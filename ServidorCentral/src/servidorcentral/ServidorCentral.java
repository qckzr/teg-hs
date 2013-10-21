/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servidorcentral;

import Libreria.LibreriaMensajes;

/**
 *
 * @author hector
 */
public class ServidorCentral {

    /**
     * @param args the command line arguments
     */
    
    private static LibreriaMensajes libreria;
    public static void main(String[] args) {
       
            // TODO code application logic here
            
            libreria = new LibreriaMensajes();
            //GestionarInfraestructura gestion = new GestionarInfraestructura(libreria,"hector","passw0rd","1521","192.168.1.200" );
            GestionarInfraestructura gestion = new GestionarInfraestructura(libreria,"hector","passw0rd","1521","192.168.1.200" );
            gestion.start();
            
    }
}
