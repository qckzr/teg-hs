/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rmi_cliente;

import rmi.DatosAplicacion;
import rmi.LogicaAplicacion;
import Libreria.LibreriaMensajes;
import Libreria.Mensaje;
import java.rmi.registry.Registry;
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
     * Test of iniciarCliente method, of class LogicaAplicacion.
     */
    @Test
    public void testIniciarCliente() {
        System.out.println("iniciarCliente");
        boolean expResult = false;
        LogicaAplicacion logicaAplicacion = LogicaAplicacion.getInstancia(
                new LibreriaMensajes(expResult), null, 1337,"localhost");
        boolean result = logicaAplicacion.iniciarCliente();
        assertEquals(expResult, result);

    }

    /**
     * Test of mensaje method, of class LogicaAplicacion.
     */
    @Test
    public void testMensaje() {
        System.out.println("mensaje");
        String mensaje = "holamund0";
        LogicaAplicacion instance = LogicaAplicacion.getInstancia(
                new LibreriaMensajes(true), null, 1337, "localhost");
        boolean expResult = false;
        boolean result = instance.mensaje(mensaje);
        assertEquals(expResult, result);
    }

    
    
}
