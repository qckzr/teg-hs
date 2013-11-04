/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

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
public class IniciarSesionTest {
    
    public IniciarSesionTest() {
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
     * Test of validarUsuario method, of class IniciarSesion.
     */
    @Test
    public void testValidarUsuario() {
        System.out.println("validarUsuario");
        HttpServletRequest request = null;
        PrintWriter out = null;
        IniciarSesion instance = new IniciarSesion();
        boolean expResult = false;
        boolean result = instance.validarUsuario(request, out);
        assertEquals(expResult, result);
        
    }

    
    
}
