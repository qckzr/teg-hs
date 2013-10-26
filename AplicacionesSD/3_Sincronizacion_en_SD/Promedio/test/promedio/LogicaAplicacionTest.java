/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package promedio;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;
import java.util.ArrayList;
import java.util.Date;
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
     * Test of enviarMensaje method, of class LogicaAplicacion.
     */
    @Test
    public void testEnviarMensaje_String_String() {
        System.out.println("enviarMensaje");
        String mensaje = "";
        String ip = "";
        LogicaAplicacion instance = null;
        boolean expResult = false;
        boolean result = instance.enviarMensaje(mensaje, ip);
        assertEquals(expResult, result);
    }

    /**
     * Test of enviarMensaje method, of class LogicaAplicacion.
     */
    @Test
    public void testEnviarMensaje_0args() {
        System.out.println("enviarMensaje");
        LogicaAplicacion instance = null;
        boolean expResult = false;
        boolean result = instance.enviarMensaje();
        assertEquals(expResult, result);
    }

    /**
     * Test of sincronizarReloj method, of class LogicaAplicacion.
     */
    @Test
    public void testSincronizarReloj() {
        System.out.println("sincronizarReloj");
        LogicaAplicacion instance = null;
        boolean expResult = false;
        boolean result = instance.sincronizarReloj();
        assertEquals(expResult, result);
    }

    /**
     * Test of agregarHora method, of class LogicaAplicacion.
     */
    @Test
    public void testAgregarHora() {
        System.out.println("agregarHora");
        Mensaje mensaje = null;
        LogicaAplicacion instance = null;
        boolean expResult = false;
        boolean result = instance.agregarHora(mensaje);
        assertEquals(expResult, result);
    }
    
}
