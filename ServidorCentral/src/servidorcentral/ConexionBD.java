/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servidorcentral;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author hector
 */
public class ConexionBD {
    
    private String usuario;
    private String password;
    private String puerto;
    private String ipBd;
    private Connection conexion;

    public ConexionBD(String usuario, String password, String puerto,String ipBd) {
        this.usuario = usuario;
        this.password = password;
        this.puerto = puerto;
        this.ipBd = ipBd;
        conexion = conectar();
    }

    
    
    
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPuerto() {
        return puerto;
    }

    public void setPuerto(String puerto) {
        this.puerto = puerto;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getIpBd() {
        return ipBd;
    }

    public void setIpBd(String ipBd) {
        this.ipBd = ipBd;
    }
    
    public Connection getConexion() {
        return conexion;
    }

    public void setConexion(Connection conexion) {
        this.conexion = conexion;
    }
    
    
    
    
    public Connection conectar(){
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection connection = null;
            connection = DriverManager.getConnection(
            "jdbc:oracle:thin:@"+ipBd+":"+puerto+":XE",""+usuario+"",""+password+"" );
            return connection;
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return null;
    }
    
    public boolean desconectar(){
        try {
            conexion.close();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(ConexionBD.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    
    public ResultSet consultar(String query){
        
        Statement stmt = null;
   
        try {
            stmt =  conexion.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            return rs;
        } catch (SQLException e ) {
            Logger.getLogger(ConexionBD.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }
    
    public boolean ejecutarQuery(String query){
        
        try {
            Statement stmt = null;
            stmt =  conexion.createStatement();
            if (stmt.execute(query)==true){
                stmt.close();
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ConexionBD.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
       
    }
    
    public ResultSet consultarRegistro(String query){
        Statement stmt = null;
   
        try {
            stmt =  conexion.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()){
                return rs;
            }
        } catch (SQLException e ) {
            Logger.getLogger(ConexionBD.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }
    
    
    
    
}
