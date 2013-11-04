/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.moduloCicloDeVida;

import Libreria.LibreriaMensajes;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ConexionBD;

/**
 *
 * @author sam
 */
@WebServlet(name = "CicloDeVidaServlet", urlPatterns = {"/CicloDeVidaServlet"})
public class CicloDeVidaServlet extends HttpServlet {
    
   private static final String ipServidorCentral ="localhost";

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
//            /*
//             * TODO output your page here. You may use following sample code.
//             */
//            
              evaluarInstruccion(request);
        
        } finally {            
            out.close();
        }
    }
    
    /**
     * Método que permite evaluar la instrucción enviada por el usuario para 
     * dirigirla al servidor central.
     * @param request La peticion HTTP que contiene la instrucción a enviar.
     * @return True si la instrucción fue enviada. False en caso contrario.
     */
    public boolean evaluarInstruccion(HttpServletRequest request) {
        LibreriaMensajes libreriaMensajes = new LibreriaMensajes(false);
        String instruccion;
        String idEjecutable;
        ConexionBD conexionBD;
        ResultSet resultSet;
        String mensaje;
        String enviar;
        
        if (request != null){
            try {
            instruccion = request.getParameter("instruccion");
            if (instruccion.contentEquals("eliminarTodo")) {
                libreriaMensajes.enviarMensaje("eliminarTodos>",ipServidorCentral);
            } else{
                idEjecutable = request.getParameter("idEjecutable");
            
                conexionBD = new ConexionBD();
                switch (instruccion){
                    case "detener":  {
                        resultSet = conexionBD.consultarRegistro("SELECT E.NOMBRE,"
                        + " N.IP FROM NODOS N,EJECUTABLES E WHERE N.ID=E.ID_NODO"
                                + " AND E.ID="+idEjecutable);
                        libreriaMensajes.enviarMensaje("eliminar>"
                                +resultSet.getString(1)+":"
                                +resultSet.getString(2),ipServidorCentral);
                        break;
                    }
                    case "enviar":  {
                        mensaje = request.getParameter("mensaje");
                        resultSet = conexionBD.consultarRegistro("SELECT "
                        + " N.IP FROM NODOS N,EJECUTABLES E WHERE N.ID="
                                + "E.ID_NODO AND E.ID="+idEjecutable);
                        enviar = "mensajeNodo>"+mensaje+":"+resultSet.getString(1);
                        libreriaMensajes.enviarMensaje(enviar,ipServidorCentral);
                        break;
                    }
                    case "iniciar":{
                        resultSet = conexionBD.consultarRegistro("SELECT E.NOMBRE,"
                        + " N.IP FROM NODOS N,EJECUTABLES E WHERE N.ID="
                                + "E.ID_NODO AND E.ID="+idEjecutable);
                        libreriaMensajes.enviarMensaje("ejecutar>"
                                +resultSet.getString(1)+":"
                                +resultSet.getString(2),ipServidorCentral);
                        break;
                    }
                };
                conexionBD.desconectar();
                return true;
            }
            } catch (SQLException exception){
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
