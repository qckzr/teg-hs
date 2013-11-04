/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import Libreria.Mensaje;
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
public class ArchivoTest {
    
    public ArchivoTest() {
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
     * Test of crearArchivos method, of class Archivo.
     */
    @Test
    public void testCrearArchivos() {
        System.out.println("crearArchivos");
        String ruta = "/tmp/";
        Archivo instance = new Archivo();
        ArrayList nodos = new ArrayList();
        nodos.add("nodo1");
        instance.setNombresArchivoMensajes(nodos);
        instance.setNombresArchivoAgentes(nodos);
        boolean expResult = true;
        boolean result = instance.crearArchivos(ruta);
        assertEquals(expResult, result);
        
    }

    /**
     * Test of agregarMensaje method, of class Archivo.
     */
    @Test
    public void testAgregarMensaje_Mensaje_String() {
        System.out.println("agregarMensaje");
        Mensaje mensajeRecibido = new Mensaje("localhost","holamund0");
        String idNodo = "1";
        Archivo instance = new Archivo();
        boolean expResult = false;
        instance.setNombresArchivoMensajes(new ArrayList<String>());
        boolean result = instance.agregarMensaje(mensajeRecibido, idNodo);
        assertEquals(expResult, result);
        
    }

    /**
     * Test of agregarMensaje method, of class Archivo.
     */
    @Test
    public void testAgregarMensaje_InformacionAgente_String() {
        System.out.println("agregarMensaje");
        InformacionAgente mensajeRecibido = new InformacionAgente();
        String idNodo = "1";
        Archivo instance = new Archivo();
        instance.setNombresArchivoAgentes(new ArrayList<String>());
        boolean expResult = false;
        boolean result = instance.agregarMensaje(mensajeRecibido, idNodo);
        assertEquals(expResult, result);
    }

    /**
     * Test of retornarNodo method, of class Archivo.
     */
    @Test
    public void testRetornarNodo() {
        System.out.println("retornarNodo");
        String ipOrigen = "192.168.1.191";
        Archivo instance = new Archivo();
        instance.setConexionBD(new ConexionBD());
        String expResult = "1";
        String result = instance.retornarNodo(ipOrigen);
        assertEquals(expResult, result);
        
    }

    /**
     * Test of nombreArchivo method, of class Archivo.
     */
    @Test
    public void testNombreArchivo() {
        System.out.println("nombreArchivo");
        String idNodo = "1";
        Archivo instance = new Archivo();
        instance.setRuta("/tmp/");
        String expResult = "";
        instance.setNombresArchivoMensajes(new ArrayList<String>());
        String result = instance.nombreArchivo(idNodo);
        assertEquals(expResult, result);
        
    }

    /**
     * Test of nombreArchivoAgente method, of class Archivo.
     */
    @Test
    public void testNombreArchivoAgente() {
        System.out.println("nombreArchivoAgente");
        String idNodo = "1";
        Archivo instance = new Archivo();
        instance.setRuta("/tmp/");
        String expResult = "";
        instance.setNombresArchivoAgentes( new ArrayList<String>());
        String result = instance.nombreArchivoAgente(idNodo);
        assertEquals(expResult, result);
        
    }

    /**
     * Test of crearArchivoAgente method, of class Archivo.
     */
    @Test
    public void testCrearArchivoAgente() {
        System.out.println("crearArchivoAgente");
        String nombreArchivo = "123";
        Archivo instance = new Archivo();
        instance.setRuta("/tmp/");
        boolean expResult = true;
        boolean result = instance.crearArchivoAgente(nombreArchivo);
        assertEquals(expResult, result);
    }
    
}
