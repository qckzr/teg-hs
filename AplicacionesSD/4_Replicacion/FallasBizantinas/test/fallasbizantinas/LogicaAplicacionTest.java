/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package fallasbizantinas;

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
     * Test of contarRepeticion method, of class LogicaAplicacion.
     */
    @Test
    public void testContarRepeticion() {
        System.out.println("contarRepeticion");
        int valor = 0;
        int[] vector = null;
        LogicaAplicacion instance = null;
        int expResult = 0;
        int result = instance.contarRepeticion(valor, vector);
        assertEquals(expResult, result);

    }


    /**
     * Test of valorAleatorio method, of class LogicaAplicacion.
     */
    @Test
    public void testValorAleatorio() {
        System.out.println("valorAleatorio");
        LogicaAplicacion instance = null;
        String expResult = "";
        String result = instance.valorAleatorio();
        assertEquals(expResult, result);
    }
    
}
