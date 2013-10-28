/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package ldap_servidor;

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
        boolean expResult = false;
        boolean result = instance.evaluarMensaje(mensaje);
        assertEquals(expResult, result);
    }

    

    /**
     * Test of buscarDominio method, of class LogicaAplicacion.
     */
    @Test
    public void testBuscarDominio() {
        System.out.println("buscarDominio");
        String dc1 = "";
        String dc2 = "";
        LogicaAplicacion instance = LogicaAplicacion.getInstancia(
                new LibreriaMensajes(true), null, 1337);
        Dominio expResult = null;
        Dominio result = instance.buscarDominio(dc1, dc2);
        assertEquals(expResult, result);
        
    }

    /**
     * Test of buscarCliente method, of class LogicaAplicacion.
     */
    @Test
    public void testBuscarCliente_Dominio_String() {
        System.out.println("buscarCliente");
        
        String cn = "";
        LogicaAplicacion instance = LogicaAplicacion.getInstancia(
                new LibreriaMensajes(true), null, 1337);
        Dominio dominio = instance.getDominios().get(0);
        Cliente expResult = null;
        Cliente result = instance.buscarCliente(dominio, cn);
        assertEquals(expResult, result);
    }

    /**
     * Test of buscarCliente method, of class LogicaAplicacion.
     */
    @Test
    public void testBuscarCliente_String() {
        System.out.println("buscarCliente");
        String cn = "";
        LogicaAplicacion instance = LogicaAplicacion.getInstancia(
                new LibreriaMensajes(true), null, 1337);
        Cliente expResult = null;
        Cliente result = instance.buscarCliente(cn);
        assertEquals(expResult, result);
        
    }

    /**
     * Test of agregarCliente method, of class LogicaAplicacion.
     */
    @Test
    public void testAgregarCliente() {
        System.out.println("agregarCliente");
        String mensaje = "";
        LogicaAplicacion instance = LogicaAplicacion.getInstancia(
                new LibreriaMensajes(true), null, 1337);
        boolean expResult = false;
        boolean result = instance.agregarCliente(mensaje);
        assertEquals(expResult, result);
        
    }

    /**
     * Test of eliminarCliente method, of class LogicaAplicacion.
     */
    @Test
    public void testEliminarCliente() {
        System.out.println("eliminarCliente");
        String cn = "";
        LogicaAplicacion instance = LogicaAplicacion.getInstancia(
                new LibreriaMensajes(true), null, 1337);
        boolean expResult = false;
        boolean result = instance.eliminarCliente(cn);
        assertEquals(expResult, result);
        
    }
    
}
