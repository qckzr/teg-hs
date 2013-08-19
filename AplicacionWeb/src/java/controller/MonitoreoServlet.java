/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
            String nombreArchivoMensajes ="archivo"+nodo+".xml";
            Document doc =  builder.build(ruta+nombreArchivoMensajes);
     //       String hora = null;
         //   out.println("<div>");
            for (Element element : doc.getRootElement().getChildren()) {
                String fecha = element.getChild("fecha").getText();
               String hora = element.getChild("hora").getText();
                String mensaje = element.getChild("texto").getText();
                SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss", Locale.ENGLISH);
//                if (hora!=null){
//                Date date1= sdf.parse(horaActual);
//                Date date2 = sdf.parse(hora);
//                long differenceInMillis = date2.getTime() - date1.getTime();
//                    if(differenceInMillis>=0)
                        out.println("<span>"+fecha+"-"+hora+"-"+mensaje+"</span></br/>");
//                }
            }
            crearArchivo(ruta, nombreArchivoMensajes);

            
          //  out.println("</div>");
            
       
        
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
          
            
          
//                Element agente = new Element("agente");
//                Document doc = new Document();
//                doc.setRootElement(agente);
//                XMLOutputter xmlOutput = new XMLOutputter();
//                xmlOutput.setFormat(Format.getPrettyFormat());
//                xmlOutput.output(doc, new FileWriter(ruta+nombreArchivo));
          
            
     
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
