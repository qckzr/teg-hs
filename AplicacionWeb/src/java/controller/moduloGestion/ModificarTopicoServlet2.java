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
@WebServlet(name = "ModificarTopicoServlet2", urlPatterns = {"/ModificarTopicoServlet2"})
public class ModificarTopicoServlet2 extends HttpServlet {

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
            String id = "";
            String imagen = "";
            String nombre = "";
            String categoria = "";
            String descripcion = "";
            String idUsuario = "";
           


            File seshdir = new File(directorio.getDirectorioImagenesTopico());
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
                case "categoriaFinal": categoria = diskFileItem.getString();
                                    break;
                case "descripcion": descripcion = diskFileItem.getString();
                                    break;
                case "id": id = diskFileItem.getString();
                        break;
                case "usuarios": idUsuario = diskFileItem.getString();
                        break;         
                       
            };
        
        }
        else{
            if (!diskFileItem.getString().isEmpty()){
                byte[] fileBytes = diskFileItem.get();
                File file = new File(seshdir, diskFileItem.getName());
                imagen = "'"+directorio.getDirectorioImagenesTopico()+"/"+diskFileItem.getName()+"'";
                FileOutputStream fileOutputStream = new FileOutputStream(file);
                fileOutputStream.write(fileBytes);
                fileOutputStream.flush();
            
            }
            else imagen= "NULL";
        }
      } 
            ConexionBD conexion = new ConexionBD();
           
            ResultSet rs = conexion.consultarRegistro("SELECT * FROM TOPICOS WHERE ID="+id);
            
            if (!rs.getString(2).contentEquals(nombre))
                conexion.ejecutarQuery("UPDATE TOPICOS SET NOMBRE='"+nombre+"' WHERE ID="+id);
            if (!rs.getString(3).contentEquals("categoria"))
                conexion.ejecutarQuery("UPDATE TOPICOS SET CATEGORIA='"+categoria+"' WHERE ID="+id);
            if (!rs.getString(4).contentEquals(descripcion))
                    conexion.ejecutarQuery("UPDATE TOPICOS SET DESCRIPCION='"+descripcion+"' WHERE ID="+id);
            if (!rs.getString(5).contentEquals(idUsuario))
                    conexion.ejecutarQuery("UPDATE TOPICOS SET ID_USUARIO="+idUsuario+" WHERE ID="+id);
            if (!imagen.contentEquals("NULL"))
                    conexion.ejecutarQuery("UPDATE TOPICOS SET RUTA_IMAGEN="+imagen+" WHERE ID="+id);
            
            request.setAttribute("mensaje","Topico Modificado");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/respuesta.jsp");
            dispatcher.forward(request, response);    
            
        } catch (SQLException ex) {
            Logger.getLogger(ModificarTopicoServlet2.class.getName()).log(Level.SEVERE, null, ex);
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
