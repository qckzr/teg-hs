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
 * @author sam
 */
@WebServlet(name = "ModificarPreguntaServlet2", urlPatterns = {"/ModificarPreguntaServlet2"})
public class ModificarPreguntaServlet2 extends HttpServlet {

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
                String enunciado = request.getParameter("enunciado");
                String topico = request.getParameter("topicos");
                String id = request.getParameter("id");
                String respuestaCorrecta = request.getParameter("respuestaCorrecta");
                ResultSet pregunta = conexionBD.consultarRegistro("SELECT ENUNCIADO,ID_TOPICO FROM PREGUNTAS WHERE ID="+id);
                if (!pregunta.getString(1).contentEquals(enunciado))
                    conexionBD.ejecutarQuery("UPDATE PREGUNTAS SET ENUNCIADO='"+enunciado+"' WHERE ID="+id);
                if (!pregunta.getString(2).contentEquals(topico))
                    conexionBD.ejecutarQuery("UPDATE PREGUNTAS SET ID_TOPICO="+topico+" WHERE ID="+id);
                ResultSet respuestas = conexionBD.consultar("SELECT ID FROM RESPUESTAS WHERE ID_PREGUNTA="+id);
                
                for (int i = 1; i <= 4; i++) {
                    String respuesta = request.getParameter("respuesta"+i);
                    String opcion = request.getParameter("checkbox"+i);
                    conexionBD.ejecutarQuery("UPDATE RESPUESTAS SET OPCION='"+respuesta+"' WHERE ID="+request.getParameter("idRespuesta"+i));
                    conexionBD.ejecutarQuery("UPDATE RESPUESTAS SET CORRECTA="+opcion+" WHERE ID="+request.getParameter("idRespuesta"+i));
                
            }
            request.setAttribute("mensaje","Pregunta Modificada");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/respuesta.jsp");
            dispatcher.forward(request, response);    
                    
        } catch (SQLException ex) {
            Logger.getLogger(ModificarPreguntaServlet2.class.getName()).log(Level.SEVERE, null, ex);
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
