/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ConexionBD;
import model.Preguntas;

/**
 * Clase que permite generar las preguntas de manera aleatoria para un tópico
 * particular.
 * @author Héctor Sam
 */
@WebServlet(name = "GenerarPreguntaServlet", urlPatterns = {"/GenerarPreguntaServlet"})
public class GenerarPreguntaServlet extends HttpServlet {

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
        String idTopico;
        String root = getServletContext().getRealPath("/");
        try {
            /*
             * TODO output your page here. You may use following sample code.
             */
            idTopico = request.getParameter("idTopico");
            generarPdf(idTopico,root);
            out.println("<a href=\"/AplicacionWeb/archivos/preguntas.pdf\" "
                    + "target=\"_blank\" id=\"preguntasPdf\">Descargar</a>");
        } finally {            
            out.close();
        }
    }
    
    /**
     * Método que permite generar las preguntas para un tópico específico.
     * @param idTopico El id del tópico a generar sus preguntas.
     * @return La lista de preguntas generadas o null si hubo un error.
     */
    public ArrayList<Preguntas> generarPregunta(String idTopico){
        ArrayList<Integer> preguntasElegidas;
        ArrayList<Preguntas> preguntasAenviar;
        ConexionBD conexionBD;
        int cantidadMaximaPreguntas;
        int auxiliar = 1;
        ResultSet resultSet;
        int numero;
        Preguntas pregunta;
        ResultSet opciones;
        try {
            preguntasElegidas = new ArrayList<>();
            preguntasAenviar = new ArrayList<>();
            conexionBD = new ConexionBD();
            resultSet = conexionBD.consultarRegistro("SELECT COUNT(*) FROM PREGUNTAS WHERE ID_TOPICO="+idTopico);
            cantidadMaximaPreguntas = Integer.valueOf(resultSet.getString(1));
            while (preguntasElegidas.size() < 5){
                numero = (int) (1 + Math.random()*cantidadMaximaPreguntas);
                if (buscarPregunta(numero, preguntasElegidas) == true) {
                    preguntasElegidas.add(numero);
                }
            }
            resultSet = conexionBD.consultar("Select id,enunciado from preguntas where id_topico="+idTopico);
            while (resultSet.next()){
                if (!buscarPregunta(auxiliar, preguntasElegidas)){
                    pregunta = new Preguntas(resultSet.getString(1),
                            resultSet.getString(2));
                    opciones = conexionBD.consultar("SELECT opcion FROM RESPUESTAS WHERE ID_PREGUNTA="+pregunta.getId());
                    while (opciones.next()){
                           pregunta.agregarRespuesta(opciones.getString(1));
                    }
                    preguntasAenviar.add(pregunta);
                }
                auxiliar++;
            }
            conexionBD.desconectar();
            return preguntasAenviar;
        } catch (SQLException ex) {
            Logger.getLogger(GenerarPreguntaServlet.class.getName()).
                    log(Level.SEVERE, null, ex);
            return null;
        }
         catch (NullPointerException ex) {
            Logger.getLogger(GenerarPreguntaServlet.class.getName()).
                    log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
    
    /**
     * Método que permite validar si una pregunta específica se encuentra repetida.
     * @param numero El número de la pregunta que se desea validar.
     * @param preguntas La lista de preguntas disponibles.
     * @return True si la pregunta no se encuentra en la lista. False en caso
     * contrario.
     */
    public boolean buscarPregunta(int numero, ArrayList<Integer>preguntas){
        for (int integer : preguntas) {
             if (integer == numero)
                 return false;
        }
        return true;
    }
    
    
    /**
     * Método que permite generar un pdf de preguntas a partir de un tópico
     * específico.
     * @param idTopico El id del tópico al que pertenecen las preguntas.
     * @return True si el archivo fue generado con éxito. False en caso contrario.
     */
    public boolean generarPdf(String idTopico,String ruta){
        Document documento = new Document();
        ArrayList<Preguntas> preguntas = generarPregunta(idTopico);
        
        int contador = 1;
        try {
            documento.setPageSize(new Rectangle(400, 400));
            PdfWriter.getInstance(documento, new FileOutputStream(ruta+
                    "archivos/preguntas.pdf"));
            documento.open();
            documento.add(new Paragraph("PREGUNTAS"));
            for (Preguntas pregunta : preguntas){
                documento.add( new Paragraph (String.valueOf(contador+":  "
                        + ""+pregunta.getEnunciado()+"\n")));
                documento.add(new Paragraph(pregunta.imprimirRespuestas()));
                documento.add(new Paragraph("-------------\n"));
                contador++;
            }
            documento.close();
            return true;
    
        } catch (DocumentException de) {
            System.out.println(de.getMessage());
            return false; 
    }   catch (FileNotFoundException ex) {  
            Logger.getLogger(GenerarPreguntaServlet.class.getName()).
                    log(Level.SEVERE, null, ex);
            return false;
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
