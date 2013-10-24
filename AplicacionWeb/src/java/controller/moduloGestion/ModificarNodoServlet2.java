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
 *
 * @author hector
 */
@WebServlet(name = "ModificarNodoServlet2", urlPatterns = {"/ModificarNodoServlet2"})
public class ModificarNodoServlet2 extends HttpServlet {

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
              ConexionBD conexion = new ConexionBD();
            String id = request.getParameter("id");
            String ip = request.getParameter("ip");
            String usuario = request.getParameter("usuario");
            String contrasena = request.getParameter("contrasena");
           
            ResultSet rs = conexion.consultarRegistro("SELECT * FROM nodos WHERE ID="+id);
            
            if (!rs.getString(2).contentEquals(ip))
                conexion.ejecutarQuery("UPDATE nodos SET ip='"+ip+"' WHERE ID="+id);
            if (!rs.getString(3).contentEquals("usuario"))
                conexion.ejecutarQuery("UPDATE nodos SET nombre_usuario='"+usuario+"' WHERE ID="+id);
            if (!rs.getString(4).contentEquals(contrasena))
                    conexion.ejecutarQuery("UPDATE nodos SET contrasena='"+contrasena+"' WHERE ID="+id);
            
             request.setAttribute("mensaje","Nodo Modificado");
           RequestDispatcher dispatcher = request.getRequestDispatcher("/respuesta.jsp");
            dispatcher.forward(request, response);    
        } catch (SQLException ex) {
            Logger.getLogger(ModificarNodoServlet2.class.getName()).log(Level.SEVERE, null, ex);
        } finally {            
            out.close();
        }
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
