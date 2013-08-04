/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author hector
 */
@WebServlet(name = "CrearAplicacionServlet", urlPatterns = {"/CrearAplicacionServlet"})
public class CrearAplicacionServlet extends HttpServlet {

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
            Directorios directorio = new Directorios();
            String nombre ="";
            String instrucciones = "";
            String idTopico = "";
            String cantidadEscenarios = "";
            ArrayList<String> nombreEscenarios = new ArrayList<>();
            ArrayList<String> descripcionEscenarios = new ArrayList<>();
            ArrayList<String> imagenes = new ArrayList<>();

            File seshdir = new File(directorio.getDirectorioImagenesEscenarios());
            if (!seshdir.exists()) {
            seshdir.mkdirs();
            }
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            List<FileItem> items = null;
            try {
                items = upload.parseRequest(request);
            } catch (FileUploadException ex) {
                Logger.getLogger(CrearEjecutableServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
 
      for (FileItem diskFileItem : items) {

        if (diskFileItem.isFormField()) {
            switch (diskFileItem.getFieldName()){
                case "nombre": nombre = diskFileItem.getString();
                                    break;
                case "instrucciones": instrucciones = diskFileItem.getString();
                                break;
                case "topicos": idTopico = diskFileItem.getString();
                    break;
                case "cantidadEscenarios": cantidadEscenarios = diskFileItem.getString();
                    break;
                default:{
                    if (diskFileItem.getFieldName().contains("escenario"))
                       nombreEscenarios.add(diskFileItem.getString());
                    else if (diskFileItem.getFieldName().contains("descripcion"))
                        descripcionEscenarios.add(diskFileItem.getString());
                }
                       
            };
        
        }
        else{
            if (!diskFileItem.getString().isEmpty()){
            byte[] fileBytes = diskFileItem.get();
            File file = new File(seshdir, diskFileItem.getName());
            imagenes.add("'"+directorio.getDirectorioImagenesTopico()+"/"+diskFileItem.getName()+"'");
            FileOutputStream fileOutputStream = new FileOutputStream(file);
            fileOutputStream.write(fileBytes);
            fileOutputStream.flush();
            }
            else imagenes.add("NULL");
        }
      } 
            ConexionBD conexionBD = new ConexionBD();
            conexionBD.ejecutarQuery("INSERT INTO APLICACIONES (ID,NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO)"
                    + " VALUES (S_APLICACIONES.NEXTVAL,'"+nombre+"',TO_DATE(SYSDATE,'DD/MM/YYYY'),'"+instrucciones+"',"+idTopico+")");
            String idAplicacion  = conexionBD.consultarRegistro("Select id from aplicaciones where nombre='"+nombre+"'").getString(1);
            for (int i = 0; i < Integer.valueOf(cantidadEscenarios)-1; i++) {
                conexionBD.ejecutarQuery("INSERT INTO ESCENARIOS (ID,NOMBRE,DESCRIPCION,ID_APLICACION,IMAGEN)"
                        + "VALUES(S_ESCENARIOS.NEXTVAL,'"+nombreEscenarios.get(i) +"','"+descripcionEscenarios.get(i) +"',"+idAplicacion+","+imagenes.get(i) +")");
                
            }
            
            request.setAttribute("mensaje","Se agregó la aplicacion");     
            request.setAttribute("link","aplicaciones/aplicaciones.jsp");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/respuesta.jsp");
            dispatcher.forward(request, response);
            
        } catch (SQLException ex) {
            Logger.getLogger(CrearEjecutableServlet.class.getName()).log(Level.SEVERE, null, ex);
        
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
