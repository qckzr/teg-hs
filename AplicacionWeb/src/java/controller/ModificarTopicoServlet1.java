/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

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
 *
 * @author hector
 */
@WebServlet(name = "ModificarTopicoServlet1", urlPatterns = {"/ModificarTopicoServlet1"})
public class ModificarTopicoServlet1 extends HttpServlet {

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
             String id = request.getParameter("topicos");
             ConexionBD conexion = new ConexionBD();
             ResultSet rs = conexion.consultarRegistro("SELECT * FROM TOPICOS WHERE ID="+id);
             request.setAttribute("id",id);
             request.setAttribute("nombre",rs.getString(2));
             request.setAttribute("categoria",rs.getString(3));
             request.setAttribute("descripcion",rs.getString(4));
             request.setAttribute("imagen",rs.getString(6));
             ResultSet rs2 = conexion.consultar("Select id, nombre, apellido from usuarios");
             request.setAttribute("idUsuario",rs.getString(5));
             ArrayList<String[]> usuarios = new ArrayList<String[]>();
             while (rs2.next()){
                 String [] usuario = new String[3];
                 usuario[0] = rs2.getString(1);
                 usuario[1] = rs2.getString(2);
                 usuario[2] = rs2.getString(3);
                 usuarios.add(usuario);
             }
             ArrayList<String> categorias = new ArrayList<String>();
             categorias.add("INTRODUCCION A LOS SISTEMAS DISTRIBUIDOS");
             categorias.add("COMUNICACION EN SISTEMAS DISTRIBUIDOS");
             categorias.add("SINCRONIZACION EN AMBIENTES DISTRIBUIDOS");
             categorias.add("REPLICACION");
             categorias.add("SISTEMAS DE ARCHIVOS DISTRIBUIDOS");
             categorias.add("SERVICIOS DE NOMBRE");
             categorias.add("OBJETOS DISTRIBUIDOS");
             categorias.add("SERVICIOS WEB");
             request.setAttribute("categorias",categorias);
             request.setAttribute("usuarios", usuarios);
             RequestDispatcher dispatcher = request.getRequestDispatcher("topicos/modificarTopico2.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ModificarTopicoServlet1.class.getName()).log(Level.SEVERE, null, ex);
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
