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
 * Clase que permite obtener la información perteneciente a una aplicación.
 * @author Héctor Sam
 */
@WebServlet(name = "ModificarAplicacionServlet1", urlPatterns = {"/ModificarAplicacionServlet1"})
public class ModificarAplicacionServlet1 extends HttpServlet {

    private ConexionBD conexion;
    private String id;
    private ArrayList<String[]> escenarios;
    private ResultSet rs;
    private ResultSet rs2;
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
     * Método que permite obtener la información correspondiente a una aplicación.
     * @param request La petición HTTP con el id de la aplicación.
     * @return True si la información fue obtenida. False en caso contrario.
     */
    public boolean obtenerInformacion(HttpServletRequest request){
        if (request != null) {
            
            conexion = new ConexionBD();
            id = request.getParameter("aplicaciones");
            escenarios = new ArrayList<String[]>();
            return true;
             
        }
        return false;
    }
    
    /**
     * Método que permite ejecutar el query con la información perteneciente
     * a una aplicación.
     * @param request La petición HTTP con la información de la aplicación.
     * @return True si la información fue obtenida. False en caso contrario.
     */
    public boolean ejecutarQuery(HttpServletRequest request){
        String[] escenario;
        if (request != null) {
            try {
                rs = conexion.consultarRegistro("SELECT NOMBRE,TO_CHAR"
                        + "(FECHA_ACTUALIZACION,'DD-MM-YYYY'),INSTRUCCIONES,"
                        + "ID_TOPICO FROM APLICACIONES WHERE ID="+id);
                rs2 = conexion.consultar("SELECT NOMBRE,DESCRIPCION, IMAGEN,ID "
                        + "FROM ESCENARIOS WHERE ID_APLICACION="+id);
                while (rs2.next()){
                    escenario = new String[4];
                    escenario[0] = rs2.getString(1);
                    escenario[1] = rs2.getString(2);
                    if (rs2.getString(3)!=null) {
                        escenario[2] = rs2.getString(3);
                    } else {
                        escenario[2] = "NULL";
                    }
                    escenario[3] = rs2.getString(4);
                    escenarios.add(escenario);
                }
                return true;
            } catch (SQLException ex) {
                Logger.getLogger(ModificarAplicacionServlet1.class.getName()).
                        log(Level.SEVERE, null, ex);
            }
           
        }
        return false;
    }
    
    
    /**
     * Método que permite enviar la información correspondiente de la aplicación
     * a modificar..
     * @param request La petición HTTP que contendrá la información.
     * @param response La respuesta HTTP donde se redirigirá la información.
     * @return True si la información fue enviada. False en caso contrario.
     */
    public boolean enviarInformacion (HttpServletRequest request,
            HttpServletResponse response){
        RequestDispatcher dispatcher; 
        if ((request != null) && (response != null) ){
            try {
                request.setAttribute("nombre",rs.getString(1));
                request.setAttribute("fecha_actualizacion",rs.getString(2));
                request.setAttribute("instrucciones",rs.getString(3));
                request.setAttribute("idTopico", rs.getString(4));
                request.setAttribute("id",id);
                request.setAttribute("escenarios",escenarios);
                dispatcher = request.getRequestDispatcher("aplicaciones/modificarAplicacion2.jsp");
                dispatcher.forward(request, response);
                conexion.desconectar();
                return true;
             } catch (ServletException ex) {
                 Logger.getLogger(CrearEjecutableServlet.class.getName()).
                         log(Level.SEVERE, null, ex);
                 return false;
             } catch (IOException ex) {
                 Logger.getLogger(CrearEjecutableServlet.class.getName()).
                         log(Level.SEVERE, null, ex);
                 return false;
             } catch (SQLException ex) {
                Logger.getLogger(EliminarAplicacionServlet1.class.getName()).
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
