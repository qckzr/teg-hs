/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.moduloGestion;

import java.io.File;
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
 * Clase que permite eliminar una aplicación de la base de datos a través del
 * módulo de gestión.
 * @author Héctor Sam
 */
@WebServlet(name = "EliminarAplicacionServlet2", urlPatterns = {"/EliminarAplicacionServlet2"})
public class EliminarAplicacionServlet2 extends HttpServlet {

    private ConexionBD conexionBD;
    private String id;
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
     * Método que permite obtener la información correspondiente a un nodo.
     * @param request La petición HTTP con los datos del nodo.
     * @return True si la información fue obtenida. False en caso contrario.
     */
    public boolean obtenerInformacion(HttpServletRequest request){
        if (request != null) {
            
                conexionBD = new ConexionBD();
                id = request.getParameter("id");
                return true;
             
        }
        return false;
    }
    
    /**
     * Método que permite ejecutar el query con la información perteneciente
     * a un nodo para su eliminación.
     * @param request La petición HTTP con la información del nodo.
     * @return True si el nodo fue eliminado. False en caso contrario.
     */
    public boolean ejecutarQuery(HttpServletRequest request){
        File file;
        if (request != null) {
            try {
                rs = conexionBD.consultar("SELECT NVL(IMAGEN,'NULL') FROM ESCENARIOS "
                        + "WHERE ID_APLICACION="+id);
                while (rs.next()) {
                   if (!rs.getString(1).contains("NULL")){
                       file = new File(rs.getString(1));
                       file.delete();
                   } 
                }
               
                conexionBD.ejecutarQuery("DELETE FROM "
                        + "ESCENARIOS WHERE ID_APLICACION="+id);
                conexionBD.ejecutarQuery("DELETE FROM "
                        + "APLICACIONES WHERE ID="+id);
                return true;
            } catch (SQLException ex) {
                Logger.getLogger(EliminarAplicacionServlet2.class.getName()).
                        log(Level.SEVERE, null, ex);
                return false;
            }
        }
        return false;
    }
    
    
    /**
     * Método que permite enviar la información correspondiente indicando que la
     * aplicación fue eliminada.
     * @param request La petición HTTP que contendrá la información.
     * @param response La respuesta HTTP donde se redirigirá la información.
     * @return True si la información fue enviada. False en caso contrario.
     */
    public boolean enviarInformacion (HttpServletRequest request,
            HttpServletResponse response){
        RequestDispatcher dispatcher; 
        if ((request != null) && (response != null) ){
            try {
                    request.setAttribute("mensaje","Aplicacion Eliminada");
                    dispatcher = request.getRequestDispatcher("/respuesta.jsp");
                    dispatcher.forward(request, response);  
                    conexionBD.desconectar();
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
