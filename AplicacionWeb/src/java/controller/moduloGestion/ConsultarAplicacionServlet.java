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
 * Clase que permite obtener la información correspondiente a una aplicación
 * seleccionada por el usuario.
 * @author Héctor Sam
 */
@WebServlet(name = "ConsultarAplicacionServlet", urlPatterns = {"/ConsultarAplicacionServlet"})
public class ConsultarAplicacionServlet extends HttpServlet {

    private ConexionBD conexion;
    private String id;
    private ResultSet resultSet;
    private ResultSet aplicacion;
    private ResultSet escenarios;
    private ArrayList<String[]> listaEscenarios;
    private String[] escenario;
    private RequestDispatcher dispatcher;

    public ConexionBD getConexion() {
        return conexion;
    }

    public void setConexion(ConexionBD conexion) {
        this.conexion = conexion;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public ResultSet getResultSet() {
        return resultSet;
    }

    public void setResultSet(ResultSet resultSet) {
        this.resultSet = resultSet;
    }

    public ResultSet getAplicacion() {
        return aplicacion;
    }

    public void setAplicacion(ResultSet aplicacion) {
        this.aplicacion = aplicacion;
    }

    public ResultSet getEscenarios() {
        return escenarios;
    }

    public void setEscenarios(ResultSet escenarios) {
        this.escenarios = escenarios;
    }

    public ArrayList<String[]> getListaEscenarios() {
        return listaEscenarios;
    }

    public void setListaEscenarios(ArrayList<String[]> listaEscenarios) {
        this.listaEscenarios = listaEscenarios;
    }

    public String[] getEscenario() {
        return escenario;
    }

    public void setEscenario(String[] escenario) {
        this.escenario = escenario;
    }

    public RequestDispatcher getDispatcher() {
        return dispatcher;
    }

    public void setDispatcher(RequestDispatcher dispatcher) {
        this.dispatcher = dispatcher;
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
     * Método que permite buscar la información correspondiente en base de datos.
     * @param request La petición con el id de la aplicación a buscar.
     * @return True si se logró obtener los datos de la aplicación. False en 
     * caso contrario.
     */
    public boolean buscarInformacion(HttpServletRequest request){
        if (request != null){
            try {
                conexion = new ConexionBD();
                id = request.getParameter("aplicaciones");
                resultSet = conexion.consultarRegistro("SELECT NOMBRE,to_date"
                        + "(fecha_actualizacion,'DD/MM/YYYY'),"
                        + "INSTRUCCIONES, ID_TOPICO FROM aplicaciones WHERE ID="+id);
                aplicacion = conexion.consultarRegistro(
                        "Select nombre from topicos where id="+resultSet.getString(4));
                escenarios = conexion.consultar("select nombre, descripcion "
                            + "from escenarios where id_aplicacion="+id);
                listaEscenarios = new ArrayList<String[]>();
                while (escenarios.next()){
                        escenario = new String[2];
                        escenario[0] = escenarios.getString(1);
                        escenario[1] = escenarios.getString(2);
                        listaEscenarios.add(escenario);
                    }
                return true;
            } catch (SQLException ex) {
                Logger.getLogger(ConsultarAplicacionServlet.class.getName()).
                        log(Level.SEVERE, null, ex);
                return false;
            }
        }
        return false;
        
    }
    
    /**
     * Método que permite enviar los datos pertenecientes a una aplicación.
     * @param request La petición HTTP con el id de la aplicación.
     * @param response La respuesta HTTP con los datos de la aplicación.
     * @return True si los datos fueron enviados. False en caso contrario.
     */
    public boolean enviarInformacion(HttpServletRequest request,
            HttpServletResponse response){

        if ((request != null) &&(response != null)){
            try {

                request.setAttribute("nombre",resultSet.getString(1));
                request.setAttribute("fecha_actualizacion",resultSet.getString(2));
                request.setAttribute("instrucciones",resultSet.getString(3));
                request.setAttribute("topico",aplicacion.getString(1));
                request.setAttribute("escenarios",listaEscenarios);
                dispatcher = request.getRequestDispatcher("aplicaciones/"
                        + "consultarAplicacion2.jsp");
                dispatcher.forward(request, response);
                conexion.desconectar();
                return true;
            } catch (SQLException ex) {
                Logger.getLogger(ConsultarAplicacionServlet.class.getName()).
                        log(Level.SEVERE, null, ex);
                return false;
            } catch (ServletException ex) {
                Logger.getLogger(ConsultarAplicacionServlet.class.getName()).
                        log(Level.SEVERE, null, ex);
                return false;
            } catch (IOException ex) {
                Logger.getLogger(ConsultarAplicacionServlet.class.getName()).
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
