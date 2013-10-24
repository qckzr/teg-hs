/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.moduloGestion;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
@WebServlet(name = "EliminarAplicacionServlet1", urlPatterns = {"/EliminarAplicacionServlet1"})
public class EliminarAplicacionServlet1 extends HttpServlet {

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
            String id = request.getParameter("aplicaciones");
            ResultSet rs = conexion.consultarRegistro("SELECT NOMBRE,to_date(fecha_actualizacion,'DD/MM/YYYY'),INSTRUCCIONES, ID_TOPICO FROM aplicaciones WHERE ID="+id);
            request.setAttribute("nombre",rs.getString(1));
            request.setAttribute("fecha_actualizacion",rs.getString(2));
            request.setAttribute("instrucciones",rs.getString(3));
            ResultSet aplicacion = conexion.consultarRegistro("Select nombre from topicos where id="+rs.getString(4));
            request.setAttribute("topico",aplicacion.getString(1));
            ResultSet escenarios = conexion.consultar("select nombre, descripcion from escenarios where id_aplicacion="+id);
            ArrayList<String[]> listaEscenarios = new ArrayList<String[]>();
            while (escenarios.next()){
                String[] escenario = new String[2];
                escenario[0] = escenarios.getString(1);
                escenario[1] = escenarios.getString(2);
                listaEscenarios.add(escenario);
            }
            request.setAttribute("escenarios",listaEscenarios);
            request.setAttribute("id", id);
            RequestDispatcher dispatcher = request.getRequestDispatcher("aplicaciones/eliminarAplicacion2.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ConsultarAplicacionServlet.class.getName()).log(Level.SEVERE, null, ex);
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
