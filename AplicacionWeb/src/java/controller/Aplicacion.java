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
import model.Archivo;

/**
 *
 * @author sam
 */
@WebServlet(name = "Aplicacion", urlPatterns = {"/Aplicacion"})
public class Aplicacion extends HttpServlet {

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
            
            ConexionBD conexionBD = new ConexionBD();
            String idAplicacion = request.getParameter("aplicacion");
            String idTopico = request.getParameter("idTopico");
            ResultSet resultSet = conexionBD.consultarRegistro("SELECT NOMBRE,FECHA_ACTUALIZACION,INSTRUCCIONES FROM APLICACIONES WHERE ID="+idAplicacion);
            ResultSet escenariosAplicacion = conexionBD.consultar("SELECT NOMBRE,DESCRIPCION,IMAGEN FROM ESCENARIOS WHERE ID_APLICACION="+idAplicacion);
            ResultSet ejecutablesAplicacion = conexionBD.consultar("SELECT ID,NOMBRE,TIPO,ID_NODO FROM EJECUTABLES WHERE ID_APLICACION="+idAplicacion);
            ArrayList<String[]> escenarios = new ArrayList<String[]>();
            String root = getServletContext().getRealPath("/");
            
            
            
            while (escenariosAplicacion.next()){
                String[] escenario = new String[3];
                escenario[0] = escenariosAplicacion.getString(1);
                escenario[1] = escenariosAplicacion.getString(2);
                escenario[2] = escenariosAplicacion.getString(3);
                escenarios.add(escenario);
            }
            ArrayList<String[]> ejecutables = new ArrayList<String[]>();
            ArrayList<String> archivoMensajes = new ArrayList<>();
            ArrayList<String> archivoAgentes = new ArrayList<>();
            while (ejecutablesAplicacion.next()){
                String [] ejecutable = new String[4];
                ejecutable[0] = ejecutablesAplicacion.getString(1);
                ejecutable[1] = ejecutablesAplicacion.getString(2);
                ejecutable[2] = ejecutablesAplicacion.getString(3);
                ejecutable[3] = ejecutablesAplicacion.getString(4);
                ejecutables.add(ejecutable);
                archivoMensajes.add("archivo"+ejecutable[3]+".xml");
                archivoAgentes.add("agente"+ejecutable[3]+".xml");
               
            }
            Archivo archivo = new Archivo(root.substring(0,
                    root.indexOf("build/"))+"archivos/",archivoMensajes,
                    archivoAgentes,5000,idAplicacion);
                archivo.start();
            request.setAttribute("nombre",resultSet.getString(1));
            request.setAttribute("fecha_actualizacion", resultSet.getString(2));
            request.setAttribute("instrucciones", resultSet.getString(3));
            request.setAttribute("escenarios",escenarios);
            request.setAttribute("ejecutables",ejecutables);
            request.setAttribute("idTopico", idTopico);
            request.setAttribute("idAplicacion",idAplicacion);
           RequestDispatcher dispatcher = request.getRequestDispatcher("aplicacion.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Aplicacion.class.getName()).log(Level.SEVERE, null, ex);
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
