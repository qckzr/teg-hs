/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.moduloGestion;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ConexionBD;

/**
 * Clase que permite obtener la información perteneciente a un tópico.
 * @author Héctor Sam
 */
@WebServlet(name = "ModificarTopicoServlet1", urlPatterns = {"/ModificarTopicoServlet1"})
public class ModificarTopicoServlet1 extends HttpServlet {

    private String id;
    private ConexionBD conexion;
    private ResultSet rs;
    private ResultSet rs2;
    private ArrayList<String[]> usuarios;
    private ArrayList<String> categorias;
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
     * @param request La petición HTTP con el id del tópico.
     * @return True si la información fue obtenida. False en caso contrario.
     */
    public boolean obtenerInformacion(HttpServletRequest request){
        if (request != null) {
            
            id = request.getParameter("topicos");
            conexion = new ConexionBD();
            usuarios = new ArrayList<String[]>();
            categorias = new ArrayList<String>();
            categorias.add("INTRODUCCION A LOS SISTEMAS DISTRIBUIDOS");
            categorias.add("COMUNICACION EN SISTEMAS DISTRIBUIDOS");
            categorias.add("SINCRONIZACION EN AMBIENTES DISTRIBUIDOS");
            categorias.add("REPLICACION");
            categorias.add("SISTEMAS DE ARCHIVOS DISTRIBUIDOS");
            categorias.add("SERVICIOS DE NOMBRE");
            categorias.add("OBJETOS DISTRIBUIDOS");
            categorias.add("SERVICIOS WEB");
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
        String [] usuario;
        if (request != null) {
            try {           
                rs = conexion.consultarRegistro("SELECT * FROM TOPICOS WHERE ID="+id);
                rs2 = conexion.consultar("Select id, nombre, apellido from usuarios");
                while (rs2.next()){
                    usuario = new String[3];
                    usuario[0] = rs2.getString(1);
                    usuario[1] = rs2.getString(2);
                    usuario[2] = rs2.getString(3);
                    usuarios.add(usuario);
                }
                return true;
            } catch (SQLException ex) {
                Logger.getLogger(ModificarTopicoServlet1.class.getName()).
                        log(Level.SEVERE, null, ex);
                return false;
            }
        }
        return false;
    }
    
    
    /**
     * Método que permite enviar la información correspondiente del tópico
     * a modificar..
     * @param request La petición HTTP que contendrá la información.
     * @param response La respuesta HTTP donde se redirigirá la información.
     * @return True si la información fue enviada. False en caso contrario.
     */
    public boolean enviarInformacion (HttpServletRequest request,
            HttpServletResponse response){
        RequestDispatcher dispatcher; 
        if ((request != null) && (response != null) ){
            try {
                request.setAttribute("id",id);
                request.setAttribute("nombre",rs.getString(2));
                request.setAttribute("categoria",rs.getString(3));
                request.setAttribute("descripcion",rs.getString(4));
                request.setAttribute("imagen",rs.getString(6));
                request.setAttribute("idUsuario",rs.getString(5));
                request.setAttribute("categorias",categorias);
                request.setAttribute("usuarios", usuarios);
                dispatcher = request.getRequestDispatcher("topicos/modificarTopico2.jsp");
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
             } catch (SQLException ex) {
                Logger.getLogger(EliminarAplicacionServlet1.class.getName()).
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
