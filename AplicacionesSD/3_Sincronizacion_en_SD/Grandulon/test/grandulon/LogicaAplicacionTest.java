/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package grandulon;

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
     * Test of recibirMensaje method, of class LogicaAplicacion.
     */
    @Test
    public void testRecibirMensaje() {
        System.out.println("recibirMensaje");
        Mensaje mensaje = null;
        LogicaAplicacion instance = null;
        boolean expResult = false;
        boolean result = instance.recibirMensaje(mensaje);
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
     * Test of enviarMensaje method, of class LogicaAplicacion.
     */
    @Test
    public void testEnviarMensaje_String() {
        System.out.println("enviarMensaje");
        String mensaje = "";
        LogicaAplicacion instance = null;
        boolean expResult = false;
        boolean result = instance.enviarMensaje(mensaje);
        assertEquals(expResult, result);
        
    }

    /**
     * Test of evaluarMensaje method, of class LogicaAplicacion.
     */
    @Test
    public void testEvaluarMensaje() {
        System.out.println("evaluarMensaje");
        Mensaje mensaje = null;
        LogicaAplicacion instance = null;
        boolean expResult = false;
        boolean result = instance.evaluarMensaje(mensaje);
        assertEquals(expResult, result);
        
    }

    /**
     * Test of agregarNodos method, of class LogicaAplicacion.
     */
    @Test
    public void testAgregarNodos() {
        System.out.println("agregarNodos");
        String nodosMenores = "";
        String nodosMayores = "";
        LogicaAplicacion instance = null;
        instance.agregarNodos(nodosMenores, nodosMayores);
        
    }

    /**
     * Test of validarNodo method, of class LogicaAplicacion.
     */
    @Test
    public void testValidarNodo() {
        System.out.println("validarNodo");
        String ip = "";
        LogicaAplicacion instance = null;
        boolean expResult = false;
        boolean result = instance.validarNodo(ip);
        assertEquals(expResult, result);
        
    }

    /**
     * Test of eliminarNodosCaidos method, of class LogicaAplicacion.
     */
    @Test
    public void testEliminarNodosCaidos() {
        System.out.println("eliminarNodosCaidos");
        LogicaAplicacion instance = null;
        boolean expResult = false;
        boolean result = instance.eliminarNodosCaidos();
        assertEquals(expResult, result);
    }
    
}
