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
 * @author sam
 */
@WebServlet(name = "ModificarAplicacionServlet1", urlPatterns = {"/ModificarAplicacionServlet1"})
public class ModificarAplicacionServlet1 extends HttpServlet {

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
            ArrayList<String[]> escenarios = new ArrayList<String[]>();
            ResultSet rs = conexion.consultarRegistro("SELECT NOMBRE,TO_CHAR(FECHA_ACTUALIZACION,'DD-MM-YYYY'),INSTRUCCIONES,ID_TOPICO FROM APLICACIONES WHERE ID="+id);
            ResultSet rs2 = conexion.consultar("SELECT NOMBRE,DESCRIPCION, IMAGEN,ID FROM ESCENARIOS WHERE ID_APLICACION="+id);
            while (rs2.next()){
                String[] escenario = new String[4];
                escenario[0] = rs2.getString(1);
                escenario[1] = rs2.getString(2);
                if (rs2.getString(3)!=null)
                    escenario[2] = rs2.getString(3);
                else escenario[2] = "NULL";
                escenario[3] = rs2.getString(4);
                escenarios.add(escenario);
            }
            request.setAttribute("nombre",rs.getString(1));
            request.setAttribute("fecha_actualizacion",rs.getString(2));
            request.setAttribute("instrucciones",rs.getString(3));
            request.setAttribute("idTopico", rs.getString(4));
            request.setAttribute("id",id);
            request.setAttribute("escenarios",escenarios);
            RequestDispatcher dispatcher = request.getRequestDispatcher("aplicaciones/modificarAplicacion2.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ModificarAplicacionServlet1.class.getName()).log(Level.SEVERE, null, ex);
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
