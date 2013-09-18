/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package soap_client;

import Libreria.LibreriaMensajes;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.namespace.QName;
import javax.xml.ws.Service;
import soap_server.HelloWorld;

/**
 *
 * @author sam
 */
public class SOAP_Client {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
//        try {
            // TODO code application logic here
            
//            URL url = new URL("http://"+args[0]+":9999/ws/hello?wsdl");
//     
//            //1st argument service URI, refer to wsdl document above
//            //2nd argument is service name, refer to wsdl document above
//            QName qname = new QName("http://soap_server/", "HelloWorldImplService");
//     
//            Service service = Service.create(url, qname);
//     
//            HelloWorld hello = service.getPort(HelloWorld.class);
//     
//            System.out.println(hello.getHelloWorldAsString("LOLOLOLOLOL"));
//        } catch (MalformedURLException ex) {
//            Logger.getLogger(SOAP_Client.class.getName()).log(Level.SEVERE, null, ex);
//        }
 
        
        LibreriaMensajes libreriaMensajes = new LibreriaMensajes();
            DatosAplicacion datosAplicacion = new DatosAplicacion(args[0],args[1]);//args[0] = nombreApp, args[1] = numeroNodo
            libreriaMensajes.agregarIpDestino(args[2]); //args[2] ip del servidor central
            LogicaAplicacion logicaAplicacion = new LogicaAplicacion(libreriaMensajes, datosAplicacion, Integer.valueOf(args[3]),args[4]);
            EscucharClientes escucharMensajes = new EscucharClientes(logicaAplicacion, libreriaMensajes);
            escucharMensajes.start();
    }
}
