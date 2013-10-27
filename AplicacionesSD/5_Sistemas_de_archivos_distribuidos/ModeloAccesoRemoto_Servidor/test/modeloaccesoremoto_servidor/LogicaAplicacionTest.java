/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package modeloaccesoremoto_servidor;

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
     * Test of escribirArchivo method, of class LogicaAplicacion.
     */
    @Test
    public void testEscribirArchivo() {
        System.out.println("escribirArchivo");
        Mensaje mensaje = null;
        LogicaAplicacion instance = null;
        boolean expResult = false;
        boolean result = instance.escribirArchivo(mensaje);
        assertEquals(expResult, result);
    }

    /**
     * Test of leerArchivo method, of class LogicaAplicacion.
     */
    @Test
    public void testLeerArchivo() {
        System.out.println("leerArchivo");
        LogicaAplicacion instance = null;
        boolean expResult = false;
        boolean result = instance.leerArchivo();
        assertEquals(expResult, result);
    }
    
}
