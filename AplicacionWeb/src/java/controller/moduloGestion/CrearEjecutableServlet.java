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
import model.Directorios;

/**
 * Clase que permite agregar un ejecutable a la base de datos a través del módulo
 * de Gestión.
 * @author Héctor Sam
 */
@WebServlet(name = "CrearEjecutableServlet", urlPatterns = {"/CrearEjecutableServlet"})
public class CrearEjecutableServlet extends HttpServlet {

     private String nombreEjecutable;
     private String tipo;
     private String idAplicacion;
     private String cantidadParametros;
     private String idNodo;
     private ConexionBD conexionBD;
     private String idEjecutable;
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
     * @param request La petición HTTP con el id de la aplicación.
     * @return True si la información fue obtenida. False en caso contrario.
     */
    public boolean obtenerInformacion(HttpServletRequest request){
        if (request != null) {
            try {
                 nombreEjecutable = "";
                 tipo = request.getParameter("tipoEjecutable");
                 idAplicacion = request.getParameter("aplicacion");
                 cantidadParametros = request.getParameter("cantidadParametros");
                 idNodo = request.getParameter("nodos");
                 conexionBD = new ConexionBD();
                 nombreEjecutable = conexionBD.consultarRegistro("select to_char"
                         + "(sysdate,'DD/MM/YYYY HH24:MI:SS') from dual").getString(1);
                
                 return true;
             } catch (SQLException ex) {
                 Logger.getLogger(CrearEjecutableServlet.class.getName()).
                         log(Level.SEVERE, null, ex);
                 return false;
             }
        }
        return false;
    }
    
    /**
     * Método que permite ejecutar el query con la información perteneciente
     * a un ejecutable.
     * @param request La petición HTTP con la información del ejecutable.
     * @return True si el ejecutable fue agregado. False en caso contrario.
     */
    public boolean ejecutarQuery(HttpServletRequest request){
        String nombreParametro;
        String valorParametro;
        if (request != null) {
            try {
                conexionBD.ejecutarQuery("INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,"
                        + "RUTA_EJECUTABLE,ID_APLICACION,ID_NODO) VALUES "
                        + "(S_EJECUTABLES.NEXTVAL,'"+nombreEjecutable+"','"+tipo+"',"
                        + "'"+nombreEjecutable+"',"+idAplicacion+","+idNodo+")");
                idEjecutable  = conexionBD.consultarRegistro("Select id from "
                        + "ejecutables where nombre='"+nombreEjecutable+"'").getString(1);
                for (int i = 1; i <  Integer.valueOf(cantidadParametros); i++) {
                    nombreParametro = request.getParameter("nombreParametro"+i);
                    valorParametro = request.getParameter("parametro"+i);
                    conexionBD.ejecutarQuery("INSERT INTO PARAMETROS (ID,NOMBRE,"
                            + "VALOR,ID_EJECUTABLE) VALUES(S_PARAMETROS.NEXTVAL,'"
                            +nombreParametro +"','"+valorParametro+"',"+idEjecutable+")");
                }
                return true;
            } catch (SQLException ex) {
                Logger.getLogger(CrearEjecutableServlet.class.getName()).
                        log(Level.SEVERE, null, ex);
                return false;
            }
        }
        return false;
    }
    
    
    /**
     * Método que permite enviar la información correspondiente al ejecutable
     * de una aplicación.
     * @param request La petición HTTP que contendrá la información.
     * @param response La respuesta HTTP donde se redirigirá la información.
     * @return True si la información fue enviada. False en caso contrario.
     */
    public boolean enviarInformacion (HttpServletRequest request,
            HttpServletResponse response){
        RequestDispatcher dispatcher; 
        if ((request != null) && (response != null) ){
            try {
                 request.setAttribute("tipoArchivo", "ejecutable");
                 request.setAttribute("ejecutables",1);
                 request.setAttribute("ejecutable", idEjecutable);
                 dispatcher = request.getRequestDispatcher("/subirArchivo.jsp");
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
