/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servidorcentral;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Clase que permite realizar la conexión desde el servidor central hacia
 * la Base de Datos.
 * @author hector
 */
public class ConexionBD {
    
    private String usuario;
    private String password;
    private String puerto;
    private String ipBd;
    private Connection conexion;

    
    public ConexionBD(String usuario, String password, String puerto,
            String ipBd) {
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
    
    
    
    /**
     * Método que permite conectarse a la base de datos.
     * @return La conexión creada para realizar las consultas respectivas.
     */
    public Connection conectar(){
        Connection connection = null;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            
            connection = DriverManager.getConnection(
            "jdbc:oracle:thin:@"+ipBd+":"+puerto+":XE",""+usuario+"",
                    ""+password+"" );
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return connection;
    }
    
    /**
     * Método que permite desconectarse de la base de datos.
     * @return True si se desconectó satisfactoriamente. False en caso contrario.
     */
    public boolean desconectar(){
        try {
            conexion.close();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(ConexionBD.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    
    /**
     * Método que permite realizar una consulta a la base de datos.
     * @param query La consulta a realizar.
     * @return Las filas de la consulta realizada.
     */
    public ResultSet consultar(String query){
        
        Statement stmt = null;
        ResultSet rs = null;
        try {
            stmt =  conexion.createStatement();
            rs = stmt.executeQuery(query);
        } catch (SQLException e ) {
            Logger.getLogger(ConexionBD.class.getName()).
                    log(Level.SEVERE, null, e);
        }
        return rs;
    }
    
    /**
     * Método que permite realizar la ejecución de una sentencia SQL.
     * @param query La sentencia SQL.
     * @return True si se realizó la sentencia. False en caso contrario.
     */
    public boolean ejecutarQuery(String query){
        boolean retorno = false;
        Statement stmt = null;
        
        try {
            
            stmt =  conexion.createStatement();
            stmt.execute(query);
            stmt.close();
            retorno = true;
        } catch (SQLException ex) {
            Logger.getLogger(ConexionBD.class.getName()).
                    log(Level.SEVERE, null, ex); 
          
        }
        return retorno;
       
    }
    
    /**
     * Método que devuelve el primer registro de una consulta SQL.
     * @param query La consulta SQL
     * @return El primer registro retornado de la consulta.
     */
    public ResultSet consultarRegistro(String query){
        Statement stmt = null;
        ResultSet rs = null;
        try {
            stmt =  conexion.createStatement();
             rs = stmt.executeQuery(query);
            while (rs.next()){
                return rs;
            }
        } catch (SQLException e ) {
            Logger.getLogger(ConexionBD.class.getName()).
                    log(Level.SEVERE, null, e);
        }
        return null;
    }
    
    public void iniciar(){
        conexion = conectar();
    }
    
    
    
    
}
