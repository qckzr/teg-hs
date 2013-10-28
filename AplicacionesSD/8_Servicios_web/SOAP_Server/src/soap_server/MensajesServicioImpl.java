/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package soap_server;
import Libreria.Mensaje;
import javax.jws.WebService;

/**
 *
 * @author Héctor Sam.
 */

@WebService(endpointInterface = "soap_server.MensajesServicio")
public class MensajesServicioImpl implements MensajesServicio{

    @Override
    public String getMensajeAsString(String mensaje) {
        return "Mensaje enviado: "+mensaje;
    }

    @Override
    public String getDateAsString() {
        Mensaje mensaje = new Mensaje(null, null);
        return mensaje.getFecha();
    }

    @Override
    public String getTimeAsString() {
           Mensaje mensaje = new Mensaje(null, null);
           return mensaje.getHora();
    }
    
}
