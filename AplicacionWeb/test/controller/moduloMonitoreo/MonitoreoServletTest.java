/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller.moduloMonitoreo;

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
public class MonitoreoServletTest {
    
    public MonitoreoServletTest() {
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
     * Test of mensajesMonitoreo method, of class MonitoreoServlet.
     */
    @Test
    public void testMensajesMonitoreo() {
        System.out.println("mensajesMonitoreo");
        HttpServletResponse response = null;
        PrintWriter out = null;
        String ruta = "";
        String nodo = "";
        MonitoreoServlet instance = new MonitoreoServlet();
        boolean expResult = false;
        boolean result = instance.mensajesMonitoreo(response, out, ruta, nodo);
        assertEquals(expResult, result);
        
    }

    /**
     * Test of mensajesAgente method, of class MonitoreoServlet.
     */
    @Test
    public void testMensajesAgente() {
        System.out.println("mensajesAgente");
        HttpServletResponse response = null;
        PrintWriter out = null;
        String ruta = "";
        String nodo = "";
        MonitoreoServlet instance = new MonitoreoServlet();
        boolean expResult = false;
        boolean result = instance.mensajesAgente(response, out, ruta, nodo);
        assertEquals(expResult, result);
        
    }

    /**
     * Test of crearArchivo method, of class MonitoreoServlet.
     */
    @Test
    public void testCrearArchivo() {
        System.out.println("crearArchivo");
        String ruta = "";
        String nombreArchivo = "";
        MonitoreoServlet instance = new MonitoreoServlet();
        boolean expResult = false;
        boolean result = instance.crearArchivo(ruta, nombreArchivo);
        assertEquals(expResult, result);
        
    }


   
    
}
