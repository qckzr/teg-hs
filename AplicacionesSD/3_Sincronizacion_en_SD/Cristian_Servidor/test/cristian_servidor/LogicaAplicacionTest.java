/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package cristian_servidor;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;
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
     * Test of enviarRespuesta method, of class LogicaAplicacion.
     */
    @Test
    public void testEnviarRespuesta() {
        System.out.println("enviarRespuesta");
        Mensaje mensajeRecibido = null;
        LogicaAplicacion instance = null;
        boolean expResult = false;
        boolean result = instance.enviarRespuesta(mensajeRecibido);
        assertEquals(expResult, result);
    }
    
}
