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
 * Clase que permite obtener la información perteneciente a un ejecutable.
 * @author Héctor Sam
 */
@WebServlet(name = "ModificarEjecutableServlet1", urlPatterns = {"/ModificarEjecutableServlet1"})
public class ModificarEjecutableServlet1 extends HttpServlet {

    private ConexionBD conexion;
    private String id;
    private ResultSet rs;
    private ResultSet parametros;
    private ArrayList<String[]> listaParametros;
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
     * Método que permite obtener la información correspondiente a un ejecutable.
     * @param request La petición HTTP con el id del ejecutable.
     * @return True si la información fue obtenida. False en caso contrario.
     */
    public boolean obtenerInformacion(HttpServletRequest request){
        if (request != null) {
            
            conexion = new ConexionBD();
            id = request.getParameter("ejecutables");
            listaParametros = new ArrayList<String[]>();
            return true;
             
        }
        return false;
    }
    
    /**
     * Método que permite ejecutar el query con la información perteneciente
     * a un ejecutable.
     * @param request La petición HTTP con la información del ejecutable.
     * @return True si la información fue obtenida. False en caso contrario.
     */
    public boolean ejecutarQuery(HttpServletRequest request){
        String[] parametro;
        if (request != null) {
            try {
               rs = conexion.consultarRegistro("SELECT NOMBRE,TIPO,RUTA_EJECUTABLE,"
                       + " ID_APLICACION FROM EJECUTABLES WHERE ID="+id);
               parametros = conexion.consultar("select nombre, valor,id "
                       + "from parametros where id_ejecutable="+id);
               
                while (parametros.next()){
                    parametro = new String[3];
                    parametro[0] = parametros.getString(1);
                    parametro[1] = parametros.getString(2);
                    parametro[2] = parametros.getString(3);
                    listaParametros.add(parametro);
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
     * Método que permite enviar la información correspondiente del ejecutable
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
                request.setAttribute("tipo",rs.getString(2));
                request.setAttribute("ruta_ejecutable",rs.getString(3));
                request.setAttribute("aplicacion",rs.getString(4));
                request.setAttribute("parametros",listaParametros);
                request.setAttribute("id",id);
                dispatcher = request.getRequestDispatcher("ejecutables/modificarEjecutable2.jsp");
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
