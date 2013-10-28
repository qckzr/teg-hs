/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package cluster;

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
     * Test of solicitarArchivo method, of class LogicaAplicacion.
     */
    @Test
    public void testSolicitarArchivo() {
        System.out.println("solicitarArchivo");
        String fichero = "archivo1";
        String servidor = "localhost";
        int puerto = 1337;
        LogicaAplicacion instance = LogicaAplicacion.getInstancia(
                new LibreriaMensajes(true), null, 1337);
        boolean expResult = false;
        boolean result = instance.solicitarArchivo(fichero, servidor, puerto);
        assertEquals(expResult, result);
    }

    /**
     * Test of esperarArchivos method, of class LogicaAplicacion.
     */
    @Test
    public void testEsperarArchivos() {
        System.out.println("esperarArchivos");
        LogicaAplicacion instance = LogicaAplicacion.getInstancia(
                new LibreriaMensajes(true), null, 1337);
        instance.getNodos().add("localhost");
        instance.getNodos().add("localhost");
        instance.getNodos().add("localhost");
        boolean expResult = true;
        boolean result = instance.esperarArchivos();
        assertEquals(expResult, result);
    }
    
}
