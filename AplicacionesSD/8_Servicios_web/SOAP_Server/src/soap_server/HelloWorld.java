/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package soap_server;

/**
 *
 * @author sam
 */

import javax.jws.WebMethod;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;
import javax.jws.soap.SOAPBinding.Style;
 
//Service Endpoint Interface
@WebService
@SOAPBinding(style = Style.RPC)
public interface HelloWorld{
 
	@WebMethod String getHelloWorldAsString(String name);
 
}

