/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package socket;

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
     * Test of enviarMensajeNodo method, of class LogicaAplicacion.
     */
    @Test
    public void testEnviarMensajeNodo() {
        System.out.println("enviarMensajeNodo");
        int opcion = 0;
        String idNodo = "";
        String mensajeRecibido = "";
        LibreriaMensajes libreriaMensajes = new LibreriaMensajes(false);
        LogicaAplicacion instance = LogicaAplicacion.getInstancia(libreriaMensajes, null, opcion);
        boolean expResult = false;
        boolean result = instance.enviarMensajeNodo(opcion, idNodo, mensajeRecibido);
        assertEquals(expResult, result);
    }


    /**
     * Test of agregarDestinatario method, of class LogicaAplicacion.
     */
    @Test
    public void testAgregarDestinatario() {
        System.out.println("agregarDestinatario");
        String id = "";
        String ip = "";
        LibreriaMensajes libreriaMensajes = new LibreriaMensajes(false);
        LogicaAplicacion instance = LogicaAplicacion.getInstancia(libreriaMensajes, null, 2000);
        boolean expResult = true;
        boolean result = instance.agregarDestinatario(id, ip);
        assertEquals(expResult, result);
    }

    /**
     * Test of buscarIpNodo method, of class LogicaAplicacion.
     */
    @Test
    public void testBuscarIpNodo() {
        System.out.println("buscarIpNodo");
        String id = "";
        LibreriaMensajes libreriaMensajes = new LibreriaMensajes(false);
        LogicaAplicacion instance = LogicaAplicacion.getInstancia(
                libreriaMensajes, null, 2000);
        String expResult = "";
        String result = instance.buscarIpNodo(id);
        assertEquals(expResult, result);
    }

    /**
     * Test of evaluarMensaje method, of class LogicaAplicacion.
     */
    @Test
    public void testEvaluarMensaje() {
        System.out.println("evaluarMensaje");
        Mensaje mensaje = new Mensaje("192.168.1.191","Respuesta_");
        mensaje.setIpOrigen("localhost");
        LibreriaMensajes libreriaMensajes = new LibreriaMensajes();
        libreriaMensajes.agregarIpDestino("localhost");
        
        LogicaAplicacion instance = LogicaAplicacion.getInstancia(
                libreriaMensajes, null, 2000);
        
        boolean expResult = true;
        boolean result = instance.evaluarMensaje(mensaje);
        assertEquals(expResult, result);
    }
    
}
