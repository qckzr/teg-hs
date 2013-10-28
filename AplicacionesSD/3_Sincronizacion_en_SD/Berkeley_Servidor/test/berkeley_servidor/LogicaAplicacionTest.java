/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package berkeley_servidor;

import Libreria.*;
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
     * Test of agregarNodo method, of class LogicaAplicacion.
     */
    @Test
    public void testAgregarNodo() {
        System.out.println("agregarNodo");
        Mensaje mensaje = new Mensaje("localhost", null);
        LibreriaMensajes libreriaMensajes = new LibreriaMensajes(true);
        LogicaAplicacion instance = LogicaAplicacion.getInstancia(
                libreriaMensajes, null, 1337,5000);
        boolean expResult = true;
        boolean result = instance.agregarNodo(mensaje);
        assertEquals(expResult, result);
    }

    /**
     * Test of agregarHora method, of class LogicaAplicacion.
     */
    @Test
    public void testAgregarHora() {
        System.out.println("agregarHora");
        Mensaje mensaje = new Mensaje(null, null);
        LibreriaMensajes libreriaMensajes = new LibreriaMensajes(true);
        LogicaAplicacion instance = LogicaAplicacion.getInstancia(
                libreriaMensajes, null, 1337,5000);
        boolean expResult = true;
        boolean result = instance.agregarHora(mensaje);
        assertEquals(expResult, result);

    }

    /**
     * Test of comprobarPromedio method, of class LogicaAplicacion.
     */
    @Test
    public void testComprobarPromedio() {
        System.out.println("comprobarPromedio");
        LibreriaMensajes libreriaMensajes = new LibreriaMensajes(true);
        LogicaAplicacion instance = LogicaAplicacion.getInstancia(
                libreriaMensajes, null, 1337,5000);
        boolean expResult = true;
        boolean result = instance.comprobarPromedio();
        assertEquals(expResult, result);
    }

    

    
}
