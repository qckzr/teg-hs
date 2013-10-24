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
 *
 * @author hector
 */
@WebServlet(name = "CrearTopicoServlet", urlPatterns = {"/CrearTopicoServlet"})
public class CrearTopicoServlet extends HttpServlet {

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
            
    
            String imagen = "NULL";
            String nombre  = request.getParameter("nombre");
            String categoria = request.getParameter("categoria");
            String descripcion = request.getParameter("descripcion");
          //String imagen = request.getParameter("imagen");
            ConexionBD conexion = new ConexionBD();
            if (conexion.ejecutarQuery("INSERT INTO TOPICOS (ID,NOMBRE,CATEGORIA,DESCRIPCION,ID_USUARIO,RUTA_IMAGEN) VALUES (S_TOPICOS.NEXTVAL,'"+nombre+"','"+categoria+"','"+descripcion+"',1,"+imagen+")")){
                request.setAttribute("mensaje","Se agregó un topico a la bd.");
            }
            else{
                request.setAttribute("mensaje","No se pudo agregar el topico");
            }
            String imagen1 = request.getParameter("imagen");
            if (imagen1.contentEquals("false")){
                RequestDispatcher dispatcher = request.getRequestDispatcher("/respuesta.jsp");
                dispatcher.forward(request, response);
            }
            else {
                String idTopico = conexion.consultarRegistro("SELECT ID FROM TOPICOS WHERE NOMBRE='"+nombre+"'").getString(1);
                request.setAttribute("topico",idTopico);
                request.setAttribute("tipoArchivo","topico");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/subirArchivo.jsp");
                dispatcher.forward(request, response);
            }
           
        } catch (SQLException ex) {
            Logger.getLogger(CrearTopicoServlet.class.getName()).log(Level.SEVERE, null, ex);
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
