/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller.moduloCicloDeVida;

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
public class CicloDeVidaServletTest {
    
    public CicloDeVidaServletTest() {
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
     * Test of evaluarInstruccion method, of class CicloDeVidaServlet.
     */
    @Test
    public void testEvaluarInstruccion() {
        System.out.println("evaluarInstruccion");
        HttpServletRequest request = null;
        CicloDeVidaServlet instance = new CicloDeVidaServlet();
        boolean expResult = false;
        boolean result = instance.evaluarInstruccion(request);
        assertEquals(expResult, result);
        
    }

    
    
}
