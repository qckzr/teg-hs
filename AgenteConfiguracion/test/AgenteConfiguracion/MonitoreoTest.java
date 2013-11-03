/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package AgenteConfiguracion;

import Libreria.LibreriaMensajes;
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
public class MonitoreoTest {
    
    public MonitoreoTest() {
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
     * Test of comprobarAplicacionActiva method, of class Monitoreo.
     */
    @Test
    public void testComprobarAplicacionActiva() {
        System.out.println("comprobarAplicacionActiva");
        LibreriaMensajes libreriaMensajes = new LibreriaMensajes(false);
        Monitoreo instance = new Monitoreo(libreriaMensajes);
        boolean expResult = false;
        boolean result = instance.comprobarAplicacionActiva();
        assertEquals(expResult, result);
    }

    /**
     * Test of procesosActivos method, of class Monitoreo.
     */
    @Test
    public void testProcesosActivos() {
        System.out.println("procesosActivos");
        LibreriaMensajes libreriaMensajes = new LibreriaMensajes(false);
        Monitoreo instance = new Monitoreo(libreriaMensajes);
        String expResult = "123";
        String result = instance.procesosActivos();
        assertNotSame(expResult, result);
    }

    /**
     * Test of memoriaDisponible method, of class Monitoreo.
     */
    @Test
    public void testMemoriaDisponible() {
        System.out.println("memoriaDisponible");
        LibreriaMensajes libreriaMensajes = new LibreriaMensajes(false);
        Monitoreo instance = new Monitoreo(libreriaMensajes);
        String expResult = "";
        String result = instance.memoriaDisponible();
        assertEquals(expResult, result);

    }

    /**
     * Test of usoCpu method, of class Monitoreo.
     */
    @Test
    public void testUsoCpu() {
        System.out.println("usoCpu");
        LibreriaMensajes libreriaMensajes = new LibreriaMensajes(false);
        Monitoreo instance = new Monitoreo(libreriaMensajes);
        String expResult = "";
        String result = instance.usoCpu();
        assertNotSame(expResult, result);
    }

    /**
     * Test of direccionIp method, of class Monitoreo.
     */
    @Test
    public void testDireccionIp() {
        System.out.println("direccionIp");
        String intefaz = "asd";
        LibreriaMensajes libreriaMensajes = new LibreriaMensajes(false);
        Monitoreo instance = new Monitoreo(libreriaMensajes);
        String expResult = "";
        String result = instance.direccionIp(intefaz);
        assertEquals(expResult, result);
    }

    /**
     * Test of puertosDiponibles method, of class Monitoreo.
     */
    @Test
    public void testPuertosDiponibles() {
        System.out.println("puertosDiponibles");
        LibreriaMensajes libreriaMensajes = new LibreriaMensajes(false);
        Monitoreo instance = new Monitoreo(libreriaMensajes);
        String expResult = "";
        String result = instance.puertosDiponibles();
        assertEquals(expResult, result);
    }

    /**
     * Test of aplicacionActiva method, of class Monitoreo.
     */
    @Test
    public void testAplicacionActiva() {
        System.out.println("aplicacionActiva");
        String ip = "localhost";
        LibreriaMensajes libreriaMensajes = new LibreriaMensajes(false);
        Monitoreo instance = new Monitoreo(libreriaMensajes);
        String expResult = "";
        String result = instance.aplicacionActiva(ip);
        assertEquals(expResult, result);
    }

    /**
     * Test of numeroNodo method, of class Monitoreo.
     */
    @Test
    public void testNumeroNodo() {
        System.out.println("numeroNodo");
        String ip = "localhost";
        LibreriaMensajes libreriaMensajes = new LibreriaMensajes(false);
        Monitoreo instance = new Monitoreo(libreriaMensajes);
        String expResult = "";
        String result = instance.numeroNodo(ip);
        assertEquals(expResult, result);
    }

    /**
     * Test of idProceso method, of class Monitoreo.
     */
    @Test
    public void testIdProceso() {
        System.out.println("idProceso");
        Monitoreo instance = new Monitoreo(null);
        String expResult = "";
        String result = instance.idProceso();
        assertEquals(expResult, result);
    }
    
    /**
     * Test of comprobarConexion method, of class Monitoreo.
     */
    @Test
    public void testComprobarConexion() {
        System.out.println("idProceso");
        LibreriaMensajes libreriaMensajes = new LibreriaMensajes(false);
        libreriaMensajes.agregarIpDestino("192.168.1.199");
        Monitoreo instance = new Monitoreo(libreriaMensajes);
        boolean expResult = false;
        boolean result = instance.comprobarConexion();
        assertEquals(expResult, result);
    }
    
}
