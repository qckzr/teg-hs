/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package grupo_emisor;

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
     * Test of comprobarConexionGrupo method, of class LogicaAplicacion.
     */
    @Test
    public void testComprobarConexionGrupo() {
        System.out.println("comprobarConexionGrupo");
        String ipHost = "";
        LogicaAplicacion instance = null;
        boolean expResult = false;
        boolean result = instance.comprobarConexionGrupo(ipHost);
        assertEquals(expResult, result);
    }

    /**
     * Test of enviarMensaje method, of class LogicaAplicacion.
     */
    @Test
    public void testEnviarMensaje() {
        System.out.println("enviarMensaje");
        String mensaje = "";
        LogicaAplicacion instance = null;
        boolean expResult = false;
        boolean result = instance.enviarMensaje(mensaje);
        assertEquals(expResult, result);

    }

    /**
     * Test of evaluarMensaje method, of class LogicaAplicacion.
     */
    @Test
    public void testEvaluarMensaje() {
        System.out.println("evaluarMensaje");
        Mensaje mensaje = null;
        LogicaAplicacion instance = null;
        boolean expResult = false;
        boolean result = instance.evaluarMensaje(mensaje);
        assertEquals(expResult, result);
    }

    
    
}
