/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package desafios;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;
import java.io.ObjectOutputStream;
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
     * Test of enviaFichero method, of class LogicaAplicacion.
     */
    @Test
    public void testEnviaFichero() {
        System.out.println("enviaFichero");
        String fichero = "";
        ObjectOutputStream oos = null;
        LogicaAplicacion instance = LogicaAplicacion.getInstance(
                new LibreriaMensajes(true), null, 1337);
        boolean expResult = false;
        boolean result = instance.enviaFichero(fichero, oos);
        assertEquals(expResult, result);
    }

    /**
     * Test of enviarHash method, of class LogicaAplicacion.
     */
    @Test
    public void testEnviarHash() {
        System.out.println("enviarHash");
        String archivo = "";
        ObjectOutputStream objectOutputStream = null;
        LogicaAplicacion instance = LogicaAplicacion.getInstance(
                new LibreriaMensajes(true), null, 1337);
        boolean expResult = false;
        boolean result = instance.enviarHash(archivo, objectOutputStream);
        assertEquals(expResult, result);
    }
    
}
