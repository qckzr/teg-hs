/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.moduloMonitoreo;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Locale;
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
 *
 * @author sam
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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /*
             * TODO output your page here. You may use following sample code.
             */
            String nodo = request.getParameter("nodo");
            SAXBuilder builder = new SAXBuilder();
            String root = getServletContext().getRealPath("/");
            String ruta =root.substring(0, root.indexOf("build/"))+"archivos/";
            String tipo = request.getParameter("tipo");
            if (tipo.contentEquals("1")){
                String nombreArchivoMensajes ="archivo"+nodo+".xml";
                Document doc =  builder.build(ruta+nombreArchivoMensajes);
                if (doc.getRootElement().getChildren().size()>0){
                for (Element element : doc.getRootElement().getChildren()) {
                    String fecha = element.getChild("fecha").getText();
                String hora = element.getChild("hora").getText();
                    String mensaje = element.getChild("texto").getText();
                    SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss", Locale.ENGLISH);

                            out.println("<p>"+fecha+"-"+hora+"-"+mensaje+"</p>");

                }
              
                crearArchivo(ruta, nombreArchivoMensajes);
                }
            }
            else{
                String nombreArchivoAgentes ="agente"+nodo+".xml";
                Document doc =  builder.build(ruta+nombreArchivoAgentes);
                for (Element element : doc.getRootElement().getChildren()) {
                      String aplicacionActiva = element.getChild("aplicacionActiva").getText();
                      String direccionIp = element.getChild("direccionIp").getText();
                      String idProceso = element.getChild("idProceso").getText();
                      String memoriaDisponible = element.getChild("memoriaDisponible").getText();
                      String numeroNodo = element.getChild("numeroNodo").getText();
                      String procesosActivos = element.getChild("procesosActivos").getText();
                      String puertosDisponibles = element.getChild("puertosDisponibles").getText();
                      String usoCpu = element.getChild("usoCpu").getText();
                      out.println("<input type=\"hidden\" class=\"aplicacionActiva\" value=\""+aplicacionActiva+"\" />");
                      out.println("<input type=\"hidden\" class=\"direccionIp\" value=\""+direccionIp+"\" />");
                      out.println("<input type=\"hidden\" class=\"idProceso\" value=\""+idProceso+"\" />");
                      out.println("<input type=\"hidden\" class=\"memoriaDisponible\" value=\""+memoriaDisponible+"\" />");
                      out.println("<input type=\"hidden\" class=\"numeroNodo\" value=\""+numeroNodo+"\" />");
                      out.println("<input type=\"hidden\" class=\"procesosActivos\" value=\""+procesosActivos+"\" />");
                      out.println("<input type=\"hidden\" class=\"puertosDisponibles\" value=\""+puertosDisponibles+"\" />");
                      out.println("<input type=\"hidden\" class=\"usoCpu\" value=\""+usoCpu+"\" />");

                }
                
            }

                  
        
        } catch (JDOMException ex) {
            Logger.getLogger(MonitoreoServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally {            
            out.close();
        }
    }
    
    public void crearArchivo(String ruta,String nombreArchivo){
        try {
          
                Element mensajes = new Element("mensajes");
                Document doc = new Document();
                doc.setRootElement(mensajes);
                XMLOutputter xmlOutput = new XMLOutputter();
                xmlOutput.setFormat(Format.getPrettyFormat());
                xmlOutput.output(doc, new FileWriter(ruta+nombreArchivo));
     
        } catch (IOException ex) {
            Logger.getLogger(Archivo.class.getName()).log(Level.SEVERE, null, ex);
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
