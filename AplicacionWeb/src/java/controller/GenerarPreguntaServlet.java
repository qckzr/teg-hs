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
 *
 * @author sam
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
        try {
            /*
             * TODO output your page here. You may use following sample code.
             */
            String idTopico = request.getParameter("idTopico");
            generarPdf(idTopico);
            out.println("<a href=\"/AplicacionWeb/archivos/preguntas.pdf\" target=\"_blank\" id=\"preguntasPdf\">Descargar</a>");
        } finally {            
            out.close();
        }
    }
    
    public ArrayList<Preguntas> generarPregunta(String idTopico){
        try {
            ArrayList<Integer> preguntasElegidas = new ArrayList<>();
            ArrayList<Preguntas> preguntasAenviar = new ArrayList<>();
            ConexionBD conexionBD = new ConexionBD();
            int cantidadMaximaPreguntas = 0;
            ResultSet rs = conexionBD.consultarRegistro("SELECT COUNT(*) FROM PREGUNTAS WHERE ID_TOPICO="+idTopico);
            cantidadMaximaPreguntas = Integer.valueOf(rs.getString(1));
            while (preguntasElegidas.size()<5){
                int numero = (int) (1 + Math.random()*cantidadMaximaPreguntas);
                if (buscarPregunta(numero, preguntasElegidas)==true)
                    preguntasElegidas.add(numero);
            }
            rs = conexionBD.consultar("Select id,enunciado from preguntas where id_topico="+idTopico);
            int auxiliar = 1;
            while (rs.next()){
                if (!buscarPregunta(auxiliar, preguntasElegidas)){
                    Preguntas pregunta = new Preguntas(rs.getString(1), rs.getString(2));
                    ResultSet opciones = conexionBD.consultar("SELECT opcion FROM RESPUESTAS WHERE ID_PREGUNTA="+pregunta.getId());
                    while (opciones.next())
                           pregunta.agregarRespuesta(opciones.getString(1));
                    preguntasAenviar.add(pregunta);
                }
                auxiliar++;
            }
            return preguntasAenviar;
            
           
        } catch (SQLException ex) {
            Logger.getLogger(GenerarPreguntaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
         return null;
    }
    
    public boolean buscarPregunta(int numero, ArrayList<Integer>preguntas){
        for (int integer : preguntas) {
             if (integer==numero)
                 return false;
        }
        return true;
    }
    
    
     public void generarPdf(String idTopico){
                Document documento = new Document();
                documento.setPageSize(new Rectangle(400, 400));
                ArrayList<Preguntas> preguntas = generarPregunta(idTopico);
                String root = getServletContext().getRealPath("/");
        try {
            PdfWriter.getInstance(documento, new FileOutputStream(root+"archivos/preguntas.pdf"));
            documento.open();
            documento.add(new Paragraph("PREGUNTAS"));
            int contador = 1;
            for (Preguntas pregunta : preguntas){
                documento.add( new Paragraph (String.valueOf(contador+":  "+pregunta.getEnunciado()+"\n")));
                documento.add(new Paragraph(pregunta.imprimirRespuestas()));
                documento.add(new Paragraph("-------------\n"));
                contador++;
            }
            documento.close();
    
        } catch (DocumentException de) {
            System.out.println(de.getMessage());
   
        } catch (IOException ioe) {
            System.out.println(ioe.getMessage());
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
