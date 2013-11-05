/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.moduloGestion;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
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
 * Clase que permite obtener los nodos asociados a una aplicación particular.
 * @author Héctor Sam
 */
@WebServlet(name = "EjecutableNodoServlet", urlPatterns = {"/EjecutableNodoServlet"})
public class EjecutableNodoServlet extends HttpServlet {

    private ConexionBD conexionBD;
    private String idAplicacion;
    private ResultSet nodos;
    private ResultSet id;
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
            enviarInformacion(request, out);
        } finally {            
            out.close();
        }
    }
    
    /**
     * Método que permite obtener la información correspondiente al id de la 
     * aplicación.
     * @param request La petición HTTP con los datos del usuario.
     * @return True si la información fue obtenida. False en caso contrario.
     */
    public boolean obtenerInformacion(HttpServletRequest request){
        if (request != null) {
            
            conexionBD = new ConexionBD();
            idAplicacion = request.getParameter("idAplicacion");
            return true;
             
        }
        return false;
    }
    
    
    
    /**
     * Método que permite enviar la información correspondiente de los nodos
     * asociados a una aplicación.
     * @param request La petición HTTP que contendrá la información.
     * @param response La respuesta HTTP donde se redirigirá la información.
     * @return True si la información fue enviada. False en caso contrario.
     */
    public boolean enviarInformacion (HttpServletRequest request,
            PrintWriter out){
        
        if (request != null ){
            try {
                 nodos = conexionBD.consultar("SELECT N.ID FROM NODOS N WHERE N.ID NOT IN "
                    + "(SELECT ID_NODO FROM EJECUTABLES WHERE ID_APLICACION ="+idAplicacion+")"
                    + "ORDER BY N.ID");
            out.println("<select id=\"nodos\" name=\"nodos\">");
            if (!nodos.next()){
                
                id = conexionBD.consultar("SELECT  ID FROM NODOS");
                
                while (id.next()){
                    out.println("<option value=\""+id.getString(1)+"\">Nodo"
                            +id.getString(1) +"</option>");
                }
            
            }else{   
                do{   
                    out.println("<option value=\""+nodos.getString(1)+"\">"
                            + "Nodo"+nodos.getString(1)+"</option>");
                }   while (nodos.next());
            }
             out.println("</select>");  
            conexionBD.desconectar();
            
                return true;
             } catch (SQLException ex) {
                Logger.getLogger(EjecutableNodoServlet.class.getName()).
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
