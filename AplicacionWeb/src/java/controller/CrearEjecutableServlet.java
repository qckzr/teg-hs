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
import model.Directorios;

/**
 *
 * @author hector
 */
@WebServlet(name = "CrearEjecutableServlet", urlPatterns = {"/CrearEjecutableServlet"})
public class CrearEjecutableServlet extends HttpServlet {

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
          
            String nombreEjecutable = "";
            String tipo = request.getParameter("tipoEjecutable");
            String idAplicacion = request.getParameter("aplicacion");
            String cantidadParametros = request.getParameter("cantidadParametros");
            String idNodo = request.getParameter("nodos");
            ConexionBD conexion = new ConexionBD();
            nombreEjecutable = conexion.consultarRegistro("select to_char(sysdate,'DD/MM/YYYY HH24:MI:SS') from dual").getString(1);
            String rutaEjecutable = "";
            conexion.ejecutarQuery("INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)"
                    + " VALUES (S_EJECUTABLES.NEXTVAL,'"+nombreEjecutable+"','"+tipo+"','"+nombreEjecutable+"',"+idAplicacion+","+idNodo+")");
            String idEjecutable  = conexion.consultarRegistro("Select id from ejecutables where nombre='"+nombreEjecutable+"'").getString(1);
            for (int i = 1; i <  Integer.valueOf(cantidadParametros); i++) {
                String nombreParametro = request.getParameter("nombreParametro"+i);
                String valorParametro = request.getParameter("parametro"+i);
                conexion.ejecutarQuery("INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)"
                        + "VALUES(S_EJECUTABLES.NEXTVAL,'"+nombreParametro +"','"+valorParametro+"',"+idEjecutable+")");
            }
            
            request.setAttribute("tipoArchivo", "ejecutable");
            request.setAttribute("ejecutables",1);
            request.setAttribute("ejecutable", idEjecutable);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/subirArchivo.jsp");
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
