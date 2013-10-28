/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package ejb;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.message.BasicNameValuePair;
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
     * Test of enviarInformacion method, of class LogicaAplicacion.
     */
    @Test
    public void testEnviarInformacion() {
        System.out.println("enviarInformacion");
        Mensaje mensaje = new Mensaje("localhost","1-2-3");
        LogicaAplicacion instance = LogicaAplicacion.getInstancia(
                new LibreriaMensajes(true), null, 1337, "localhost");
        boolean expResult = false;
        boolean result = instance.enviarInformacion(mensaje);
        assertEquals(expResult, result);
    }

    /**
     * Test of recibirInformacion method, of class LogicaAplicacion.
     */
    @Test
    public void testRecibirInformacion() {
        System.out.println("recibirInformacion");
        LogicaAplicacion instance = LogicaAplicacion.getInstancia(
                new LibreriaMensajes(true), null, 1337,"localhost");
        boolean expResult = false;
        boolean result = instance.recibirInformacion(null);
        assertEquals(expResult, result);
        
    }
    
}
