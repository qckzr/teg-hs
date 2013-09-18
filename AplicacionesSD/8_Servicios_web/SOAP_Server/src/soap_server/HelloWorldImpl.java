/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package soap_server;

/**
 *
 * @author sam
 */
import javax.jws.WebService;
 
//Service Implementation
@WebService(endpointInterface = "soap_server.HelloWorld")
public class HelloWorldImpl implements HelloWorld{
 
	@Override
	public String getHelloWorldAsString(String name) {
		return "Hello World JAX-WS " + name;
	}
 
}
