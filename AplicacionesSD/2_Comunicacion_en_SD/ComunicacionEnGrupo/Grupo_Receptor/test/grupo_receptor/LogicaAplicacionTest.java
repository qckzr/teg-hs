/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package grupo_receptor;

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
     * Test of enviarPresenciaEmisor method, of class LogicaAplicacion.
     */
    @Test
    public void testEnviarPresenciaEmisor() {
        System.out.println("enviarPresenciaEmisor");
        LogicaAplicacion instance = LogicaAplicacion.getInstancia(
                new LibreriaMensajes(true), new DatosAplicacion("asd","1"),
                1337,"localhost");
        boolean expResult = false;
        boolean result = instance.enviarPresenciaEmisor();
        assertEquals(expResult, result);
    }
    
}
