/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package REST_Servidor;

import Libreria.Mensaje;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.PathParam;
import javax.ws.rs.Consumes;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.GET;
import javax.ws.rs.Produces;

/**
 * REST Web Service
 *
 * @author sam
 */
@Path("hora")
public class Hora {

    @Context
    private UriInfo context;

    /**
     * Creates a new instance of Hora
     */
    public Hora() {
    }

    /**
     * Retrieves representation of an instance of helloWorld.Hora
     * @return an instance of java.lang.String
     */
    @GET
    @Produces("text/html")
    public String getHtml() {
        //TODO return proper representation object
        Mensaje mensaje = new Mensaje(null, null);
        return mensaje.getHora();
    }

    /**
     * PUT method for updating or creating an instance of Hora
     * @param content representation for the resource
     * @return an HTTP response with content of the updated or created resource.
     */
    @PUT
    @Consumes("text/html")
    public void putHtml(String content) {
    }
}
