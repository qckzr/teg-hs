/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package p2p;

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
    public void testEnviarMensaje_Mensaje() {
        System.out.println("enviarMensaje");
        Mensaje mensaje = new Mensaje("localhost","asd");
        LibreriaMensajes libreriaMensajes = new LibreriaMensajes(true);
        LogicaAplicacion instance = LogicaAplicacion.getInstancia(
                libreriaMensajes, null, 2000,"localhost");
        boolean expResult = false;
        boolean result = instance.enviarMensaje(mensaje);
        assertEquals(expResult, result);
    }

    /**
     * Test of enviarMensaje method, of class LogicaAplicacion.
     */
    @Test
    public void testEnviarMensaje_String_String() {
        System.out.println("enviarMensaje");
        String mensaje = "holamund0";
        String ipOrigen = "localhost";
        LibreriaMensajes libreriaMensajes = new LibreriaMensajes(true);
        LogicaAplicacion instance = LogicaAplicacion.getInstancia(libreriaMensajes, null,
                2000, ipOrigen);
        boolean expResult = false;
        boolean result = instance.enviarMensaje(mensaje, ipOrigen);
        assertEquals(expResult, result);
    }

    /**
     * Test of evaluarMensaje method, of class LogicaAplicacion.
     */
    @Test
    public void testEvaluarMensaje() {
        System.out.println("evaluarMensaje");
        Mensaje mensaje = new Mensaje("localhost","holamund0");
        LibreriaMensajes libreriaMensajes = new LibreriaMensajes(true);
        libreriaMensajes.agregarIpDestino("127");
        LogicaAplicacion instance = LogicaAplicacion.getInstancia(libreriaMensajes,
                null, 5000, "localhost");
        boolean expResult = false;
        try {
        boolean result = instance.evaluarMensaje(mensaje);
        
        assertEquals(expResult, result);
        } catch (Exception e){
            
        }        
    }
}
