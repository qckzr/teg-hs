/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package centralizado_cliente;

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
     * Test of verificarMensaje method, of class LogicaAplicacion.
     */
    @Test
    public void testVerificarMensaje() {
        System.out.println("verificarMensaje");
        Mensaje mensaje = new Mensaje("","");
        LogicaAplicacion instance = LogicaAplicacion.getInstancia(
                new LibreriaMensajes(true), null, 1337, "localhost");
        boolean expResult = false;
        boolean result = instance.verificarMensaje(mensaje);
        assertEquals(expResult, result);
       
    }

        
    
}
