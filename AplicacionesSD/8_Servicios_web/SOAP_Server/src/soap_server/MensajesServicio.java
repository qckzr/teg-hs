/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package soap_server;

import javax.jws.WebMethod;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;

/**
 *
 * @author sam
 */

@WebService
@SOAPBinding(style = SOAPBinding.Style.RPC)
public interface MensajesServicio {
    
    @WebMethod String getMensajeAsString(String name);
    @WebMethod String getDateAsString();
    @WebMethod String getTimeAsString();
    
}
