/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.ConexionBD;

/**
 *
 * @author sam
 */
@WebServlet(name = "IniciarSesion", urlPatterns = {"/IniciarSesion"})
public class IniciarSesion extends HttpServlet {

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
              validarUsuario(request, out);
//            String iniciar = request.getParameter("sesion");
//            if (iniciar.contentEquals("iniciar")){
//                ConexionBD conexionBD = new ConexionBD();
//                String usuario = request.getParameter("usuario");
//                String password = request.getParameter("password");
//                ResultSet rs = conexionBD.consultarRegistro("SELECT NOMBRE,APELLIDO FROM USUARIOS WHERE CORREO='"+usuario+"' AND CONTRASENA='"+password+"'");
//                if (rs!=null){
//                    HttpSession session=  request.getSession(true);
//                    session.setAttribute("nombre",rs.getString(1));
//                    session.setAttribute("apellido",rs.getString(2));
//                    out.println("Usuario logueado");
//                }
//                else
//                out.println("Usuario o password invalido");
//            }
//            else{
//                HttpSession session=  request.getSession();
//                session.invalidate(); 
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(IniciarSesion.class.getName()).log(Level.SEVERE, null, ex);
        } finally {            
            out.close();
        }
    }
    
    /**
     * Método que permite validar los datos de un usuario para acceder al módulo
     * de gestión.
     * @param request La petición HTTP con los datos del usuario.
     * @param out Donde se imprimirá si el usuario fue logueado o no.
     * @return True si los datos son correctos. False en caso contrario o si hubo
     * error.
     */
    public boolean validarUsuario(HttpServletRequest request, PrintWriter out){
        ConexionBD conexionBD;
        String usuario;
        String password;
        ResultSet resultSet;
        HttpSession session;
        String iniciar;
        if (request != null) {
            try {
                iniciar = request.getParameter("sesion");
                if (iniciar.contentEquals("iniciar")){
                    conexionBD = new ConexionBD();
                    usuario = request.getParameter("usuario");
                    password = request.getParameter("password");
                    resultSet = conexionBD.consultarRegistro(
                            "SELECT NOMBRE,APELLIDO FROM USUARIOS WHERE"
                            + " CORREO='"+usuario+"' AND CONTRASENA='"+password+"'");
                    if (resultSet != null){
                            session =  request.getSession(true);
                            session.setAttribute("nombre",resultSet.getString(1));
                            session.setAttribute("apellido",resultSet.getString(2));
                            out.println("Usuario logueado");
                            
                    } else {
                        out.println("Usuario o password invalido");
                        return false;
                    }
                    conexionBD.desconectar();
                } else{
                    session=  request.getSession();
                    session.invalidate(); 
                }
                return true;
            } catch (SQLException ex) {
                Logger.getLogger(IniciarSesion.class.getName()).
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
