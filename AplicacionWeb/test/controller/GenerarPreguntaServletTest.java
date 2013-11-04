/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import java.util.ArrayList;
import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Preguntas;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author hectorsam
 */
public class GenerarPreguntaServletTest {
    
    public GenerarPreguntaServletTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    

    /**
     * Test of generarPregunta method, of class GenerarPreguntaServlet.
     */
    @Test
    public void testGenerarPregunta() {
        System.out.println("generarPregunta");
        String idTopico = "1";
        GenerarPreguntaServlet instance = new GenerarPreguntaServlet();
        ArrayList<Preguntas> expResult = null;
        ArrayList<Preguntas> result = instance.generarPregunta(idTopico);
        assertNotSame(expResult, result);
    }

    /**
     * Test of buscarPregunta method, of class GenerarPreguntaServlet.
     */
    @Test
    public void testBuscarPregunta() {
        System.out.println("buscarPregunta");
        int numero = 0;
        ArrayList<Integer> preguntas = new ArrayList<>();
        GenerarPreguntaServlet instance = new GenerarPreguntaServlet();
        boolean expResult = true;
        boolean result = instance.buscarPregunta(numero, preguntas);
        assertEquals(expResult, result);
    }

    /**
     * Test of generarPdf method, of class GenerarPreguntaServlet.
     */
    @Test
    public void testGenerarPdf() {
        System.out.println("generarPdf");
        String idTopico = "1";
        GenerarPreguntaServlet instance = new GenerarPreguntaServlet();
        boolean expResult = false;
        boolean result = instance.generarPdf(idTopico,"/tmp/");
        
        assertEquals(expResult, result);
        
    }

    
    
}
