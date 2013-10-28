/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package distribuido;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;
import java.util.ArrayList;
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
    public void testEnviarMensaje_Mensaje() {
        System.out.println("enviarMensaje");
        Mensaje mensaje = new Mensaje("localhost","holamund0");
        LogicaAplicacion instance = LogicaAplicacion.getInstancia(
                new LibreriaMensajes(true), null,1337);
        boolean expResult = true;
        boolean result = instance.enviarMensaje(mensaje);
        assertEquals(expResult, result);
        
    }

    /**
     * Test of enviarMensaje method, of class LogicaAplicacion.
     */
    @Test
    public void testEnviarMensaje_0args() {
        System.out.println("enviarMensaje");
        LogicaAplicacion instance = LogicaAplicacion.getInstancia(
                new LibreriaMensajes(true), null,1337);
        boolean expResult = false;
        boolean result = instance.enviarMensaje();
        assertEquals(expResult, result);
        
    }

    /**
     * Test of comprobarNodo method, of class LogicaAplicacion.
     */
    @Test
    public void testComprobarNodo() {
        System.out.println("comprobarNodo");
        Mensaje mensaje = new Mensaje("localhost","_:asd");
        LogicaAplicacion instance = LogicaAplicacion.getInstancia(
                new LibreriaMensajes(true), null,1337);
        boolean expResult = true;
        boolean result = instance.comprobarNodo(mensaje);
        assertEquals(expResult, result);
        
    }

    

    /**
     * Test of agregarOk method, of class LogicaAplicacion.
     */
    @Test
    public void testAgregarOk() {
        System.out.println("agregarOk");
        LogicaAplicacion instance = LogicaAplicacion.getInstancia(
                new LibreriaMensajes(true), null, 1337);
        boolean expResult = false;
        boolean result = instance.agregarOk();
        assertEquals(expResult, result);
    }
    
}
