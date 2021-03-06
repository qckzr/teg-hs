/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package anillo;

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
    public void testEnviarMensaje_0args() {
        System.out.println("enviarMensaje");
        LibreriaMensajes libreriaMensajes = new LibreriaMensajes(true);
        libreriaMensajes.agregarIpDestino("localhost");
        LogicaAplicacion instance = LogicaAplicacion.getInstancia(
                libreriaMensajes, new DatosAplicacion("1","1"),1337,"localhost");
        boolean expResult = false;
        boolean result = instance.enviarMensaje();
        assertEquals(expResult, result);
    }

    /**
     * Test of enviarMensaje method, of class LogicaAplicacion.
     */
    @Test
    public void testEnviarMensaje_String_int() {
        System.out.println("enviarMensaje");
        String mensaje = "";
        int tipo = 0;
        LogicaAplicacion instance = LogicaAplicacion.getInstancia(
                new LibreriaMensajes(true), new DatosAplicacion("1","1"),1337,"localhost");
        boolean expResult = false;
        boolean result = instance.enviarMensaje(mensaje, tipo);
        assertEquals(expResult, result);
    }

    /**
     * Test of evaluarMensaje method, of class LogicaAplicacion.
     */
    @Test
    public void testEvaluarMensaje() {
        System.out.println("evaluarMensaje");
        Mensaje mensaje = new Mensaje("localhost","192.168.1.191:1337");
        LogicaAplicacion instance = LogicaAplicacion.getInstancia(
                new LibreriaMensajes(true), null, 1337,"localhost");
        boolean expResult = true;
        boolean result = instance.evaluarMensaje(mensaje);
        assertEquals(expResult, result);
    }
    
}
