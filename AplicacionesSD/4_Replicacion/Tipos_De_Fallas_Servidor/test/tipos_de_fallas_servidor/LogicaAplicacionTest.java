/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package tipos_de_fallas_servidor;

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
     * Test of evaluarMensaje method, of class LogicaAplicacion.
     */
    @Test
    public void testEvaluarMensaje() {
        System.out.println("evaluarMensaje");
        Mensaje mensaje = new Mensaje("localhost","holamund0");
        LogicaAplicacion instance = LogicaAplicacion.getInstancia(
                new LibreriaMensajes(true), null, 1337);
        boolean expResult = true;
        boolean result = instance.evaluarMensaje(mensaje);
        assertEquals(expResult, result);
    }

    /**
     * Test of enviarMensajeRespuesta method, of class LogicaAplicacion.
     */
    @Test
    public void testEnviarMensajeRespuesta() {
        System.out.println("enviarMensajeRespuesta");
        Mensaje mensaje = new Mensaje("localhost","holamund0");
        int opcion = 0;
        LogicaAplicacion instance = LogicaAplicacion.getInstancia(
                new LibreriaMensajes(true), null, 1337);
        boolean expResult = true;
        boolean result = instance.enviarMensajeRespuesta(mensaje, opcion);
        assertEquals(expResult, result);
    }
    
}
