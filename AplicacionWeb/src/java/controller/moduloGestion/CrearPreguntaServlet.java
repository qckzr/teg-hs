/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.moduloGestion;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Clase que permite agregar una pregunta a la base de datos a través del módulo
 * de Gestión.
 * @author Héctor Sam
 */
@WebServlet(name = "CrearPreguntaServlet", urlPatterns = {"/CrearPreguntaServlet"})
public class CrearPreguntaServlet extends HttpServlet {

    private ConexionBD conexionBD = new ConexionBD();
    private String enunciado;
    private String topico;
    private String opcion1;
    private String opcion2;
    private String opcion3;
    private String opcion4;
    private String respuestaCorrecta1;
    private String respuestaCorrecta2;
    private String respuestaCorrecta3;
    private String respuestaCorrecta4;
    private String idPregunta;
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
     * Método que permite obtener la información correspondiente a una pregunta
     * @param request La petición HTTP con los datos de la pregunta.
     * @return True si la información fue obtenida. False en caso contrario.
     */
    public boolean obtenerInformacion(HttpServletRequest request){
        if (request != null) {
           
                conexionBD = new ConexionBD();
                enunciado = request.getParameter("enunciado");
                topico = request.getParameter("topicos");
                opcion1 = request.getParameter("opcion1");
                opcion2 = request.getParameter("opcion2");
                opcion3 = request.getParameter("opcion3");
                opcion4 = request.getParameter("opcion4");
                respuestaCorrecta1 = request.getParameter("checkbox1");
                respuestaCorrecta2 = request.getParameter("checkbox2");
                respuestaCorrecta3 = request.getParameter("checkbox3");
                respuestaCorrecta4 = request.getParameter("checkbox4");
                return true;   
        }
        return false;
    }
    
    /**
     * Método que permite ejecutar el query con la información perteneciente
     * a una pregunta.
     * @param request La petición HTTP con la información de la pregunta.
     * @return True si la pregunta fue agregada. False en caso contrario.
     */
    public boolean ejecutarQuery(HttpServletRequest request){
        
        if (request != null) {
            try {
                conexionBD.ejecutarQuery("INSERT INTO PREGUNTAS "
                        + "(ID,ENUNCIADO,ID_TOPICO) VALUES (S_PREGUNTAS.NEXTVAL,"
                        + "'"+enunciado+"',"+topico+")");
                idPregunta = conexionBD.consultarRegistro("SELECT ID FROM PREGUNTAS"
                        + " WHERE ENUNCIADO='"+enunciado+"'").getString(1);
                conexionBD.ejecutarQuery("INSERT INTO RESPUESTAS "
                        + "(ID,OPCION,ID_PREGUNTA,CORRECTA) VALUES "
                        + "(S_RESPUESTAS.NEXTVAL,'"+opcion1+"',"+idPregunta+","
                        + ""+respuestaCorrecta1+")");
                conexionBD.ejecutarQuery("INSERT INTO RESPUESTAS "
                        + "(ID,OPCION,ID_PREGUNTA,CORRECTA) VALUES "
                        + "(S_RESPUESTAS.NEXTVAL,'"+opcion2+"',"+idPregunta+","
                        + ""+respuestaCorrecta2+")");
                conexionBD.ejecutarQuery("INSERT INTO RESPUESTAS "
                        + "(ID,OPCION,ID_PREGUNTA,CORRECTA) VALUES "
                        + "(S_RESPUESTAS.NEXTVAL,'"+opcion3+"',"+idPregunta+","
                        + ""+respuestaCorrecta3+")");
                conexionBD.ejecutarQuery("INSERT INTO RESPUESTAS "
                        + "(ID,OPCION,ID_PREGUNTA,CORRECTA) VALUES "
                        + "(S_RESPUESTAS.NEXTVAL,'"+opcion4+"',"+idPregunta+","
                        + ""+respuestaCorrecta4+")");
                return true;
            } catch (SQLException ex) {
                Logger.getLogger(CrearPreguntaServlet.class.getName()).
                        log(Level.SEVERE, null, ex);
                return false;
            }
        }
        return false;
    }
    
    
    /**
     * Método que permite enviar la información correspondiente indicando que la
     * pregunta se agregó.
     * @param request La petición HTTP que contendrá la información.
     * @param response La respuesta HTTP donde se redirigirá la información.
     * @return True si la información fue enviada. False en caso contrario.
     */
    public boolean enviarInformacion (HttpServletRequest request,
            HttpServletResponse response){
        RequestDispatcher dispatcher; 
        if ((request != null) && (response != null) ){
            try {
                request.setAttribute("mensaje","Se agregó la pregunta");     
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
