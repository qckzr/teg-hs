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
 * Clase que permite obtener los datos de un evento.
 * @author Héctor Sam
 */
@WebServlet(name = "ConsultarEventoServlet", urlPatterns = {"/ConsultarEventoServlet"})
public class ConsultarEventoServlet extends HttpServlet {

    private ConexionBD conexionBD;
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
            buscarInformacion(request);
            enviarInformacion(request, response);
        } finally {            
            out.close();
        }
    }
    
    /**
     * Método que permite buscar la información correspondiente a un evento.
     * @param request La petición HTTP con el id del evento.
     * @return True si la información fue obtenida. False en caso contrario.
     */
    public boolean buscarInformacion(HttpServletRequest request){
        if (request != null){ 
            conexionBD = new ConexionBD();
            rs = conexionBD.consultarRegistro("SELECT * FROM EVENTOS "
                 + "WHERE ID ="+request.getParameter("eventos"));
         return true;
        }
        return false;
    }
    
    /**
     * Método que permite enviar la información correspondiente a un evento.
     * @param request La petición HTTP que contendrá la información.
     * @param response La respuesta HTTP donde se redirigirá la información.
     * @return True si la información fue enviada. False en caso contrario.
     */
    public boolean enviarInformacion(HttpServletRequest request,
            HttpServletResponse response){
        RequestDispatcher dispatcher;
        if ( (request != null) && (response != null)){
            try {
                request.setAttribute("nombre", rs.getString(2));
                request.setAttribute("path", rs.getString(3));
                request.setAttribute("id", rs.getString(1));
                dispatcher = request.getRequestDispatcher("eventos/consultarEvento2.jsp");
                dispatcher.forward(request, response);
                conexionBD.desconectar();
                return true;
            } catch (ServletException ex) {
                Logger.getLogger(ConsultarEventoServlet.class.getName()).
                        log(Level.SEVERE, null, ex);
                return false;
            } catch (IOException ex) {
                Logger.getLogger(ConsultarEventoServlet.class.getName()).
                        log(Level.SEVERE, null, ex);
                return false;
            } catch (SQLException ex) {
                Logger.getLogger(ConsultarEventoServlet.class.getName()).
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
