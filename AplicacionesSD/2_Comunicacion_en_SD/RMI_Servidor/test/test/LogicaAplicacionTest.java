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
     * Test of iniciarServidor method, of class LogicaAplicacion.
     */
    @Test
    public void testIniciarServidor() {
        System.out.println("iniciarServidor");
        boolean expResult = true;
        boolean result = LogicaAplicacion.iniciarServidor();
        assertEquals(expResult, result);

    }
    
}
