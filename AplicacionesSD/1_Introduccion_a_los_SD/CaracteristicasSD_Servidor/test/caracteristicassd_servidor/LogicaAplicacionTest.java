/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package caracteristicassd_servidor;

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
     * Test of servidorWeb method, of class LogicaAplicacion.
     */
    @Test
    public void testServidorWeb() {
        System.out.println("servidorWeb");
        int opcion = 0;
        LogicaAplicacion instance = LogicaAplicacion.getInstance(
                new LibreriaMensajes(true), null, 1337,"localhost");
        boolean expResult = true;
        boolean result = instance.servidorWeb(opcion);
        assertEquals(expResult, result);

    }

    /**
     * Test of leerArchivo method, of class LogicaAplicacion.
     */
    @Test
    public void testLeerArchivo() {
        System.out.println("leerArchivo");
        LogicaAplicacion instance = LogicaAplicacion.getInstance(
                new LibreriaMensajes(true), null, 1337,"localhost");
        boolean expResult = false;
        boolean result = instance.leerArchivo();
        assertEquals(expResult, result);
    }

    /**
     * Test of enviarInformacionSiguienteNodo method, of class LogicaAplicacion.
     */
    @Test
    public void testEnviarInformacionSiguienteNodo() {
        System.out.println("enviarInformacionSiguienteNodo");
        int opcion = 0;
        LogicaAplicacion instance = LogicaAplicacion.getInstance(
                new LibreriaMensajes(true), null, 1337,"localhost");
        boolean expResult = false;
        boolean result = instance.enviarInformacionSiguienteNodo(opcion);
        assertEquals(expResult, result);

    }

    /**
     * Test of imprimirPagina method, of class LogicaAplicacion.
     */
    @Test
    public void testImprimirPagina() {
        System.out.println("imprimirPagina");
        LogicaAplicacion instance = LogicaAplicacion.getInstance(
                new LibreriaMensajes(true), null, 1337,"localhost");
        boolean expResult = false;
        boolean result = instance.imprimirPagina();
        assertEquals(expResult, result);
    }

    /**
     * Test of preguntarEstado method, of class LogicaAplicacion.
     */
    @Test
    public void testPreguntarEstado() {
        System.out.println("preguntarEstado");
        LogicaAplicacion instance = LogicaAplicacion.getInstance(
                new LibreriaMensajes(true), null, 1337,"localhost");
        boolean expResult = false;
        boolean result = instance.preguntarEstado();
        assertEquals(expResult, result);
    }

    /**
     * Test of enviarEstado method, of class LogicaAplicacion.
     */
    @Test
    public void testEnviarEstado() {
        System.out.println("enviarEstado");
        LogicaAplicacion instance = LogicaAplicacion.getInstance(
                new LibreriaMensajes(true), null, 1337,"localhost");
        boolean expResult = false;
        boolean result = instance.enviarEstado();
        assertEquals(expResult, result);
    }

    
    
}
