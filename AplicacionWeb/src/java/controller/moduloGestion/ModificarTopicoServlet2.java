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
import model.Directorios;

/**
 * Clase que permite modificar un tópico de la base de datos a través del
 * módulo de gestión.
 * @author Héctor Sam
 */
@WebServlet(name = "ModificarTopicoServlet2", urlPatterns = {"/ModificarTopicoServlet2"})
public class ModificarTopicoServlet2 extends HttpServlet {

    private ConexionBD conexion;
//    private Directorios directorio = new Directorios();
    private String id = "";
    private String imagen = "";
    private String nombre = "";
    private String categoria = "";
    private String descripcion = "";
    private String idUsuario = "";
    private ResultSet rs;
    
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
     * Método que permite obtener la información correspondiente a un tópico.
     * @param request La petición HTTP con los datos del tópico.
     * @return True si la información fue obtenida. False en caso contrario.
     */
    public boolean obtenerInformacion(HttpServletRequest request){
//        File seshdir;
//        FileItemFactory factory;
//        ServletFileUpload upload;
//        List<FileItem> items = null;
//        FileOutputStream fileOutputStream = null;
//        byte[] fileBytes;
//        File file;
        if (request != null) {
//            seshdir = new File(directorio.getDirectorioImagenesTopico());
//            if (!seshdir.exists()) {
//                seshdir.mkdirs();
//            }
//            factory = new DiskFileItemFactory();
//            upload = new ServletFileUpload(factory);
//            try {
//                items = upload.parseRequest(request);
//            } catch (FileUploadException ex) {
//                Logger.getLogger(CrearEjecutableServlet.class.getName()).
//                        log(Level.SEVERE, null, ex);
//            }
 
            //for (FileItem diskFileItem : items) {

                //if (diskFileItem.isFormField()) {
                    //switch (diskFileItem.getFieldName()){
                        //case "nombre": 
                            nombre = request.getParameter("nombre");
                          //  break;
                        //case "categoriaFinal": 
                            categoria = request.getParameter("categoriaFinal");
                          //  break;
                        //case "descripcion": 
                            descripcion = request.getParameter("descripcion");
                          //  break;
                        //case "id": 
                            id = request.getParameter("id");
                          //  break;
                        //case "usuarios": 
                            idUsuario = request.getParameter("usuarios");
//                            break;            
//                    };
//        
//                } else{
//                    if (!diskFileItem.getString().isEmpty()){
//                        try {
//                            fileBytes = diskFileItem.get();
//                            file = new File(seshdir, diskFileItem.getName());
//                            imagen = "'"+directorio.getDirectorioImagenesTopico()
//                                    +"/"+diskFileItem.getName()+"'";
//                            fileOutputStream = new FileOutputStream(file);
//                            fileOutputStream.write(fileBytes);
//                            fileOutputStream.flush();
//                        } catch (FileNotFoundException ex) {
//                            Logger.getLogger(ModificarTopicoServlet2.class.
//                                    getName()).log(Level.SEVERE, null, ex);
//                        } catch (IOException ex) {
//                            Logger.getLogger(ModificarTopicoServlet2.class.
//                                    getName()).log(Level.SEVERE, null, ex);
//                        }
//            
//                    } else {
//                            imagen= "NULL";
//                    }
//                }
//            } 
            
      
        return true;
        }
        return false;
    }
    
    /**
     * Método que permite ejecutar el query con la información perteneciente
     * a un tópico.
     * @param request La petición HTTP con la información del tópico.
     * @return True si la información fue obtenida. False en caso contrario.
     */
    public boolean ejecutarQuery(HttpServletRequest request){
        if (request != null) {
            try {
                conexion = new ConexionBD();
           
                rs = conexion.consultarRegistro("SELECT * FROM TOPICOS WHERE ID="+id);
            
                if (!rs.getString(2).contentEquals(nombre)) {
                    conexion.ejecutarQuery("UPDATE TOPICOS "
                            + "SET NOMBRE='"+nombre+"' WHERE ID="+id);
                }
                if (!rs.getString(3).contentEquals("categoria")) {
                    conexion.ejecutarQuery("UPDATE TOPICOS "
                            + "SET CATEGORIA='"+categoria+"' WHERE ID="+id);
                }
                if (!rs.getString(4).contentEquals(descripcion)) {
                        conexion.ejecutarQuery("UPDATE TOPICOS "
                                + "SET DESCRIPCION='"+descripcion+"' WHERE ID="+id);
                }
                if (!rs.getString(5).contentEquals(idUsuario)) {
                        conexion.ejecutarQuery("UPDATE TOPICOS "
                                + "SET ID_USUARIO="+idUsuario+" WHERE ID="+id);
                }
                if (!imagen.contentEquals("NULL")) {
                        conexion.ejecutarQuery("UPDATE TOPICOS "
                                + "SET RUTA_IMAGEN="+imagen+" WHERE ID="+id);
                }
                    return true;
            } catch (SQLException ex) {
                    Logger.getLogger(ModificarAplicacionServlet1.class.getName()).
                            log(Level.SEVERE, null, ex);
                    return false;
            }
           
        }
        return false;
    }
    
    
    /**
     * Método que permite enviar la información correspondiente indicando que el
     * tópico fue modificado.
     * @param request La petición HTTP que contendrá la información.
     * @param response La respuesta HTTP donde se redirigirá la información.
     * @return True si la información fue enviada. False en caso contrario.
     */
    public boolean enviarInformacion (HttpServletRequest request,
            HttpServletResponse response){
        RequestDispatcher dispatcher; 
        if ((request != null) && (response != null) ){
            try {
                request.setAttribute("mensaje","Topico Modificado");
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
