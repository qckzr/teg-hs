/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.moduloMonitoreo;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Archivo;
import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

/**
 * Clase que permite controlar el módulo de monitoreo leyendo el contenido
 * de los archivos XML para enviar la información hacia la pantalla.
 * @author Héctor Sam
 */
@WebServlet(name = "MonitoreoServlet", urlPatterns = {"/MonitoreoServlet"})
public class MonitoreoServlet extends HttpServlet {

    
    
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
    protected void processRequest(HttpServletRequest request, 
            HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String nodo;
        String root;
        String ruta;
        String tipo;
        try {
            /*
             * TODO output your page here. You may use following sample code.
             */
            nodo = request.getParameter("nodo");
            root = getServletContext().getRealPath("/");
            ruta =root.substring(0, root.indexOf("build/"))+"archivos/";
            tipo = request.getParameter("tipo");
            if (tipo.contentEquals("1")){
                    mensajesMonitoreo(response,out, ruta, nodo);
            } else{
                mensajesAgente(response,out,ruta, nodo);         
                
            }

                  
        
        
        } finally {            
            out.close();
        }
    }
    
    /**
     * Método que permite visualizar por pantalla los mensajes enviados hacia
     * los nodos.
     * @param response La peticion HTTP
     * @param ruta La ruta del archivo con el mensaje del nodo.
     * @param nodo El nodo que contiene el mensaje a visualizar.
     * @return True si el mensaje fue enviado. False en caso contrario.
     */
    public boolean mensajesMonitoreo(HttpServletResponse response, 
            PrintWriter out,String ruta, String nodo){
        SAXBuilder builder;
        String nombreArchivoMensajes;
        Document doc;
        if (response != null){
        try {
            builder = new SAXBuilder();
            out = response.getWriter();
            nombreArchivoMensajes ="archivo"+nodo+".xml";
            doc =  builder.build(ruta+nombreArchivoMensajes);
            if (doc.getRootElement().getChildren().size() > 0){
                for (Element element : doc.getRootElement().getChildren()) {
                    String fecha = element.getChild("fecha").getText();
                    String hora = element.getChild("hora").getText();
                    String mensaje = element.getChild("texto").getText();
                    
                    out.println("<p>"+fecha+"-"+hora+"-"+mensaje+"</p>");
                    
                }
              
                crearArchivo(ruta, nombreArchivoMensajes);
            }
            return true;
        } catch (JDOMException ex) {
            Logger.getLogger(MonitoreoServlet.class.getName()).
                    log(Level.SEVERE, null, ex);
            return false;
        } catch (IOException ex) {
            Logger.getLogger(MonitoreoServlet.class.getName()).
                    log(Level.SEVERE, null, ex);
            return false;
        }
        }
        return false;
    }
    
    /**
     * Método que permite enviar el mensaje del agente recibido a la pantalla
     * para ser visualizado por el usuario.
     * @param response La petición HTTP que solicita el usuario para visualizar
     * el mensaje del agente.
     * @param ruta La ruta donde se encuentra el archivo.
     * @param nodo El nodo que contiene el mensaje del agente a visualizar.
     * @return True si el mensaje fue enviado a la pantalla. False en caso
     * contrario.
     */
    public boolean mensajesAgente(HttpServletResponse response,PrintWriter out,
            String ruta, String nodo){
        
        SAXBuilder builder;
        String nombreArchivoAgentes;
        Document doc;
        String aplicacionActiva;
        String direccionIp;
        String idProceso;
        String memoriaDisponible;
        String numeroNodo;
        String procesosActivos;
        String puertosDisponibles;
        String usoCpu;
        try {   
             builder = new SAXBuilder();
             nombreArchivoAgentes = "agente"+nodo+".xml";
             doc =  builder.build(ruta+nombreArchivoAgentes);
             out = response.getWriter();
             for (Element element : doc.getRootElement().getChildren()) {
                aplicacionActiva = element.getChild("aplicacionActiva").getText();
                direccionIp = element.getChild("direccionIp").getText();
                idProceso = element.getChild("idProceso").getText();
                memoriaDisponible = element.getChild("memoriaDisponible").getText();
                numeroNodo = element.getChild("numeroNodo").getText();
                procesosActivos = element.getChild("procesosActivos").getText();
                puertosDisponibles = element.getChild("puertosDisponibles").getText();
                usoCpu = element.getChild("usoCpu").getText();
                out.println("<input type=\"hidden\" "
                        + "class=\"aplicacionActiva\" value=\""
                        +aplicacionActiva+"\" />");
                out.println("<input type=\"hidden\" "
                        + "class=\"direccionIp\" value=\""
                        +direccionIp+"\" />");
                out.println("<input type=\"hidden\" "
                        + "class=\"idProceso\" value=\""
                        +idProceso+"\" />");
                out.println("<input type=\"hidden\" "
                        + "class=\"memoriaDisponible\" value=\""
                        +memoriaDisponible+"\" />");
                out.println("<input type=\"hidden\" "
                        + "class=\"numeroNodo\" value=\""
                        +numeroNodo+"\" />");
                out.println("<input type=\"hidden\" "
                        + "class=\"procesosActivos\" value=\""
                        +procesosActivos+"\" />");
                out.println("<input type=\"hidden\" "
                        + "class=\"puertosDisponibles\" value=\""
                        +puertosDisponibles+"\" />");
                out.println("<input type=\"hidden\" "
                        + "class=\"usoCpu\" value=\""
                        +usoCpu+"\" />");
            }
            return true;
        } catch (JDOMException ex) {
            Logger.getLogger(MonitoreoServlet.class.getName()).
                    log(Level.SEVERE, null, ex);
            return false;
        } catch (IOException ex) {
            Logger.getLogger(MonitoreoServlet.class.getName()).
                    log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    /**
     * Método que permite crear un archivo XML para la recepción de mensajes.
     * @param ruta La ruta donde se ubicará archivo
     * @param nombreArchivo El nombre del archivo a crear.
     * @return True si el archivo fue creado con éxito. False en caso contrario
     */
    public boolean crearArchivo(String ruta,String nombreArchivo){
        Element mensajes;
        Document doc;
        XMLOutputter xmlOutput;
        try {
                mensajes = new Element("mensajes");
                doc = new Document();
                doc.setRootElement(mensajes);
                xmlOutput = new XMLOutputter();
                xmlOutput.setFormat(Format.getPrettyFormat());
                xmlOutput.output(doc, new FileWriter(ruta+nombreArchivo));
                return true;
        } catch (IOException ex) {
            Logger.getLogger(Archivo.class.getName()).
                    log(Level.SEVERE, null, ex);
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
