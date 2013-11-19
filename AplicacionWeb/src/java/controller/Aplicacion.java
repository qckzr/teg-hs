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
 * Clase que permite ejecutar una aplicación de sistemas distribuido 
 * seleccionada por el usuario.
 * @author Héctor Sam
 */
@WebServlet(name = "Aplicacion", urlPatterns = {"/Aplicacion"})
public class Aplicacion extends HttpServlet {
    
    private static final int PUERTO_ESCUCHA = 5000;
    private String idAplicacion;
    private ConexionBD conexionBD;
    private ArrayList<String[]> escenarios;
    private String idTopico;
    private ResultSet datosAplicacion;
    private ResultSet escenariosAplicacion;
    private ResultSet topicoAplicacion;
    private ResultSet ejecutablesAplicacion;
    private ArrayList<String[]> ejecutables;
    private ArrayList<String> archivoMensajes;
    private ArrayList<String> archivoAgentes;
    private String descripcion = "";
    private String rutaImagen = "";
    private String nombreTopico = "";

    public String getIdAplicacion() {
        return idAplicacion;
    }

    public void setIdAplicacion(String idAplicacion) {
        this.idAplicacion = idAplicacion;
    }

    public ConexionBD getConexionBD() {
        return conexionBD;
    }

    public void setConexionBD(ConexionBD conexionBD) {
        this.conexionBD = conexionBD;
    }

    public ArrayList<String[]> getEscenarios() {
        return escenarios;
    }

    public void setEscenarios(ArrayList<String[]> escenarios) {
        this.escenarios = escenarios;
    }

    public String getIdTopico() {
        return idTopico;
    }

    public void setIdTopico(String idTopico) {
        this.idTopico = idTopico;
    }

    public ResultSet getDatosAplicacion() {
        return datosAplicacion;
    }

    public void setDatosAplicacion(ResultSet datosAplicacion) {
        this.datosAplicacion = datosAplicacion;
    }

    public ResultSet getEscenariosAplicacion() {
        return escenariosAplicacion;
    }

    public void setEscenariosAplicacion(ResultSet escenariosAplicacion) {
        this.escenariosAplicacion = escenariosAplicacion;
    }

    public ResultSet getTopicoAplicacion() {
        return topicoAplicacion;
    }

    public void setTopicoAplicacion(ResultSet topicoAplicacion) {
        this.topicoAplicacion = topicoAplicacion;
    }

    public ResultSet getEjecutablesAplicacion() {
        return ejecutablesAplicacion;
    }

    public void setEjecutablesAplicacion(ResultSet ejecutablesAplicacion) {
        this.ejecutablesAplicacion = ejecutablesAplicacion;
    }

    public ArrayList<String[]> getEjecutables() {
        return ejecutables;
    }

    public void setEjecutables(ArrayList<String[]> ejecutables) {
        this.ejecutables = ejecutables;
    }

    public ArrayList<String> getArchivoMensajes() {
        return archivoMensajes;
    }

    public void setArchivoMensajes(ArrayList<String> archivoMensajes) {
        this.archivoMensajes = archivoMensajes;
    }

    public ArrayList<String> getArchivoAgentes() {
        return archivoAgentes;
    }

    public void setArchivoAgentes(ArrayList<String> archivoAgentes) {
        this.archivoAgentes = archivoAgentes;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getRutaImagen() {
        return rutaImagen;
    }

    public void setRutaImagen(String rutaImagen) {
        this.rutaImagen = rutaImagen;
    }

    
    
    
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
        String root;
        try {
            /*
             * TODO output your page here. You may use following sample code.
             */
          
            idAplicacion = request.getParameter("aplicacion");  
            idTopico = request.getParameter("idTopico");
            escenarios = new ArrayList<String[]>();
            ejecutables = new ArrayList<>();
            archivoMensajes = new ArrayList<>();
            archivoAgentes = new ArrayList<>();
            obtenerDatos(idAplicacion);
            root = getServletContext().getRealPath("/");  
            guardarDatos();
            iniciarEscuchaMensajes(root);
            enviarDatos(request, response);
        }  finally {    
            conexionBD.desconectar();
            out.close();
        }
    }
    
    
    /**
     * Método que permite obtener la informaciónproveniente de la base de datos
     * perteneciente a la aplicación seleccionada.
     * @param idAplicacion El id de la aplicación seleccionada.
     * @return True si se pudo obtener la información de la base de datos.
     * False si hubo error.
     */
    public boolean obtenerDatos(String idAplicacion){
        
        try {
            conexionBD = new ConexionBD();
            datosAplicacion = conexionBD.consultarRegistro("SELECT NOMBRE,"
                    + "TO_CHAR(FECHA_ACTUALIZACION,'DD/MM/YYYY'),INSTRUCCIONES,ID_TOPICO FROM "
                    + "APLICACIONES WHERE ID="+idAplicacion);
            escenariosAplicacion = conexionBD.consultar("SELECT NOMBRE,"
                    + "DESCRIPCION,IMAGEN FROM "
                    + "ESCENARIOS WHERE ID_APLICACION="+idAplicacion);
	    topicoAplicacion = conexionBD.consultar("SELECT DESCRIPCION,"
                    + "RUTA_IMAGEN,NOMBRE FROM TOPICOS "
                    + "WHERE ID="+datosAplicacion.getString(4));
            ejecutablesAplicacion = conexionBD.consultar("SELECT ID,NOMBRE,"
                    + "TIPO,ID_NODO FROM EJECUTABLES "
                    + "WHERE ID_APLICACION="+idAplicacion);
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(Aplicacion.class.getName()).
                    log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    /**
     * Método que permite guardar los datos de la aplicación a ejecutar incluyendo
     * los ejecutables, escenarios e información del tópico.
     * @return True si se pudo guardar la información. False en caso contrario.
     */
    public boolean guardarDatos(){
        String[] escenario;
        String [] ejecutable;
        String ruta;
        try {
            
            while(topicoAplicacion.next()){
                descripcion = topicoAplicacion.getString(1);
                ruta = topicoAplicacion.getString(2);
                nombreTopico = topicoAplicacion.getString(3);
                if (ruta != null)
                    rutaImagen = ruta.substring(ruta.indexOf("images/"));
            }
            
            
            while (escenariosAplicacion.next()){
                escenario = new String[3];
                escenario[0] = escenariosAplicacion.getString(1);
                escenario[1] = escenariosAplicacion.getString(2);
                escenario[2] = escenariosAplicacion.getString(3);
                escenarios.add(escenario);
            }
            
            while (ejecutablesAplicacion.next()){
                ejecutable = new String[4];
                ejecutable[0] = ejecutablesAplicacion.getString(1);
                ejecutable[1] = ejecutablesAplicacion.getString(2);
                ejecutable[2] = ejecutablesAplicacion.getString(3);
                ejecutable[3] = ejecutablesAplicacion.getString(4);
                ejecutables.add(ejecutable);
                archivoMensajes.add("archivo"+ejecutable[3]+".xml");
                archivoAgentes.add("agente"+ejecutable[3]+".xml");
               
            }
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(Aplicacion.class.getName()).
                    log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    /**
     * Método que permite iniciar el hilo de escucha de los mensajes provenientes
     * del servidor central.
     * @param ruta La ruta donde se encuentran los archivos para recibir los 
     * mensajes.
     */
    public void iniciarEscuchaMensajes(String ruta){
        Archivo archivo = new Archivo(ruta.substring(0,
                    ruta.indexOf("build/"))+"archivos/",archivoMensajes,
                    archivoAgentes,PUERTO_ESCUCHA,idAplicacion);
            archivo.start();
        
    }
    
    /**
     * Método que permite enviar los datos de la aplicación a la página principal.
     * @param request La petición HTTP que contiene los datos.
     * @param response La respuesta HTTP donde se enviarán los datos.
     * @return True si se pudo enviar los datos. False en caso contrario.
     */
    public boolean enviarDatos(HttpServletRequest request,
            HttpServletResponse response){
        RequestDispatcher dispatcher;
        if ((request != null) && (response != null)){
            try {
                request.setAttribute("nombre",nombreTopico);
                request.setAttribute("fecha_actualizacion", datosAplicacion.getString(2));
                request.setAttribute("instrucciones", datosAplicacion.getString(3));
                request.setAttribute("escenarios",escenarios);
                request.setAttribute("ejecutables",ejecutables);
                request.setAttribute("idTopico", idTopico);
                request.setAttribute("idAplicacion",idAplicacion);
                request.setAttribute("descripcionTopico",descripcion);
                request.setAttribute("imagenTopico",rutaImagen);
                dispatcher = request.getRequestDispatcher("aplicacion.jsp");
                dispatcher.forward(request, response);
                return true;
            } catch (SQLException ex) {
                Logger.getLogger(Aplicacion.class.getName()).
                        log(Level.SEVERE, null, ex);
                return false;
            } catch (ServletException ex) {
                Logger.getLogger(Aplicacion.class.getName()).
                        log(Level.SEVERE, null, ex);
                return false;
            } catch (IOException ex) {
                Logger.getLogger(Aplicacion.class.getName()).
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
