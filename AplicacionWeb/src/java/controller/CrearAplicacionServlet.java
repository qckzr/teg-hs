/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

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
 *
 * @author hector
 */
@WebServlet(name = "CrearAplicacionServlet", urlPatterns = {"/CrearAplicacionServlet"})
public class CrearAplicacionServlet extends HttpServlet {

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
             String nombre =request.getParameter("nombre");
            String instrucciones = request.getParameter("instrucciones");
            
            String idTopico = request.getParameter("topicos");
            conexionBD.ejecutarQuery("INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)"
                    + " VALUES (S_APLICACIONES.NEXTVAL,'"+nombre+"',TO_DATE(SYSDATE,'DD/MM/YYYY'),'"+instrucciones+"',"+idTopico+")");
            String idAplicacion  = conexionBD.consultarRegistro("Select id from aplicaciones where nombre='"+nombre+"'").getString(1);
            String cantidadEscenarios = request.getParameter("cantidadEscenarios");
            for (int i = 1; i < Integer.valueOf(cantidadEscenarios); i++) {
                String nombreEscenario = request.getParameter("nombre"+i);
                String descripcion = request.getParameter("descripcion"+i);
                //String rutaImagen = request.getParameter("imagen");
                conexionBD.ejecutarQuery("INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)"
                        + "VALUES(S_ESCENARIOS.NEXTVAL,'"+nombreEscenario+"','"+descripcion+"',"+idAplicacion+",NULL)");
                
            }
            
            request.setAttribute("mensaje","Se agregó la aplicacion");     
            request.setAttribute("link","aplicaciones/aplicaciones.jsp");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/respuesta.jsp");
            dispatcher.forward(request, response);
            
        } catch (SQLException ex) {
            Logger.getLogger(CrearEjecutableServlet.class.getName()).log(Level.SEVERE, null, ex);
        
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
