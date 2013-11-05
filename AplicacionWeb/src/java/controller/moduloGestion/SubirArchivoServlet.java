/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.moduloGestion;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
 * Clase que permite cargar un archivo en el servidor.
 * @author Héctor Sam
 */
@WebServlet(name = "SubirArchivoServlet", urlPatterns = {"/SubirArchivoServlet"})
public class SubirArchivoServlet extends HttpServlet {

    private Directorios directorio = new Directorios();
    private String tipoArchivo = "";
    private String id = "";
    private ArrayList<String> ids = new ArrayList<String>();
    private String ruta = "NULL";
    private String nombre;   
    private String mensaje = "";
           
    ConexionBD conexionBD = new ConexionBD();
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
//        String mensaje="";
        try {
            /*
             * TODO output your page here. You may use following sample code.
             */
                obtenerInformacion(request);
                ejecutarQuery(request);
        } finally {   
            
            out.println("<h1>"+mensaje+" Cargado</h1>");
            out.println("<script>function closeWin() { window.close(); }</script>");
            out.println("<input type=\"button\" value=\"Cerrar\" onclick=\"closeWin()\"/>");
            out.close();
            
        }
        
    }
    
    
    /**
     * Método que permite obtener la información correspondiente a al archivo
     * cargado por parte del usuario
     * @param request La petición HTTP con el id del usuario.
     * @return True si la información fue obtenida. False en caso contrario.
     */
    public boolean obtenerInformacion(HttpServletRequest request){
        FileItemFactory factory;
        ServletFileUpload upload;
        List<FileItem> items = null;
        byte[] fileBytes;
        File seshdir;
        File file;
        FileOutputStream fileOutputStream;
        if (request != null) {
            
            factory = new DiskFileItemFactory();
            upload = new ServletFileUpload(factory);
            try {
                items = upload.parseRequest(request);
            } catch (FileUploadException ex) {
                Logger.getLogger(CrearEjecutableServlet.class.getName()).
                        log(Level.SEVERE, null, ex);
            }
 
            for (FileItem diskFileItem : items) {

                if (diskFileItem.isFormField()) {
                    switch (diskFileItem.getFieldName()){
                        case "tipoArchivo": 
                            tipoArchivo = diskFileItem.getString();
                        break;
                        case "idTopico": 
                            id = diskFileItem.getString();
                        break;
                        case "idEjecutable": 
                            id = diskFileItem.getString();
                        break;
                        default:{
                            if (diskFileItem.getFieldName().contains("idEscenarios")){ 
                                ids.add(diskFileItem.getString());
                            }
                        }


                    };
        
                } else{
                        if (!diskFileItem.getString().isEmpty()){
                            try {
                                fileBytes = diskFileItem.get();
                                if (tipoArchivo.contentEquals("topico")){
                                    seshdir = new File(
                                            directorio.getDirectorioImagenesTopico());
                                    ruta = "'"+directorio.
                                            getDirectorioImagenesTopico()+"/"+diskFileItem.getName()+"'";
                                    mensaje = "Imagen";
                                }
                                    else if (tipoArchivo.contentEquals("ejecutable")){
                                        seshdir = new File(directorio.
                                                getDirectorioEjecutables());
                                        ruta = "'"+directorio.
                                                getDirectorioEjecutables()+"'";
                                        mensaje = "Ejecutable";
                        
                                }
                                else {
                                        seshdir = new File(
                                                directorio.getDirectorioImagenesEscenarios());
                                        mensaje = "Escenario";
                                        ruta = "'"+directorio.
                                                getDirectorioImagenesEscenarios()
                                                +"/"+diskFileItem.getName()+"'";
                                }
                            if (!seshdir.exists()) {
                                seshdir.mkdirs();
                            }
                            file = new File(seshdir, diskFileItem.getName());
                            nombre = diskFileItem.getName();
                            fileOutputStream = new FileOutputStream(file);
                            fileOutputStream.write(fileBytes);
                            fileOutputStream.flush();
                            } catch (IOException ex) {
                                Logger.getLogger(SubirArchivoServlet.class.getName()).
                                    log(Level.SEVERE, null, ex);
                            }
             
                        }
       
                    }
        }
      return true;
        }
        return  false;
    }
    /**
     * Método que permite ejecutar el query con la información perteneciente
     * a ruta a actualizar.
     * @param request La petición HTTP con la información de la ruta y el tipo de archivo.
     * @return True si la información fue obtenida. False en caso contrario.
     */
    public boolean ejecutarQuery(HttpServletRequest request){
        
        if (request != null) {
            switch (tipoArchivo){
                case "topico": 
                    conexionBD.ejecutarQuery("UPDATE TOPICOS "
                            + "SET RUTA_IMAGEN="+ruta+" WHERE ID="+id);
                    break;
                case "ejecutable": 
                    conexionBD.ejecutarQuery("UPDATE EJECUTABLES "
                            + "SET RUTA_EJECUTABLE="+ruta+",NOMBRE='"+nombre+"' "
                            + "WHERE ID="+id);
                    break;
                case "escenario": conexionBD.ejecutarQuery("UPDATE ESCENARIOS "
                        + "SET IMAGEN="+ruta+" WHERE ID="+ids.get(0));
                    ids.remove(0);
                    break;
                    
            }
            ;
            return true;
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
