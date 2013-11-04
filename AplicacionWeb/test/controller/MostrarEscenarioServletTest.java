/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

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
public class MostrarEscenarioServletTest {
    
    public MostrarEscenarioServletTest() {
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
     * Test of enviarInformacionEscenario method, of class MostrarEscenarioServlet.
     */
    @Test
    public void testEnviarInformacionEscenario() {
        System.out.println("enviarInformacionEscenario");
        HttpServletRequest request = null;
        HttpServletResponse response = null;
        MostrarEscenarioServlet instance = new MostrarEscenarioServlet();
        boolean expResult = false;
        boolean result = instance.enviarInformacionEscenario(request, response);
        assertEquals(expResult, result);
        
    }

    
    
}
