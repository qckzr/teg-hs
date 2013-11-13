package controller.moduloGestion;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
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
 * Clase que permite agregar un evento a la base de datos a través del módulo
 * de Gestión.
 * @author Héctor Sam
 */
@WebServlet(name = "CrearEventoServlet", urlPatterns = {"/CrearEventoServlet"})
public class CrearEventoServlet extends HttpServlet {

    private String nombre;
    private String path;
    
    private ConexionBD conexion;
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
     * Método que permite obtener la información correspondiente a un evento.
     * @param request La petición HTTP con los datos del evento.
     * @return True si la información fue obtenida. False en caso contrario.
     */
    public boolean obtenerInformacion(HttpServletRequest request){
        if (request != null) {
            
            nombre = request.getParameter("nombre");
            path = request.getParameter("path");
            conexion = new ConexionBD();
            return true;
             
        }
        return false;
    }
    
    /**
     * Método que permite ejecutar el query con la información perteneciente
     * a un evento.
     * @param request La petición HTTP con la información del evento.
     * @return True si el evento fue agregado. False en caso contrario.
     */
    public boolean ejecutarQuery(HttpServletRequest request){
        boolean valor;
        if (request != null) {
            valor = conexion.ejecutarQuery("INSERT INTO EVENTOS (ID,NOMBRE,"
                    + "PATHSCRIPT) VALUES(S_EVENTOS.NEXTVAL,"
                    + "'"+nombre+"','"+path+"')");
            if (valor == true){ 
                    request.setAttribute("mensaje","Se agregó un evento a la bd.");
            } else{
                request.setAttribute("mensaje","NO SE PUDO!");
            }
        }
        return false;
    }
    
    
    /**
     * Método que permite enviar la información correspondiente indicando que el
     * evento se agregó.
     * @param request La petición HTTP que contendrá la información.
     * @param response La respuesta HTTP donde se redirigirá la información.
     * @return True si la información fue enviada. False en caso contrario.
     */
    public boolean enviarInformacion (HttpServletRequest request,
            HttpServletResponse response){
        RequestDispatcher dispatcher; 
        if ((request != null) && (response != null) ){
            try {
                 dispatcher = request.getRequestDispatcher("/respuesta.jsp");
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
