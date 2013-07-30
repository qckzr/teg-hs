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
 * @author hector
 */
@WebServlet(name = "EliminarPreguntaServlet1", urlPatterns = {"/EliminarPreguntaServlet1"})
public class EliminarPreguntaServlet1 extends HttpServlet {

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
            String idPregunta = request.getParameter("preguntas");
            ResultSet rs = conexionBD.consultarRegistro("SELECT p.id, p.enunciado, t.nombre FROM preguntas p,topicos t where p.id_topico=t.id and p.id="+idPregunta);
            ResultSet rs2 = conexionBD.consultar("select opcion,correcta from respuestas where id_pregunta="+idPregunta);
            ArrayList<String[]> preguntas = new ArrayList<String[]>();
            while (rs2.next()){
                String[] pregunta = new String[2];
                pregunta[0] = rs2.getString(1);
                pregunta[1] = rs2.getString(2);
                preguntas.add(pregunta);
            }
            request.setAttribute("enunciado", rs.getString(1));
            request.setAttribute("topico", rs.getString(2));
            request.setAttribute("preguntas", preguntas);
            request.setAttribute("id", idPregunta);
            RequestDispatcher dispatcher = request.getRequestDispatcher("preguntas/eliminarPregunta2.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(EliminarPreguntaServlet1.class.getName()).log(Level.SEVERE, null, ex);
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
