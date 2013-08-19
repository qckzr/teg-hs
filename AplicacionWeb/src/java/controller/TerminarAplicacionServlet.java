/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Libreria.LibreriaMensajes;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sam
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
       // LibreriaMensajes libreriaMensajes = new LibreriaMensajes(5001);
       
        try {
            /*
             * TODO output your page here. You may use following sample code.
             */
            eliminarPuerto();
     //       libreriaMensajes.getHiloDeEscucha().kill();
            //libreriaMensajes.enviarMensaje("eliminarTodos_", "localhost");
             
         //   libreriaMensajes.enviarMensaje("~_Eliminar","localhost",5000); 
            
        } finally {            
            
         //       libreriaMensajes.getHiloDeEscucha().kill();
           //    LibreriaMensajes.getHiloDeEscucha().kill();
               out.close();
         
        }
    }
    
    public void eliminarPuerto(){
        try {
            String root = getServletContext().getRealPath("/");
            
            Process p = Runtime.getRuntime().exec("java -jar "+root.substring(0,
                    root.indexOf("build/"))+"archivos/JavaApplication1.jar");
            
            
        } catch (Exception err) {
            err.printStackTrace();
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
