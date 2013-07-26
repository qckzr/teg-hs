/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

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

    public ConexionBD() {
        this.usuario = "hector";
        this.password = "passw0rd";
        this.puerto = "1521";
        this.ipBd = "192.168.1.200";
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
            stmt.execute(query);
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(ConexionBD.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
          return true;
       
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
