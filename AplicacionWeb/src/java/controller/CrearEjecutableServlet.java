/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

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
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author hector
 */
@WebServlet(name = "CrearEjecutableServlet", urlPatterns = {"/CrearEjecutableServlet"})
public class CrearEjecutableServlet extends HttpServlet {

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
//            String nombreEjecutable ="";
//            String tipo = "";
//            String idAplicacion = "";
//            String cantidadParametros = "";
//            ArrayList<String> nombreParametros = new ArrayList<String>();
//            ArrayList<String> valorParametros = new ArrayList<String>();
//            File seshdir = new File(directorio.getDirectorioEjecutables());
//            if (!seshdir.exists()) {
//            seshdir.mkdirs();
//            }
//            FileItemFactory factory = new DiskFileItemFactory();
//            ServletFileUpload upload = new ServletFileUpload(factory);
//            List<FileItem> items = null;
//            try {
//                items = upload.parseRequest(request);
//            } catch (FileUploadException ex) {
//                Logger.getLogger(CrearEjecutableServlet.class.getName()).log(Level.SEVERE, null, ex);
//            }
 
//      for (FileItem diskFileItem : items) {
//
//        if (diskFileItem.isFormField()) {
//            switch (diskFileItem.getFieldName()){
//                case "tipoEjecutable": tipo = diskFileItem.getString();
//                                    break;
//                case "aplicacion": idAplicacion = diskFileItem.getString();
//                                break;
//                case "cantidadParametros": cantidadParametros = diskFileItem.getString();
//                    break;
//                default:{
//                    if (diskFileItem.getFieldName().contains("nombreParametro"))
//                        nombreParametros.add(diskFileItem.getString());               
//                    else if (diskFileItem.getFieldName().contains("parametro"))
//                        valorParametros.add(diskFileItem.getString());
//                }
//                
//                
//            };
//        
//        }
//        else{
//
//            byte[] fileBytes = diskFileItem.get();
//            File file = new File(seshdir, diskFileItem.getName());
//            nombreEjecutable = diskFileItem.getName();
//            FileOutputStream fileOutputStream = new FileOutputStream(file);
//            fileOutputStream.write(fileBytes);
//            fileOutputStream.flush();
//        }
//  }
            String nombreEjecutable ="";
            String tipo = request.getParameter("tipoEjecutable");
            String idAplicacion = request.getParameter("aplicacion");
            String cantidadParametros = request.getParameter("cantidadParametros");
            String idNodo = request.getParameter("nodos");
            ConexionBD conexion = new ConexionBD();
            nombreEjecutable = conexion.consultarRegistro("select to_char(sysdate,'DD/MM/YYYY HH24:MI:SS') from dual").getString(1);
            String rutaEjecutable = "";
            conexion.ejecutarQuery("INSERT INTO EJECUTABLES (ID,NOMBRE,TIPO,RUTA_EJECUTABLE,ID_APLICACION,ID_NODO)"
                    + " VALUES (S_EJECUTABLES.NEXTVAL,'"+nombreEjecutable+"','"+tipo+"','"+nombreEjecutable+"',"+idAplicacion+","+idNodo+")");
            String idEjecutable  = conexion.consultarRegistro("Select id from ejecutables where nombre='"+nombreEjecutable+"'").getString(1);
            for (int i = 1; i <  Integer.valueOf(cantidadParametros); i++) {
                String nombreParametro = request.getParameter("nombreParametro"+i);
                String valorParametro = request.getParameter("parametro"+i);
                conexion.ejecutarQuery("INSERT INTO PARAMETROS (ID,NOMBRE,VALOR,ID_EJECUTABLE)"
                        + "VALUES(S_EJECUTABLES.NEXTVAL,'"+nombreParametro +"','"+valorParametro+"',"+idEjecutable+")");
            }
            
            request.setAttribute("tipoArchivo", "ejecutable");
            request.setAttribute("ejecutables",1);
            request.setAttribute("ejecutable", idEjecutable);
//            conexion.ejecutarQuery("UPDATE EJECUTABLES SET RUTA_EJECUTABLE='"+directorio.getDirectorioEjecutables()+"/"+nombreEjecutable+"' WHERE ID="+idEjecutable);
//            
//            request.setAttribute("mensaje","Se agregó el ejecutable");     
//            request.setAttribute("link","ejecutables/ejecutables.jsp");
//            RequestDispatcher dispatcher = request.getRequestDispatcher("/respuesta.jsp");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/subirArchivo.jsp");
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
