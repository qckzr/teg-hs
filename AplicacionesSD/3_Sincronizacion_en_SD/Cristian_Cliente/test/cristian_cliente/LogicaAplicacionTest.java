/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package cristian_cliente;

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
     * Test of enviarMensaje method, of class LogicaAplicacion.
     */
    @Test
    public void testEnviarMensaje() {
        System.out.println("enviarMensaje");
        String mensaje = "";
        LibreriaMensajes libreriaMensajes = new LibreriaMensajes(true);
        LogicaAplicacion instance = LogicaAplicacion.getInstancia(
                libreriaMensajes, null, 1337,"localhost", "5000");
        boolean expResult = false;
        boolean result = instance.enviarMensaje(mensaje);
        assertEquals(expResult, result);
        
    }

    /**
     * Test of sincronizarReloj method, of class LogicaAplicacion.
     */
    @Test
    public void testSincronizarReloj() {
        System.out.println("sincronizarReloj");
        Mensaje mensaje = new Mensaje(null, null);
        LibreriaMensajes libreriaMensajes = new LibreriaMensajes(true);
        LogicaAplicacion instance = LogicaAplicacion.getInstancia(
                libreriaMensajes, null, 1337,"localhost", "5000");
        boolean expResult = true;
        boolean result = instance.sincronizarReloj(mensaje);
        assertEquals(expResult, result);
        
    }
    
}
