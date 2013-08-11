/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ConexionBD;

/**
 *
 * @author sam
 */
@WebServlet(name = "EjecutableNodoServlet", urlPatterns = {"/EjecutableNodoServlet"})
public class EjecutableNodoServlet extends HttpServlet {

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
            
            ConexionBD conexionBD = new ConexionBD();
            String idAplicacion = request.getParameter("idAplicacion");
            ResultSet nodos = conexionBD.consultar("SELECT N.ID FROM NODOS N WHERE N.ID NOT IN "
                    + "(SELECT ID_NODO FROM EJECUTABLES WHERE ID_APLICACION ="+idAplicacion+")"
                    + "ORDER BY N.ID");
            out.println("<select id=\"nodos\" name=\"nodos\">");
            if (!nodos.next()){
                
                ResultSet id = conexionBD.consultar("SELECT  ID FROM NODOS");
                
                while (id.next()){
                    out.println("<option value=\""+id.getString(1)+"\">Nodo"+id.getString(1) +"</option>");
                }
            
            }    
             else   
                do{   
                    out.println("<option value=\""+nodos.getString(1)+"\">Nodo"+nodos.getString(1)+"</option>");
                }   while (nodos.next());
             out.println("</select>");     
            
            
                
            
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet EjecutableNodo</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet EjecutableNodo at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
        } catch (SQLException ex) {
            Logger.getLogger(EjecutableNodoServlet.class.getName()).log(Level.SEVERE, null, ex);
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
