/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package centralizado_servidor;

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
     * Test of verificarRegion method, of class LogicaAplicacion.
     */
    @Test
    public void testVerificarRegion() {
        System.out.println("verificarRegion");
        String mensaje = "2:asd";
        LibreriaMensajes libreriaMensajes = new LibreriaMensajes(true);
        LogicaAplicacion instance = LogicaAplicacion.getInstancia(
                libreriaMensajes, null, 2000);
       instance.getRegionCriticaOcupada().add("localhost");
        
        boolean expResult = false;
        boolean result = instance.verificarRegion(mensaje);
        assertEquals(expResult, result);
    }

    

    /**
     * Test of responderNodo method, of class LogicaAplicacion.
     */
    @Test
    public void testResponderNodo() {
        System.out.println("responderNodo");
        Mensaje mensaje = new Mensaje("123","2:asd");
        LibreriaMensajes libreriaMensajes = new LibreriaMensajes(true);
        LogicaAplicacion instance = LogicaAplicacion.getInstancia
        (libreriaMensajes, null, 1337);
        boolean expResult = false;
        boolean result = instance.responderNodo(mensaje);
        assertEquals(expResult, result);

    }

    
    
}
