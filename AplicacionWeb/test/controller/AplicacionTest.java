/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ConexionBD;
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
public class AplicacionTest {
    
    public AplicacionTest() {
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
     * Test of obtenerDatos method, of class Aplicacion.
     */
    @Test
    public void testObtenerDatos() {
        System.out.println("obtenerDatos");
        String idAplicacion = "1";
        Aplicacion instance = new Aplicacion();
        instance.setConexionBD(new ConexionBD());
        boolean expResult = true;
        boolean result = instance.obtenerDatos(idAplicacion);
        assertEquals(expResult, result);
        
    }

    /**
     * Test of guardarDatos method, of class Aplicacion.
     */
    @Test
    public void testGuardarDatos() {
        System.out.println("guardarDatos");
        Aplicacion instance = new Aplicacion();
        instance.setIdAplicacion("1");
        instance.setConexionBD(new ConexionBD());
        instance.obtenerDatos("1");
        boolean expResult = true;
        boolean result = instance.guardarDatos();
        assertEquals(expResult, result);
        
    }

    /**
     * Test of enviarDatos method, of class Aplicacion.
     */
    @Test
    public void testEnviarDatos() {
        System.out.println("enviarDatos");
        HttpServletRequest request = null;
        HttpServletResponse response = null;
        Aplicacion instance = new Aplicacion();
        boolean expResult = false;
        boolean result = instance.enviarDatos(request, response);
        assertEquals(expResult, result);
        
    }

    
    
}
