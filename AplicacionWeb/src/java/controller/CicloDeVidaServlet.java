/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Libreria.LibreriaMensajes;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ConexionBD;

/**
 *
 * @author sam
 */
@WebServlet(name = "CicloDeVidaServlet", urlPatterns = {"/CicloDeVidaServlet"})
public class CicloDeVidaServlet extends HttpServlet {
    
   private static final String ipServidorCentral ="localhost";

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
        LibreriaMensajes libreriaMensajes = new LibreriaMensajes(9999);
        try {
            /*
             * TODO output your page here. You may use following sample code.
             */
            
            String instruccion = request.getParameter("instruccion");
            if (instruccion.contentEquals("eliminarTodo"))
                libreriaMensajes.enviarMensaje("eliminarTodos_",ipServidorCentral);
                
            
            else{
                String idEjecutable = request.getParameter("idEjecutable");
            
                ConexionBD conexionBD = new ConexionBD();
           
                switch (instruccion){
                    case "detener":  {
                        ResultSet rs = conexionBD.consultarRegistro("SELECT E.NOMBRE,"
                        + " N.IP FROM NODOS N,EJECUTABLES E WHERE N.ID=E.ID_NODO AND E.ID="+idEjecutable);
                        libreriaMensajes.enviarMensaje("eliminar_"+rs.getString(1)+":"+rs.getString(2),ipServidorCentral);
                        break;
                    }
                    case "enviar":  {
                        String mensaje = request.getParameter("mensaje");
                        ResultSet rs = conexionBD.consultarRegistro("SELECT "
                        + " N.IP FROM NODOS N,EJECUTABLES E WHERE N.ID=E.ID_NODO AND E.ID="+idEjecutable);
                        libreriaMensajes.enviarMensaje("mensajeNodo_"+mensaje+":"+rs.getString(2),ipServidorCentral);
                        break;
                    }
                    case "iniciar":{
                        ResultSet rs = conexionBD.consultarRegistro("SELECT E.NOMBRE,"
                        + " N.IP FROM NODOS N,EJECUTABLES E WHERE N.ID=E.ID_NODO AND E.ID="+idEjecutable);
                        libreriaMensajes.enviarMensaje("ejecutar_"+rs.getString(1)+":"+rs.getString(2),ipServidorCentral);
                        break;
                    }
                };
            }
            
        } catch (SQLException ex) {

        } finally {            
            libreriaMensajes.getHiloDeEscucha().kill();
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
