/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Clase que contiene un método de eliminar el puerto de escucha de los mensajes
 * del servidor central. 
 * @author Héctor Sam
 */
@WebServlet(name = "TerminarAplicacionServlet", urlPatterns = {"/TerminarAplicacionServlet"})
public class TerminarAplicacionServlet extends HttpServlet {

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
            eliminarPuerto();

        } finally {            
            
               out.close();
         
        }
    }
    
    /**
     * Método que permite ejecutar un archivo .jar para eliminar el puerto de 
     * escucha "5000" al cambiar de aplicación de sistema distribuido.
     * @return True si se logró ejecutar .jar. False en caso
     * contrario.
     */
    public boolean eliminarPuerto(){
        String root;
        try {
            root = getServletContext().getRealPath("/");
            Process p = Runtime.getRuntime().exec("java -jar "+root.substring(0,
                    root.indexOf("build/"))+"archivos/JavaApplication1.jar");
            return true;
        } catch (Exception err) {
            err.printStackTrace();
            return false;
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
