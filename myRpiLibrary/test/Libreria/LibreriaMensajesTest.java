/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Libreria;

import agente.InformacionAgente;
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
public class LibreriaMensajesTest {
    
    public LibreriaMensajesTest() {
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
     * Test of getMensajesRecibidos method, of class LibreriaMensajes.
     */
    @Test
    public void testGetMensajesRecibidos() {
        System.out.println("getMensajesRecibidos");
        LibreriaMensajes instance = new LibreriaMensajes(false);
        ArrayList<Mensaje> expResult = instance.getMensajesRecibidos();
        ArrayList<Mensaje> result = instance.getMensajesRecibidos();
        assertEquals(expResult, result);
    }

    /**
     * Test of setMensajesRecibidos method, of class LibreriaMensajes.
     */
    @Test
    public void testSetMensajesRecibidos() {
        System.out.println("setMensajesRecibidos");
        ArrayList<Mensaje> mensajesRecibidos = null;
        LibreriaMensajes instance = new LibreriaMensajes(false);
        instance.setMensajesRecibidos(mensajesRecibidos);
    }

    /**
     * Test of getPuerto method, of class LibreriaMensajes.
     */
    @Test
    public void testGetPuerto() {
        System.out.println("getPuerto");
        int expResult = 1337;
        int result = LibreriaMensajes.getPuerto();
        assertEquals(expResult, result);
    }

    /**
     * Test of getMensajesAgente method, of class LibreriaMensajes.
     */
    @Test
    public void testGetMensajesAgente() {
        System.out.println("getMensajesAgente");
        LibreriaMensajes instance = new LibreriaMensajes(false);
        ArrayList<InformacionAgente> expResult = new ArrayList<InformacionAgente>();
        ArrayList<InformacionAgente> result = instance.getMensajesAgente();
        assertEquals(expResult, result);
    }


    /**
     * Test of enviarMensaje method, of class LibreriaMensajes.
     */
    @Test
    public void testEnviarMensaje_String() {
        System.out.println("enviarMensaje");
        String mensaje = "hola";
        LibreriaMensajes instance = new LibreriaMensajes(false);
        boolean expResult = false;
        boolean result = instance.enviarMensaje(mensaje);
        assertEquals(expResult, result);
    }

    /**
     * Test of enviarMensaje method, of class LibreriaMensajes.
     */
    @Test
    public void testEnviarMensaje_String_String() {
        System.out.println("enviarMensaje");
        String mensaje = "hola";
        String ipDestino = "localhost";
        LibreriaMensajes instance = new LibreriaMensajes(false);
        boolean expResult = false;
        boolean result = instance.enviarMensaje(mensaje, ipDestino);
        assertEquals(expResult, result);
    }

    /**
     * Test of enviarMensaje method, of class LibreriaMensajes.
     */
    @Test
    public void testEnviarMensaje_3args_1() {
        System.out.println("enviarMensaje");
        String mensaje = "hola";
        String ipDestino = "localhost";
        int puerto = 1337;
        LibreriaMensajes instance = new LibreriaMensajes(false);
        boolean expResult = false;
        boolean result = instance.enviarMensaje(mensaje, ipDestino, puerto);
        assertEquals(expResult, result);
    }

    /**
     * Test of enviarMensaje method, of class LibreriaMensajes.
     */
    @Test
    public void testEnviarMensaje_Mensaje() {
        System.out.println("enviarMensaje");
        Mensaje mensaje = new Mensaje(null, null);
        LibreriaMensajes instance = new LibreriaMensajes(false);
        instance.agregarIpDestino("localhost");
        boolean expResult = false;
        boolean result = instance.enviarMensaje(mensaje);
        assertEquals(expResult, result);
    }

    /**
     * Test of enviarMensaje method, of class LibreriaMensajes.
     */
    @Test
    public void testEnviarMensaje_Mensaje_String() {
        System.out.println("enviarMensaje");
        Mensaje mensaje = new Mensaje(null, null);
        String ipDestino = "localhost";
        LibreriaMensajes instance = new LibreriaMensajes(false);
        boolean expResult = false;
        boolean result = instance.enviarMensaje(mensaje, ipDestino);
        assertEquals(expResult, result);
    }

    /**
     * Test of enviarMensaje method, of class LibreriaMensajes.
     */
    @Test
    public void testEnviarMensaje_3args_2() {
        System.out.println("enviarMensaje");
        Mensaje mensaje = new Mensaje(null, null);
        String ipDestino = "localhost";
        int puerto = 1337;
        LibreriaMensajes instance = new LibreriaMensajes(false);
        boolean expResult = false;
        boolean result = instance.enviarMensaje(mensaje, ipDestino, puerto);
        assertEquals(expResult, result);
    }

    /**
     * Test of enviarMensaje method, of class LibreriaMensajes.
     */
    @Test
    public void testEnviarMensaje_InformacionAgente() {
        System.out.println("enviarMensaje");
        InformacionAgente informacion = new InformacionAgente();
        LibreriaMensajes instance = new LibreriaMensajes(false);
        boolean expResult = false;
        boolean result = instance.enviarMensaje(informacion);
        assertEquals(expResult, result);
    }

    /**
     * Test of enviarMensaje method, of class LibreriaMensajes.
     */
    @Test
    public void testEnviarMensaje_InformacionAgente_String() {
        System.out.println("enviarMensaje");
        InformacionAgente informacionAgente = new InformacionAgente();
        String ipDestino = "localhost";
        LibreriaMensajes instance = new LibreriaMensajes(false);
        boolean expResult = false;
        boolean result = instance.enviarMensaje(informacionAgente, ipDestino);
        assertEquals(expResult, result);
    }

    /**
     * Test of enviarMensaje method, of class LibreriaMensajes.
     */
    @Test
    public void testEnviarMensaje_3args_3() {
        System.out.println("enviarMensaje");
        InformacionAgente informacionAgente = new InformacionAgente();
        String ipDestino = "localhost";
        int puerto = 1337;
        LibreriaMensajes instance = new LibreriaMensajes(false);
        boolean expResult = false;
        boolean result = instance.enviarMensaje(informacionAgente, ipDestino, puerto);
        assertEquals(expResult, result);
    }

    /**
     * Test of agregarMensajeRecibido method, of class LibreriaMensajes.
     */
    @Test
    public void testAgregarMensajeRecibido_Mensaje() {
        System.out.println("agregarMensajeRecibido");
        Mensaje mensaje = new Mensaje(null, null);
        LibreriaMensajes instance = new LibreriaMensajes(false);
        boolean expResult = true;
        boolean result = instance.agregarMensajeRecibido(mensaje);
        assertEquals(expResult, result);
    }

    /**
     * Test of agregarMensajeRecibido method, of class LibreriaMensajes.
     */
    @Test
    public void testAgregarMensajeRecibido_InformacionAgente() {
        System.out.println("agregarMensajeRecibido");
        InformacionAgente informacionAgente = new InformacionAgente();
        LibreriaMensajes instance = new LibreriaMensajes(false);
        boolean expResult = true;
        boolean result = instance.agregarMensajeRecibido(informacionAgente);
        assertEquals(expResult, result);
    }

    /**
     * Test of agregarIpDestino method, of class LibreriaMensajes.
     */
    @Test
    public void testAgregarIpDestino() {
        System.out.println("agregarIpDestino");
        String ip = "";
        LibreriaMensajes instance = new LibreriaMensajes();
        instance.agregarIpDestino(ip);
    }


    /**
     * Test of buscarIp method, of class LibreriaMensajes.
     */
    @Test
    public void testBuscarIp() {
        System.out.println("buscarIp");
        String ip = "192.168.1.191";
        LibreriaMensajes instance = new LibreriaMensajes(false);
        instance.agregarIpDestino(ip);
        String expResult = "192.168.1.191";
        String result = instance.buscarIp(ip);
        assertEquals(expResult, result);
    }

    /**
     * Test of ultimoMensaje method, of class LibreriaMensajes.
     */
    @Test
    public void testUltimoMensaje() {
        System.out.println("ultimoMensaje");
        LibreriaMensajes instance = new LibreriaMensajes(false);
        Mensaje expResult = new Mensaje(null, null);
        instance.agregarMensajeRecibido(expResult);
        Mensaje result = instance.ultimoMensaje();
        assertEquals(expResult, result);

    }

    /**
     * Test of ultimoMensajeAgente method, of class LibreriaMensajes.
     */
    @Test
    public void testUltimoMensajeAgente() {
        System.out.println("ultimoMensajeAgente");
        LibreriaMensajes instance = new LibreriaMensajes(false);
        InformacionAgente expResult = new InformacionAgente();
        instance.agregarMensajeRecibido(expResult);
        InformacionAgente result = instance.ultimoMensajeAgente();
        assertEquals(expResult, result);
    }

    /**
     * Test of buscarMensaje method, of class LibreriaMensajes.
     */
    @Test
    public void testBuscarMensaje() {
        System.out.println("buscarMensaje");
        int index = 0;
        LibreriaMensajes instance = new LibreriaMensajes(false);
        Mensaje mensaje = new Mensaje(null, null);
        Mensaje expResult = mensaje;
        instance.getMensajesRecibidos().add(mensaje);
        Mensaje result = instance.buscarMensaje(index);
        assertEquals(expResult, result);
    }

    /**
     * Test of eliminarMensaje method, of class LibreriaMensajes.
     */
    @Test
    public void testEliminarMensaje_Mensaje() {
        System.out.println("eliminarMensaje");
        Mensaje m = new Mensaje(null, null);
        LibreriaMensajes instance = new LibreriaMensajes(false);
        boolean expResult = false;
        boolean result = instance.eliminarMensaje(m);
        assertEquals(expResult, result);
    }

    /**
     * Test of eliminarMensaje method, of class LibreriaMensajes.
     */
    @Test
    public void testEliminarMensaje_InformacionAgente() {
        System.out.println("eliminarMensaje");
        InformacionAgente informacionAgente = new InformacionAgente();
        LibreriaMensajes instance = new LibreriaMensajes(false);
        boolean expResult = false;
        boolean result = instance.eliminarMensaje(informacionAgente);
        assertEquals(expResult, result);
        
    }

    /**
     * Test of obtenerIp method, of class LibreriaMensajes.
     */
    @Test
    public void testObtenerIp() {
        System.out.println("obtenerIp");
        String direccion = "192.168";
        LibreriaMensajes instance = new LibreriaMensajes(false);
        String expResult = "192.168.1.199";
        String result = instance.obtenerIp(direccion);
        assertEquals(expResult, result);
    }
    
}
