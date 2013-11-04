/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.moduloMonitoreo;

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

/**
 * Clase que permite obtener la información de los mensajes del agente para
 * visualizarlos en pantalla.
 * @author Héctor Sam
 */
@WebServlet(name = "InformacionAgenteServlet", urlPatterns = {"/InformacionAgenteServlet"})
public class InformacionAgenteServlet extends HttpServlet {

    private String aplicacionActiva;
    private String direccionIp;
    private String idProceso;
    private String memoriaDisponible;
    private String numeroNodo;
    private String procesosActivos;
    private String puertosDisponibles;
    private String usoCpu;
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
           
            obtenerParametros(request);
            enviarInformacion(request, response);
            
            
        } finally {            
            out.close();
        }
    }
    
    
    /**
     * Método que permite obtener los parametros desde la peticion http.
     * @param request La petición http de donde se obtendrán los parámetros.
     * @return True si se obtuvo los parámetros solicitados. False en caso
     * contrario.
     */
    public boolean obtenerParametros(HttpServletRequest request){
        if (request != null){
            aplicacionActiva = request.getParameter("aplicacionActiva");
            direccionIp = request.getParameter("direccionIp");
            idProceso = request.getParameter("idProceso");
            memoriaDisponible = request.getParameter("memoriaDisponible");
            numeroNodo = request.getParameter("numeroNodo");
            procesosActivos = request.getParameter("procesosActivos");
            puertosDisponibles = request.getParameter("puertosDisponibles");
            usoCpu = request.getParameter("usoCpu");
            return true;
        } else {
            return false;
        }
    }
    
    /**
     * Método que permite enviar la informacion hacia una página específica.
     * @param request La peticion HTTP
     * @param response La respuesta donde se enviará la información.
     * @return True si se envió la información. False en caso contrario.
     */
    public boolean enviarInformacion(HttpServletRequest request,
            HttpServletResponse response){
        RequestDispatcher dispatcher;
        if (request != null){
            try {
            
                request.setAttribute("aplicacionActiva",aplicacionActiva);
                request.setAttribute("direccionIp",direccionIp);
                request.setAttribute("idProceso",idProceso);
                request.setAttribute("memoriaDisponible",memoriaDisponible);
                request.setAttribute("numeroNodo",numeroNodo);
                request.setAttribute("procesosActivos",procesosActivos);
                request.setAttribute("puertosDisponibles",puertosDisponibles);
                request.setAttribute("usoCpu",usoCpu);
                dispatcher = request.getRequestDispatcher("/informacionAgente.jsp");
                dispatcher.forward(request, response);
                return true;
            } catch (ServletException ex) {
                Logger.getLogger(InformacionAgenteServlet.class.getName()).
                    log(Level.SEVERE, null, ex);
                return false;
            } catch (IOException ex) {
                Logger.getLogger(InformacionAgenteServlet.class.getName()).
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
