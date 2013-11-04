/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Clase que permite visualizar la información de un escenario perteneciente
 * a una aplicación de sistemas distribuido.
 * @author Héctor Sam
 */
@WebServlet(name = "MostrarEscenarioServlet", urlPatterns = {"/MostrarEscenarioServlet"})
public class MostrarEscenarioServlet extends HttpServlet {

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
                enviarInformacionEscenario(request, response);
//              request.setAttribute("nombre", request.getParameter("nombre"));
//              request.setAttribute("descripcion", request.getParameter("descripcion"));
//              request.setAttribute("imagen", request.getParameter("imagen"));
//             
//              RequestDispatcher dispatcher = request.getRequestDispatcher("/escenario.jsp");
//                dispatcher.forward(request, response);  
        } finally {  
            
            out.close();
        }
    }
    
    
    /**
     * Método que permite enviar la información de un escenario para ser
     * visualizada por el usuario.
     * @param request La petition HTTP que contiene la información del escenario
     * @param response La respuesta HTTP para visualizar la información.
     * @return True si se envió la respuesta. False en caso contrario.
     */
    public boolean enviarInformacionEscenario(HttpServletRequest request,
            HttpServletResponse response){
        if ((request != null) && (response != null)){
            try {
                request.setAttribute("nombre", request.getParameter("nombre"));
                request.setAttribute("descripcion", request.getParameter("descripcion"));
                request.setAttribute("imagen", request.getParameter("imagen"));

                RequestDispatcher dispatcher = request.getRequestDispatcher("/escenario.jsp");  
                dispatcher.forward(request, response);
                return true;
            } catch (ServletException ex) {
                Logger.getLogger(MostrarEscenarioServlet.class.getName()).
                        log(Level.SEVERE, null, ex);
                return false;
            } catch (IOException ex) {
                Logger.getLogger(MostrarEscenarioServlet.class.getName()).
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
