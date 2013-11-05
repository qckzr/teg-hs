/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.moduloGestion;

import java.io.File;
import java.io.FileNotFoundException;
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
 * Clase que permite modificar una aplicación de la base de datos a través del
 * módulo de gestión.
 * @author Héctor Sam
 */
@WebServlet(name = "ModificarAplicacionServlet2", urlPatterns = {"/ModificarAplicacionServlet2"})
public class ModificarAplicacionServlet2 extends HttpServlet {

    private Directorios directorio = new Directorios();
    private String nombre = "";
    private String fecha_actualizacion = "";
    private String instrucciones = "";
    private String id =  "";
    private String idTopico = "";
    private ArrayList<String> nombreEscenarios = new ArrayList<>();
    private ArrayList<String> descripcionEscenarios = new ArrayList<>();
    private ArrayList<String> imagenes = new ArrayList<>();
    private ArrayList<String> idEscenarios = new ArrayList<>();
    private ConexionBD conexionBD = new ConexionBD();
    private ResultSet aplicacion;
    private ResultSet escenario;
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
     * Método que permite obtener la información correspondiente a una aplicación.
     * @param request La petición HTTP con los datos de la aplicación.
     * @return True si la información fue obtenida. False en caso contrario.
     */
    public boolean obtenerInformacion(HttpServletRequest request){
        File seshdir;
        FileItemFactory factory;
        ServletFileUpload upload;
        List<FileItem> items = null;
        FileOutputStream fileOutputStream = null;
        byte[] fileBytes;
        File file;
        if (request != null) {
            
            conexionBD = new ConexionBD();
            seshdir = new File(directorio.getDirectorioImagenesEscenarios());
            if (!seshdir.exists()) {
                seshdir.mkdirs();
            }
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
                        case "nombre": 
                            nombre = diskFileItem.getString();
                            break;
                        case "instrucciones": 
                            instrucciones = diskFileItem.getString();
                            break;
                        case "fecha_actualizacion": 
                            fecha_actualizacion = diskFileItem.getString();
                            break;
                        case "id": 
                            id = diskFileItem.getString();
                            break;
                        case "topicos": 
                            idTopico = diskFileItem.getString();
                            break;    
                        default:{
                            if (diskFileItem.getFieldName().contains("escenario")) {
                                nombreEscenarios.add(diskFileItem.getString());
                            } else if (diskFileItem.getFieldName().contains("descripcion")){
                                descripcionEscenarios.add(diskFileItem.getString());
                            } else if (diskFileItem.getFieldName().contains("idEscenario")) {
                                idEscenarios.add(diskFileItem.getString());
                            }
                        }
                       
                    };
        
                } else{
                    if (!diskFileItem.getString().isEmpty()){
                      
                        try {
                            fileBytes = diskFileItem.get();
                            file = new File(seshdir, diskFileItem.getName());
                            imagenes.add("'"+directorio.
                                    getDirectorioImagenesEscenarios()
                                    +"/"+diskFileItem.getName()+"'");
                            fileOutputStream = new FileOutputStream(file);
                            fileOutputStream.write(fileBytes);
                            fileOutputStream.flush();
                            fileOutputStream.close();
                        } catch (FileNotFoundException ex) {
                                Logger.getLogger(ModificarAplicacionServlet2.
                                        class.getName()).log(Level.SEVERE, null, ex);
                        } catch (IOException ex) {
                                Logger.getLogger(ModificarAplicacionServlet2.
                                        class.getName()).log(Level.SEVERE, null, ex);
                        } 

                    } else  {
                        imagenes.add("NULL");
                    }
            }
            
            }
      
        return true;
        }
        return false;
    }
    
    /**
     * Método que permite ejecutar el query con la información perteneciente
     * a una aplicación.
     * @param request La petición HTTP con la información de la aplicación.
     * @return True si la información fue obtenida. False en caso contrario.
     */
    public boolean ejecutarQuery(HttpServletRequest request){
        
        if (request != null) {
            try {
               aplicacion = conexionBD.consultarRegistro("SELECT NOMBRE,"
                       + "FECHA_ACTUALIZACION,INSTRUCCIONES,ID_TOPICO "
                       + "FROM APLICACIONES WHERE ID="+id);
                if (!aplicacion.getString(1).contentEquals(nombre)){
                    conexionBD.ejecutarQuery("UPDATE APLICACIONES "
                            + "SET NOMBRE='"+nombre+"' WHERE ID="+id);
                }
                if (!aplicacion.getString(2).contentEquals(fecha_actualizacion)){
                    conexionBD.ejecutarQuery("UPDATE APLICACIONES "
                            + "SET FECHA_ACTUALIZACION=TO_DATE('"+fecha_actualizacion+"'"
                            + ",'DD-MM-YYYY') WHERE ID="+id);
                }
                if (!aplicacion.getString(3).contentEquals(instrucciones)) {
                    conexionBD.ejecutarQuery("UPDATE APLICACIONES "
                            + "SET INSTRUCCIONES='"+instrucciones+"' WHERE ID="+id);
                }
                if (!aplicacion.getString(4).contentEquals(idTopico)) {
                    conexionBD.ejecutarQuery("UPDATE APLICACIONES "
                            + "SET ID_TOPICO="+idTopico+" WHERE ID="+id);
                }
                for (int i = 0; i < Integer.valueOf(nombreEscenarios.size()); i++) {
                
                    escenario = conexionBD.consultarRegistro("SELECT "
                         + "NOMBRE,DESCRIPCION,IMAGEN FROM ESCENARIOS "
                         + "WHERE ID="+idEscenarios.get(i));
                    if (!escenario.getString(1).contentEquals(nombreEscenarios.get(i))) {
                        conexionBD.ejecutarQuery("UPDATE ESCENARIOS "
                                + "SET NOMBRE='"+nombreEscenarios.get(i)+"' "
                                + "WHERE ID="+idEscenarios.get(i));
                    }
                    if (!escenario.getString(2).contentEquals(descripcionEscenarios.get(i))) {
                        conexionBD.ejecutarQuery("UPDATE ESCENARIOS "
                                + "SET DESCRIPCION='"+descripcionEscenarios.get(i)+"' "
                                + "WHERE ID="+idEscenarios.get(i));
                    }
                    if ( (escenario.getString(3) == null) && (!imagenes.get(i).contentEquals("NULL"))){
                        conexionBD.ejecutarQuery("UPDATE ESCENARIOS "
                                + "SET IMAGEN="+imagenes.get(i)+" "
                                + "WHERE ID="+idEscenarios.get(i));
                    } else if ( (!imagenes.get(i).contentEquals("NULL")) 
                            && (!escenario.getString(3).contentEquals(imagenes.get(i)))){
                        conexionBD.ejecutarQuery("UPDATE ESCENARIOS "
                                + "SET IMAGEN="+imagenes.get(i)+" "
                                + "WHERE ID="+idEscenarios.get(i));
                    }
                    
                
            }
                return true;
            } catch (SQLException ex) {
                Logger.getLogger(ModificarAplicacionServlet1.class.getName()).
                        log(Level.SEVERE, null, ex);
            }
           
        }
        return false;
    }
    
    
    /**
     * Método que permite enviar la información correspondiente indicando que la
     * aplicación fue modificada.
     * @param request La petición HTTP que contendrá la información.
     * @param response La respuesta HTTP donde se redirigirá la información.
     * @return True si la información fue enviada. False en caso contrario.
     */
    public boolean enviarInformacion (HttpServletRequest request,
            HttpServletResponse response){
        RequestDispatcher dispatcher; 
        if ((request != null) && (response != null) ){
            try {
                request.setAttribute("mensaje","Se modificó la aplicacion");     
                dispatcher = request.getRequestDispatcher("/respuesta.jsp");
                dispatcher.forward(request, response);
                conexionBD.desconectar();
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
