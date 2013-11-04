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
public class TerminarAplicacionServletTest {
    
    public TerminarAplicacionServletTest() {
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
     * Test of eliminarPuerto method, of class TerminarAplicacionServlet.
     */
    @Test
    public void testEliminarPuerto() {
        System.out.println("eliminarPuerto");
        TerminarAplicacionServlet instance = new TerminarAplicacionServlet();
        boolean expResult = false;
        boolean result = instance.eliminarPuerto();
        assertEquals(expResult, result);
        
    }

}
