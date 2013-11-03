/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package servidorcentral;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;
import agente.InformacionAgente;
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
public class GestionarInfraestructuraTest {
    
    public GestionarInfraestructuraTest() {
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
     * Test of insertarEnBd method, of class GestionarInfraestructura.
     */
    @Test
    public void testInsertarEnBd_InformacionAgente() {
        System.out.println("insertarEnBd");
        InformacionAgente informacion = new InformacionAgente("1","1","1","192.168.1.191",
                "1","1","1","1");
        GestionarInfraestructura instance = new GestionarInfraestructura(new 
            LibreriaMensajes(false),"hector","passw0rd","1521","192.168.1.200");
        boolean expResult = true;
        boolean result = instance.insertarEnBd(informacion);
        assertEquals(expResult, result);
    }

    /**
     * Test of insertarEnBd method, of class GestionarInfraestructura.
     */
    @Test
    public void testInsertarEnBd_Mensaje() {
        System.out.println("insertarEnBd");
        Mensaje mensaje = new Mensaje("192.168.1.191","testing");
        GestionarInfraestructura instance = new GestionarInfraestructura(new 
            LibreriaMensajes(false),"hector","passw0rd","1521","192.168.1.200");
        boolean expResult = false;
        boolean result = instance.insertarEnBd(mensaje);
        assertEquals(expResult, result);
    }

    /**
     * Test of reenviarMensaje method, of class GestionarInfraestructura.
     */
    @Test
    public void testReenviarMensaje_InformacionAgente() {
        System.out.println("reenviarMensaje");
        InformacionAgente informacion = new InformacionAgente();
        GestionarInfraestructura instance = new GestionarInfraestructura(new 
            LibreriaMensajes(false),"hector","passw0rd","1521","192.168.1.200");
        boolean expResult = false;
        boolean result = instance.reenviarMensaje(informacion);
        assertEquals(expResult, result);
    }

    /**
     * Test of reenviarMensaje method, of class GestionarInfraestructura.
     */
    @Test
    public void testReenviarMensaje_Mensaje() {
        System.out.println("reenviarMensaje");
        Mensaje mensaje = new Mensaje(null, null);
        GestionarInfraestructura instance = new GestionarInfraestructura(new 
            LibreriaMensajes(false),"hector","passw0rd","1521","192.168.1.200");
        boolean expResult = false;
        boolean result = instance.reenviarMensaje(mensaje);
        assertEquals(expResult, result);
    }

    /**
     * Test of ejecutarAplicacion method, of class GestionarInfraestructura.
     */
    @Test
    public void testEjecutarAplicacion() {
        System.out.println("ejecutarAplicacion");
        String nombreEjecutable = "123";
        String ipNodo = "192.168.1.191";
        GestionarInfraestructura instance = new GestionarInfraestructura(new 
            LibreriaMensajes(false),"hector","passw0rd","1521","192.168.1.200");
        boolean expResult = false;
        boolean result = instance.ejecutarAplicacion(nombreEjecutable, ipNodo);
        assertEquals(expResult, result);
    }

    /**
     * Test of buscarParametros method, of class GestionarInfraestructura.
     */
    @Test
    public void testBuscarParametros() {
        System.out.println("buscarParametros");
        String nombreEjecutable = "";
        GestionarInfraestructura instance = new GestionarInfraestructura(new 
            LibreriaMensajes(false),"hector","passw0rd","1521","192.168.1.200");
        String expResult = "";
        String result = instance.buscarParametros(nombreEjecutable);
        assertEquals(expResult, result);
    }

    /**
     * Test of eliminarAplicacion method, of class GestionarInfraestructura.
     */
    @Test
    public void testEliminarAplicacion() {
        System.out.println("eliminarAplicacion");
        String ipNodo = "";
        String idProceso = "";
        GestionarInfraestructura instance = new GestionarInfraestructura(new 
            LibreriaMensajes(false),"hector","passw0rd","1521","192.168.1.200");
        boolean expResult = true;
        boolean result = instance.eliminarAplicacion(ipNodo, idProceso);
        assertEquals(expResult, result);
    }

    /**
     * Test of eliminarTodasAplicaciones method, of class GestionarInfraestructura.
     */
    @Test
    public void testEliminarTodasAplicaciones() {
        System.out.println("eliminarTodasAplicaciones");
        GestionarInfraestructura instance = new GestionarInfraestructura(new 
            LibreriaMensajes(false),"hector","passw0rd","1521","192.168.1.200");
        boolean expResult = true;
        boolean result = instance.eliminarTodasAplicaciones();
        assertEquals(expResult, result);
    }

    /**
     * Test of enviarMensajeNodo method, of class GestionarInfraestructura.
     */
    @Test
    public void testEnviarMensajeNodo() {
        System.out.println("enviarMensajeNodo");
        String mensaje = "Mensaje";
        String ipNodo = "192.168.1.191";
        GestionarInfraestructura instance = new GestionarInfraestructura(new 
            LibreriaMensajes(false),"hector","passw0rd","1521","192.168.1.200");
        boolean expResult = false;
        boolean result = instance.enviarMensajeNodo(mensaje, ipNodo);
        assertEquals(expResult, result);
    }

    /**
     * Test of nombreUsuarioNodo method, of class GestionarInfraestructura.
     */
    @Test
    public void testNombreUsuarioNodo() {
        System.out.println("nombreUsuarioNodo");
        String ipNodo = "192.168.1.191";
        GestionarInfraestructura instance = new GestionarInfraestructura(new 
            LibreriaMensajes(false),"hector","passw0rd","1521","192.168.1.200");
        String expResult = "pi";
        String result = instance.nombreUsuarioNodo(ipNodo);
        assertEquals(expResult, result);

    }



    /**
     * Test of asociarIdProceso method, of class GestionarInfraestructura.
     */
    @Test
    public void testAsociarIdProceso() {
        System.out.println("asociarIdProceso");
        String texto = "test";
        Mensaje mensaje = new Mensaje(texto, texto);
        GestionarInfraestructura instance = new GestionarInfraestructura(new 
            LibreriaMensajes(false),"hector","passw0rd","1521","192.168.1.200");
        boolean expResult = false;
        boolean result = instance.asociarIdProceso(texto, mensaje);
        assertEquals(expResult, result);
    }

  

    /**
     * Test of agregarIdProceso method, of class GestionarInfraestructura.
     */
    @Test
    public void testAgregarIdProceso() {
        System.out.println("agregarIdProceso");
        String ip = "";
        String idProceso = "";
        GestionarInfraestructura instance = new GestionarInfraestructura(new 
            LibreriaMensajes(false),"hector","passw0rd","1521","192.168.1.200");
        boolean expResult = false;
        boolean result = instance.agregarIdProceso(ip, idProceso);
        assertEquals(expResult, result);
    }

    /**
     * Test of insertarE_N method, of class GestionarInfraestructura.
     */
    @Test
    public void testInsertarE_N() {
        System.out.println("insertarE_N");
        String idProceso = "";
        GestionarInfraestructura instance = new GestionarInfraestructura(new 
            LibreriaMensajes(false),"hector","passw0rd","1521","192.168.1.200");
        boolean expResult = false;
        boolean result = instance.insertarInformacionEjecutable(idProceso);
        assertEquals(expResult, result);
    }

    /**
     * Test of buscarNodo method, of class GestionarInfraestructura.
     */
    @Test
    public void testBuscarNodo() {
        System.out.println("buscarNodo");
        String ipNodo = "192.168.1.191";
        GestionarInfraestructura instance = new GestionarInfraestructura(new 
            LibreriaMensajes(false),"hector","passw0rd","1521","192.168.1.200");
        NodoActivo expResult = null;
        NodoActivo result = instance.buscarNodo(ipNodo);
        assertEquals(expResult, result);
    }
    
    /**
     * Test of comprarConexion method, of class GestionarInfraestructura.
     */
    @Test
    public void testComprobarConexion() {
        System.out.println("buscarNodo");
        String ipNodo = "192.168.1.191";
        GestionarInfraestructura instance = new GestionarInfraestructura(new 
            LibreriaMensajes(false),"hector","passw0rd","1521","192.168.1.200");
        boolean expResult = false;
        boolean result = instance.comprobarConexion();
        assertEquals(expResult, result);
    }

   
    
}
