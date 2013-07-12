/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servidorcentral;

import Libreria.LibreriaMensajes;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

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
            
         //   libreria = new LibreriaMensajes();
       //     GestionarInfraestructura gestion = new GestionarInfraestructura(libreria);
            ConexionBD con = new ConexionBD("hector", "passw0rd","1521","9.177.12.54");
            ResultSet rs =con.consultarRegistro("select * from test");
           
            try {
              
                System.out.println(
            rs.getInt(1));
                
            } catch (SQLException ex) {
                Logger.getLogger(ServidorCentral.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        
    }
}
