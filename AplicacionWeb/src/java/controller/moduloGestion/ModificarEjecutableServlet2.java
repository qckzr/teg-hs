/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.moduloGestion;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
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
 * @author sam
 */
@WebServlet(name = "ModificarEjecutableServlet2", urlPatterns = {"/ModificarEjecutableServlet2"})
public class ModificarEjecutableServlet2 extends HttpServlet {

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
            String nombreEjecutable = "";
            String aplicacion="";
            String tipo = "";
            String id = "";
            String rutaEjecutable="";
            String cantidadParametros = "";
            ArrayList<String> nombreParametros = new ArrayList<>();
            ArrayList<String> valorParametros = new ArrayList<>();
            ArrayList<String> idParametros = new ArrayList<>();


            File seshdir = new File(directorio.getDirectorioEjecutables());
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
                case "tipo": tipo = diskFileItem.getString();
                                    break;
                case "aplicaciones": aplicacion = diskFileItem.getString();
                                    break;
                case "cantidadParametros": cantidadParametros = diskFileItem.getString();
                                    break;
                case "id": id = diskFileItem.getString();
                        break;
                    
              
                default:{
                    if (diskFileItem.getFieldName().contains("nombreParametro"))
                       nombreParametros.add(diskFileItem.getString());
                    else if (diskFileItem.getFieldName().contains("valorParametro"))
                        valorParametros.add(diskFileItem.getString());
                    else if (diskFileItem.getFieldName().contains("idParametro"))
                        idParametros.add(diskFileItem.getString());
                }
                       
            };
        
        }
        else{
            if (!diskFileItem.getString().isEmpty()){
                byte[] fileBytes = diskFileItem.get();
                File file = new File(seshdir, diskFileItem.getName());
                rutaEjecutable = "'"+directorio.getDirectorioEjecutables()+"/"+diskFileItem.getName()+"'";
                FileOutputStream fileOutputStream = new FileOutputStream(file);
                fileOutputStream.write(fileBytes);
                fileOutputStream.flush();
                nombreEjecutable = diskFileItem.getName();
            }
            else rutaEjecutable= "NULL";
        }
      } 
            ConexionBD conexionBD = new ConexionBD();
            ResultSet ejecutable = conexionBD.consultarRegistro("SELECT TIPO,ID_APLICACION FROM EJECUTABLES WHERE ID="+id);
            if (!ejecutable.getString(1).contentEquals(tipo))
                conexionBD.ejecutarQuery("UPDATE EJECUTABLES SET TIPO='"+tipo+"' WHERE ID="+id);
            if (!ejecutable.getString(2).contentEquals(aplicacion))
                conexionBD.ejecutarQuery("UPDATE EJECUTABLES SET ID_APLICACION="+aplicacion+" WHERE ID="+id);
            if (!rutaEjecutable.contentEquals("NULL")){
                conexionBD.ejecutarQuery("UPDATE EJECUTABLES SET RUTA_EJECUTABLE="+rutaEjecutable+" WHERE ID="+id);
                conexionBD.ejecutarQuery("UPDATE EJECUTABLES SET NOMBRE='"+nombreEjecutable+"' WHERE ID="+id);
            }
           
            for (int i = 0; i <= Integer.valueOf(cantidadParametros); i++) {
                
                ResultSet parametro = conexionBD.consultarRegistro("SELECT NOMBRE,VALOR FROM PARAMETROS WHERE ID="+idParametros.get(i));
                if (!parametro.getString(1).contentEquals(nombreParametros.get(i)))
                    conexionBD.ejecutarQuery("UPDATE PARAMETROS SET NOMBRE='"+nombreParametros.get(i)+"' WHERE ID="+idParametros.get(i));
                if (!parametro.getString(2).contentEquals(valorParametros.get(i)))
                    conexionBD.ejecutarQuery("UPDATE PARAMETROS SET VALOR='"+valorParametros.get(i)+"' WHERE ID="+idParametros.get(i));
                
                    
                
            }
            
            request.setAttribute("mensaje","Se modificó el ejecutable");     
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
