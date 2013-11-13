/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.moduloGestion;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ConexionBD;

/**
 * Clase que permite modificar un evento de la base de datos a través del
 * módulo de gestión.
 * @author Héctor Sam
 */
@WebServlet(name = "ModificarEventoServlet2", urlPatterns = {"/ModificarEventoServlet2"})
public class ModificarEventoServlet2 extends HttpServlet {

    private String nombre;
    private String path;
    private String id;
    private ConexionBD conexion;
    private ResultSet rs;
    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /*
             * TODO output your page here. You may use following sample code.
             */
            obtenerInformacion(request);
            ejecutarQuery(request);
            enviarInformacion(request, response);
        } finally {            
            out.close();
        }
    }
    
    /**
     * Método que permite obtener la información correspondiente a un evento.
     * @param request La petición HTTP con el id del evento.
     * @return True si la información fue obtenida. False en caso contrario.
     */
    public boolean obtenerInformacion(HttpServletRequest request){
        if (request != null) {
            
            conexion = new ConexionBD();
            nombre = request.getParameter("nombre");
            path = request.getParameter("path");
            
            id = request.getParameter("id");
            return true;
             
        }
        return false;
    }
    
    /**
     * Método que permite ejecutar el query con la información perteneciente
     * a un evento.
     * @param request La petición HTTP con la información del evento.
     * @return True si la información fue obtenida. False en caso contrario.
     */
    public boolean ejecutarQuery(HttpServletRequest request){
        
        if (request != null) {
            try {
                rs = conexion.consultarRegistro("SELECT * FROM EVENTOS WHERE ID="+id);
                if (!rs.getString(2).contains(nombre)) {
                    conexion.ejecutarQuery("UPDATE EVENTOS "
                            + "SET NOMBRE='"+nombre+"' WHERE ID="+id);          
                }
                if (!rs.getString(3).contentEquals(path)) {
                    conexion.ejecutarQuery("UPDATE EVENTOS "
                            + "SET PATHSCRIPT='"+path+"' WHERE ID="+id);
                }
                
                return true;
            } catch (SQLException ex) {
                Logger.getLogger(ModificarEventoServlet2.
                        class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return false;
    }
    
    
    /**
     * Método que permite enviar la información correspondiente del evento
     * a modificar..
     * @param request La petición HTTP que contendrá la información.
     * @param response La respuesta HTTP donde se redirigirá la información.
     * @return True si la información fue enviada. False en caso contrario.
     */
    public boolean enviarInformacion (HttpServletRequest request,
            HttpServletResponse response){
        RequestDispatcher dispatcher; 
        if ((request != null) && (response != null) ){
            try {
                
                request.setAttribute("mensaje","Evento Modificado");
                dispatcher = request.getRequestDispatcher("/respuesta.jsp");
                dispatcher.forward(request, response);
                conexion.desconectar();
                return true;
             } catch (ServletException ex) {
                 Logger.getLogger(CrearEjecutableServlet.class.getName()).
                         log(Level.SEVERE, null, ex);
                 return false;
             } catch (IOException ex) {
                 Logger.getLogger(CrearEjecutableServlet.class.getName()).
                         log(Level.SEVERE, null, ex);
                 return false;
             } 
        }
        return false;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
