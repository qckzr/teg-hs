/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller.moduloGestion;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
public class EjecutableNodoServletTest {
    
    public EjecutableNodoServletTest() {
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
     * Test of obtenerInformacion method, of class EjecutableNodoServlet.
     */
    @Test
    public void testObtenerInformacion() {
        System.out.println("obtenerInformacion");
        HttpServletRequest request = null;
        EjecutableNodoServlet instance = new EjecutableNodoServlet();
        boolean expResult = false;
        boolean result = instance.obtenerInformacion(request);
        assertEquals(expResult, result);
        
    }

    /**
     * Test of enviarInformacion method, of class EjecutableNodoServlet.
     */
    @Test
    public void testEnviarInformacion() {
        System.out.println("enviarInformacion");
        HttpServletRequest request = null;
        PrintWriter out = null;
        EjecutableNodoServlet instance = new EjecutableNodoServlet();
        boolean expResult = false;
        boolean result = instance.enviarInformacion(request, out);
        assertEquals(expResult, result);
        
    }

    
    
}
