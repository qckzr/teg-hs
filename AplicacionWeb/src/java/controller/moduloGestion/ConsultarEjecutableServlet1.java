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
 * Clase que permite obtener la información perteneciente a un ejecutable
 * seleccionado por el usuario.
 * @author Héctor Sam
 */
@WebServlet(name = "ConsultarEjecutableServlet1", urlPatterns = {"/ConsultarEjecutableServlet1"})
public class ConsultarEjecutableServlet1 extends HttpServlet {

    private ConexionBD conexion;
    private String id;
    private ResultSet rs;
    private ResultSet parametros;
    ResultSet aplicacion;
    private ArrayList<String[]> listaParametros;
    private String[] parametro;
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

    public ResultSet getRs() {
        return rs;
    }

    public void setRs(ResultSet rs) {
        this.rs = rs;
    }

    public ResultSet getParametros() {
        return parametros;
    }

    public void setParametros(ResultSet parametros) {
        this.parametros = parametros;
    }

    public ResultSet getAplicacion() {
        return aplicacion;
    }

    public void setAplicacion(ResultSet aplicacion) {
        this.aplicacion = aplicacion;
    }

    public ArrayList<String[]> getListaParametros() {
        return listaParametros;
    }

    public void setListaParametros(ArrayList<String[]> listaParametros) {
        this.listaParametros = listaParametros;
    }

    public String[] getParametro() {
        return parametro;
    }

    public void setParametro(String[] parametro) {
        this.parametro = parametro;
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
    protected void processRequest(HttpServletRequest request, 
            HttpServletResponse response) throws ServletException, IOException {
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
     * Método que permite buscar la información correspondiente a un ejecutable.
     * @param request La petición HTTP con el id del ejecutable.
     * @return True si la información pudo ser buscada. False en caso contrario.
     */
    public boolean buscarInformacion(HttpServletRequest request){
        if (request != null){
        try {
            conexion = new ConexionBD();
            id = request.getParameter("ejecutables");
            rs = conexion.consultarRegistro("SELECT NOMBRE,TIPO,RUTA_EJECUTABLE,"
                    + " ID_APLICACION FROM EJECUTABLES WHERE ID="+id);
            aplicacion = conexion.consultarRegistro("Select nombre "
                    + "from aplicaciones where id="+rs.getString(4));
            listaParametros = new ArrayList<String[]>();
             parametros = conexion.consultar("select nombre, valor "
                        + "from parametros where id_ejecutable="+id);
            while (parametros.next()){
                parametro = new String[2];
                parametro[0] = parametros.getString(1);
                parametro[1] = parametros.getString(2);
                listaParametros.add(parametro);
            }
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(ConsultarEjecutableServlet1.
                    class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        
        }
        return false;
    }
    
    /**
     * Método que permite enviar la información correspondiente a un ejecutable.
     * @param request La petición HTTP con el id del ejecutable.
     * @param response La respuesta HTTP con los datos del ejecutable.
     * @return True si la información pudo ser enviada. False en caso contrario.
     */
    public boolean enviarInformacion(HttpServletRequest request,
            HttpServletResponse response){
      
        if ((request != null) &&(response != null)){
            try {
                request.setAttribute("nombre",rs.getString(1));
                request.setAttribute("tipo",rs.getString(2));
                request.setAttribute("ruta_ejecutable",rs.getString(3));
                request.setAttribute("aplicacion",aplicacion.getString(1));
                request.setAttribute("parametros",listaParametros);
                dispatcher = request.getRequestDispatcher(
                        "ejecutables/consultarEjecutable2.jsp");
                dispatcher.forward(request, response);
                conexion.desconectar();
                return true;
            } catch (SQLException ex) {
                Logger.getLogger(ConsultarEjecutableServlet1.class.getName()).
                        log(Level.SEVERE, null, ex);
                return false;
            } catch (ServletException ex) {
                Logger.getLogger(ConsultarEjecutableServlet1.class.getName()).
                        log(Level.SEVERE, null, ex);
                return false;
            } catch (IOException ex) {
                Logger.getLogger(ConsultarEjecutableServlet1.class.getName()).
                        log(Level.SEVERE, null, ex);
                return false;
            }
        } return false;
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
