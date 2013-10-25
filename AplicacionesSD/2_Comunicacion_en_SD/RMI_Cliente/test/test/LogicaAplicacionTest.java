/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package test;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;
import java.rmi.registry.Registry;
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
public class LogicaAplicacionTest {
    
    public LogicaAplicacionTest() {
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
     * Test of iniciarCliente method, of class LogicaAplicacion.
     */
    @Test
    public void testIniciarCliente() {
        System.out.println("iniciarCliente");
        boolean expResult = false;
        boolean result = LogicaAplicacion.iniciarCliente();
        assertEquals(expResult, result);

    }

    /**
     * Test of mensaje method, of class LogicaAplicacion.
     */
    @Test
    public void testMensaje() {
        System.out.println("mensaje");
        String mensaje = "";
        LogicaAplicacion instance = null;
        boolean expResult = false;
        boolean result = instance.mensaje(mensaje);
        assertEquals(expResult, result);
    }
    
}
