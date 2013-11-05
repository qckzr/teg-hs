/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.moduloGestion;

import java.io.IOException;
import java.io.PrintWriter;
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
import model.Directorios;

/**
 * Clase que permite crear una aplicación.
 * @author Héctor Sam
 */
@WebServlet(name = "CrearAplicacionServlet", urlPatterns = {"/CrearAplicacionServlet"})
public class CrearAplicacionServlet extends HttpServlet {

    private ConexionBD conexionBD;
    private String nombre;
    private String instrucciones;
    private String idTopico;
    private ArrayList<String> idEscenarios;
    private String cantidadEscenarios;
    private String idAplicacion;
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
     * @param request La petición HTTP con el id del tópico.
     * @return True si la información fue obtenida. False en caso contrario.
     */
    public boolean obtenerInformacion(HttpServletRequest request){
        if (request != null){
            conexionBD = new ConexionBD();
            nombre =request.getParameter("nombre");
            instrucciones = request.getParameter("instrucciones");
            idTopico = request.getParameter("topicos");
            idEscenarios = new ArrayList<>();
            cantidadEscenarios = request.getParameter("cantidadEscenarios");
            return true;
        }
        return false;
        
    }
    
    /**
     * Método que permite ejecutar el query con la información perteneciente
     * a una aplicación.
     * @param request La petición HTTP con la información de la aplicación.
     * @return True si la aplicacion fue agregada. False en caso contrario.
     */
    public boolean ejecutarQuery (HttpServletRequest request){
        String nombreEscenario; 
        String descripcionEscenario;
        String imagen;
        if (request != null){
            try { 
               conexionBD.ejecutarQuery("INSERT INTO APLICACIONES "
                     + "(ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)"
                        + " VALUES (S_APLICACIONES.NEXTVAL,'"+nombre+"',"
                     + "TO_DATE(SYSDATE,'DD/MM/YYYY'),'"+instrucciones+"',"+idTopico+")");
                idAplicacion  = conexionBD.consultarRegistro("Select id from "
                        + "aplicaciones where nombre='"+nombre+"'").getString(1);
                    for (int i = 1; i < Integer.valueOf(cantidadEscenarios); i++) {
                        nombreEscenario = request.getParameter("escenario"+i);
                        descripcionEscenario = request.getParameter("descripcion"+i);
                        imagen = "NULL";
                        conexionBD.ejecutarQuery("INSERT INTO ESCENARIOS (ID,NOMBRE,"
                            + "DESCRIPCION,ID_APLICACION,IMAGEN) VALUES(S_ESCENARIOS.NEXTVAL,"
                            + "'"+nombreEscenario+"','"+descripcionEscenario+"',"+idAplicacion+","+imagen+")");
                        idEscenarios.add(conexionBD.consultarRegistro(
                                "SELECT ID FROM ESCENARIOS WHERE NOMBRE='"
                                +nombreEscenario+"'").getString(1));
                }
                    return true;
           } catch (SQLException ex) {
                    Logger.getLogger(CrearAplicacionServlet.class.getName()).
                            log(Level.SEVERE, null, ex);
                    return false;
            }
        }
        return false;
    }
    
    /**
     * Método que permite enviar la información correspondiente a los escenarios
     * de una aplicación.
     * @param request La petición HTTP que contendrá la información.
     * @param response La respuesta HTTP donde se redirigirá la información.
     * @return True si la información fue enviada. False en caso contrario.
     */
    public boolean enviarInformacion(HttpServletRequest request,
            HttpServletResponse response){
        RequestDispatcher dispatcher;
        if ((request != null) && (response != null) ){
            try {
                request.setAttribute("tipoArchivo","escenario");
                request.setAttribute("escenarios", cantidadEscenarios);
                request.setAttribute("idEscenarios",idEscenarios);

                dispatcher = request.getRequestDispatcher("/subirArchivo.jsp");
                dispatcher.forward(request, response);
                conexionBD.desconectar();
                return true;
            } catch (ServletException ex) {
                Logger.getLogger(CrearAplicacionServlet.class.getName()).
                        log(Level.SEVERE, null, ex);
                return false;
            } catch (IOException ex) {
                Logger.getLogger(CrearAplicacionServlet.class.getName()).
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
