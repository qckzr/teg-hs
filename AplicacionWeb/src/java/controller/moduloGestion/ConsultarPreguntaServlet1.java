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
@WebServlet(name = "ConsultarPreguntaServlet1", urlPatterns = {"/ConsultarPreguntaServlet1"})
public class ConsultarPreguntaServlet1 extends HttpServlet {

    private ConexionBD conexionBD;
    private String idPregunta;
    private ArrayList<String[]> preguntas;
    private ResultSet resultSet;
    private ResultSet resultSet1;
    private String[] pregunta;
    

    public ConexionBD getConexionBD() {
        return conexionBD;
    }

    public void setConexionBD(ConexionBD conexionBD) {
        this.conexionBD = conexionBD;
    }

    public String getIdPregunta() {
        return idPregunta;
    }

    public void setIdPregunta(String idPregunta) {
        this.idPregunta = idPregunta;
    }

    public ArrayList<String[]> getPreguntas() {
        return preguntas;
    }

    public void setPreguntas(ArrayList<String[]> preguntas) {
        this.preguntas = preguntas;
    }

    public ResultSet getResultSet() {
        return resultSet;
    }

    public void setResultSet(ResultSet resultSet) {
        this.resultSet = resultSet;
    }

    public ResultSet getResultSet1() {
        return resultSet1;
    }

    public void setResultSet1(ResultSet resultSet1) {
        this.resultSet1 = resultSet1;
    }

    public String[] getPregunta() {
        return pregunta;
    }

    public void setPregunta(String[] pregunta) {
        this.pregunta = pregunta;
    }
    
    
    
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
     * Método que permite obtener la información correspondiente a una pregunta
     * solicitada por el usuario.
     * @param request La petición HTTP con la pregunta a buscar.
     * @return True si se pudo obtener la información. False en caso contrario.
     */
    public boolean buscarInformacion(HttpServletRequest request) {
          
        if (request != null){
            try {
                conexionBD = new ConexionBD();
                
                idPregunta = request.getParameter("preguntas");
                resultSet = conexionBD.consultarRegistro("SELECT p.id, p.enunciado,"
                        + " t.nombre FROM preguntas p,topicos t where "
                        + "p.id_topico=t.id and p.id="+idPregunta);
                resultSet1 = conexionBD.consultar("select opcion,correcta "
                        + "from respuestas where id_pregunta="+idPregunta);
                preguntas = new ArrayList<String[]>();
                while (resultSet1.next()){
                    pregunta = new String[2];
                    pregunta[0] = resultSet1.getString(1);
                    pregunta[1] = resultSet1.getString(2);
                    preguntas.add(pregunta);
                }
                return true;
            } catch (SQLException ex) {
                Logger.getLogger(ConsultarPreguntaServlet1.class.getName()).
                        log(Level.SEVERE, null, ex);
                return false;
            }
        }
        return false;
    }
    
    /**
     * Método que permite enviar la información de una pregunta solicitada por 
     * el usuario.
     * @param request La petición HTTP con la pregunta a buscar.
     * @param response La respuesta HTTP con la información solicitada.
     * @return True si la información se pudo enviar. False en caso contrario
     */
    public boolean enviarInformacion(HttpServletRequest request,
            HttpServletResponse response) {
        
        RequestDispatcher dispatcher;
        if ( (request != null) && (response !=null)){
            try {
              
                request.setAttribute("enunciado", resultSet.getString(2));
                request.setAttribute("topico", resultSet.getString(3));
                request.setAttribute("preguntas", preguntas);
                dispatcher = request.getRequestDispatcher("preguntas/consultarPregunta2.jsp");
                dispatcher.forward(request, response);
                conexionBD.desconectar();
                return true;
            } catch (SQLException ex) {
                Logger.getLogger(ConsultarPreguntaServlet1.class.getName()).
                        log(Level.SEVERE, null, ex);
                return false;
            } catch (ServletException ex) {
                Logger.getLogger(ConsultarPreguntaServlet1.class.getName()).
                        log(Level.SEVERE, null, ex);
                return false;
            } catch (IOException ex) {
                Logger.getLogger(ConsultarPreguntaServlet1.class.getName()).
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
