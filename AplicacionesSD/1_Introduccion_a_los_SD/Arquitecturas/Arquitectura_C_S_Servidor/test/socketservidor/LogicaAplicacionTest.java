/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package socketservidor;

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
     * Test of enviarMensajeRespuesta method, of class LogicaAplicacion.
     */
    @Test
    public void testEnviarMensajeRespuesta() {
        System.out.println("enviarMensajeRespuesta");
        Mensaje mensajeRecibido = new Mensaje(null, null);
        LibreriaMensajes libreriaMensajes = new LibreriaMensajes(true);
        LogicaAplicacion instance = LogicaAplicacion.getInstance(
                libreriaMensajes, null, 2000);
        boolean expResult = false;
        boolean result = instance.enviarMensajeRespuesta(mensajeRecibido);
        assertEquals(expResult, result);
    }

    
}
