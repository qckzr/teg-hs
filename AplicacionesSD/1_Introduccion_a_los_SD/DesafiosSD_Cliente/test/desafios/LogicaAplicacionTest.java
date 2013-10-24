/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package desafios;

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
     * Test of verificarMensajeRecibido method, of class LogicaAplicacion.
     */
    @Test
    public void testVerificarMensajeRecibido() {
        System.out.println("verificarMensajeRecibido");
        Mensaje mensaje = null;
        LogicaAplicacion instance = null;
        boolean expResult = false;
        boolean result = instance.verificarMensajeRecibido(mensaje);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    

    /**
     * Test of conectarse method, of class LogicaAplicacion.
     */
    @Test
    public void testConectarse() {
        System.out.println("conectarse");
        String ip = "";
        int puerto = 0;
        LogicaAplicacion instance = null;
        boolean expResult = false;
        boolean result = instance.conectarse(ip, puerto);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }


    /**
     * Test of hashArchivo method, of class LogicaAplicacion.
     */
    @Test
    public void testHashArchivo() {
        System.out.println("hashArchivo");
        String archivo = "";
        LogicaAplicacion instance = null;
        String expResult = "";
        String result = instance.hashArchivo(archivo);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of retornarArchivo method, of class LogicaAplicacion.
     */
    @Test
    public void testRetornarArchivo() {
        System.out.println("retornarArchivo");
        String mensaje = "";
        LogicaAplicacion instance = null;
        String expResult = "";
        String result = instance.retornarArchivo(mensaje);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

   
    
}
