/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

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
@WebServlet(name = "ModificarEjecutableServlet1", urlPatterns = {"/ModificarEjecutableServlet1"})
public class ModificarEjecutableServlet1 extends HttpServlet {

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
            String id = request.getParameter("ejecutables");
            ResultSet rs = conexion.consultarRegistro("SELECT NOMBRE,TIPO,RUTA_EJECUTABLE, ID_APLICACION FROM EJECUTABLES WHERE ID="+id);
            request.setAttribute("nombre",rs.getString(1));
            request.setAttribute("tipo",rs.getString(2));
            request.setAttribute("ruta_ejecutable",rs.getString(3));
            ResultSet aplicacion = conexion.consultarRegistro("Select nombre from aplicaciones where id="+rs.getString(4));
            request.setAttribute("aplicacion",aplicacion.getString(1));
            ResultSet parametros = conexion.consultar("select nombre, valor from parametros where id_ejecutable="+id);
            ArrayList<String[]> listaParametros = new ArrayList<String[]>();
            while (parametros.next()){
                String[] parametro = new String[2];
                parametro[0] = parametros.getString(1);
                parametro[1] = parametros.getString(2);
                listaParametros.add(parametro);
            }
            request.setAttribute("parametros",listaParametros);
            request.setAttribute("id",id);
            RequestDispatcher dispatcher = request.getRequestDispatcher("ejecutables/modificarEjecutable2.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ConsultarEjecutableServlet1.class.getName()).log(Level.SEVERE, null, ex);
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
