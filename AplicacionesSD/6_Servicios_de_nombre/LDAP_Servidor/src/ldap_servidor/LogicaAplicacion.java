/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ldap_servidor;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;
import java.util.ArrayList;

/**
 * Clase que implementa la lógica de la aplicación para el tópico Servicios de
 * Nombre - LDAP Servidor.
 * @author Héctor Sam.
 */
public class LogicaAplicacion {

    private static LogicaAplicacion instancia = null;
    private LibreriaMensajes libreriaMensajes;
    private int puertoAgente;
    private DatosAplicacion datosAplicacion;
    private ArrayList<Dominio> dominios;
    
    

    private LogicaAplicacion(LibreriaMensajes libreriaMensajes,
            DatosAplicacion datosAplicacion,int puertoAgente) {
        
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        dominios = new ArrayList<>();
        iniciar();
    }
    
    /**
     * Singleton
     * @param libreriaMensajes
     * @param datosAplicacion
     * @param puertoAgente
     * @return 
     */
    public static LogicaAplicacion getInstancia(LibreriaMensajes libreriaMensajes,
            DatosAplicacion datosAplicacion,int puertoAgente) {
        if (instancia == null){
            instancia = new LogicaAplicacion(libreriaMensajes,
                    datosAplicacion, puertoAgente);
        }
        return instancia;
    }

    public LibreriaMensajes getLibreriaMensajes() {
        return libreriaMensajes;
    }

    public void setLibreriaMensajes(LibreriaMensajes libreriaMensajes) {
        this.libreriaMensajes = libreriaMensajes;
    }

    public int getPuertoAgente() {
        return puertoAgente;
    }

    public void setPuertoAgente(int puertoAgente) {
        this.puertoAgente = puertoAgente;
    }

    public DatosAplicacion getDatosAplicacion() {
        return datosAplicacion;
    }

    public void setDatosAplicacion(DatosAplicacion datosAplicacion) {
        this.datosAplicacion = datosAplicacion;
    }

    public ArrayList<Dominio> getDominios() {
        return dominios;
    }

    public void setDominios(ArrayList<Dominio> dominios) {
        this.dominios = dominios;
    }
    
    
    

    /**
     * Método que permite chequear el mensaje recibido para decidir si pertenece
     * al agente de configuración, al módulo de ciclo de vida o a un nodo.
     * @param mensaje El mensaje recibido.
     * @return True si pertence al agente. False en caso contrario.
     */
    public boolean verificarMensajeRecibido(Mensaje mensaje){
        
        switch (mensaje.getMensaje()){
            case "aplicacion": 
                if (libreriaMensajes.enviarMensaje(datosAplicacion.
                        getNombreAplicacion(),"localhost", puertoAgente)) {
                    return true;
                }
                break;
            case "nodo":
                if (libreriaMensajes.enviarMensaje(datosAplicacion.
                        getNumeroNodoAplicacion(),"localhost",puertoAgente)) {
                    return true;
                }
                break;
            default:{
                 
                 System.out.println("Se ha recibido el mensaje: \""
                         +mensaje.getMensaje()+"\" proveniente del host: "
                         +mensaje.getIpOrigen());
                 evaluarMensaje(mensaje);
                 
            }
        };
        return false;
    }
    
    /**
     * Método que permite enviar el número de proceso al servidor central.
     * @param ipServidor 
     */
    public void enviarId(String ipServidor){
        libreriaMensajes.enviarMensaje("id<"+datosAplicacion.getIdProceso(),ipServidor);
        libreriaMensajes.enviarMensaje("Ejecutable inicializado");
    }
    
    /**
     * Método que permite evaluar las instrucciones enviadas por el cliente.
     * @param mensaje El mensaje con las instrucciones.
     * @return True si se pudo ejecutar la instrucción. False en caso contrario.
     */
    public boolean evaluarMensaje(Mensaje mensaje){
        if (mensaje.getMensaje().contains("add")){
            if (agregarCliente(mensaje.getMensaje()) == true) {
                    libreriaMensajes.enviarMensaje("Se agregó el cliente",
                            mensaje.getIpOrigen());
                    return true;
                } else {
                    libreriaMensajes.enviarMensaje("Error agregando el"
                            + " cliente",mensaje.getIpOrigen());
                    return false;
                }
            } else if (mensaje.getMensaje().contains("search")) {
                libreriaMensajes.enviarMensaje("Buscando usuario...");
                Cliente cliente = buscarCliente(mensaje.getMensaje());
                if (cliente!=null){
                    libreriaMensajes.enviarMensaje("Usuario encontrado,"
                            + " enviando datos...");
                    libreriaMensajes.enviarMensaje(cliente.imprimirDatos(),
                            mensaje.getIpOrigen());
                    return true;
                } else {
                    libreriaMensajes.enviarMensaje("No se consiguió"
                            + " el usuario",mensaje.getIpOrigen());
                    return true;
                }

            } else if (mensaje.getMensaje().contains("delete")){
                libreriaMensajes.enviarMensaje("Eliminando usuario...");
                 if (eliminarCliente(mensaje.getMensaje()) == true) {
                     libreriaMensajes.enviarMensaje("Se eliminó el usuario",
                             mensaje.getIpOrigen());
                     return true;
                 } else {
                     libreriaMensajes.enviarMensaje("No se pudo eliminar "
                             + "el usuario",mensaje.getIpOrigen());
                     return false;
                 }

            }
            else if (mensaje.getMensaje().contains("list")){
                for (Dominio dominio : dominios) {
                    for (Cliente cliente : dominio.getClientes()) {
                        System.out.println(cliente.toString());
                        libreriaMensajes.enviarMensaje(cliente.toString());
                    }
                }
                return true;
            } else {
                return false;
            }
    }
    
    /**
     * Método que permite iniciar el servidor con datos predefinidos.
     */
    public void iniciar(){
        Dominio dominio = new Dominio("ucab","edu");
        Cliente hector = new Cliente("Hector","Sam","+584125899127",
                "hfsam88@gmail.com", null, dominio);
        dominio.getClientes().add(hector);
        Cliente aileen = new Cliente("Aileen","Posadas","+584123415780",
                "aileen.posadas@gmail.com", hector, dominio);
        dominio.getClientes().add(aileen);
        Cliente daniel = new Cliente("Daniel","Sam","+584125899127",
                "hfsam88@gmail.com", hector, dominio);
        dominio.getClientes().add(daniel);
        Dominio dominio1 = new Dominio("ibm","com");
        Cliente juan = new Cliente("Juan","Rodriguez","+21290812313",
                "iscandre@ve.ibm.com",null, dominio1);
        Cliente motta = new Cliente("Jessica","Motta","+2129083432",
                "jcmotta@ve.ibm.com",juan, dominio1);
        Cliente cristobal = new Cliente("Cristobal","Gimon","+2129083214",
                "csgimon@ve.ibm.com",juan, dominio1);
        Cliente dany = new Cliente("Dany","Esteves","+2129081398", 
                "desteves@ve.ibm.com",juan, dominio1);
        dominio1.getClientes().add(juan);
        dominio1.getClientes().add(motta);
        dominio1.getClientes().add(cristobal);
        dominio1.getClientes().add(dany);
        dominios.add(dominio);
        dominios.add(dominio1);
    }
    
    /**
     * Método que permite buscar un dominio particular en la lista de dominios.
     * @param dc1 El dominio a buscar.
     * @param dc2 El subdominio del dominio.
     * @return El dominio si es encontrado. False en caso contrario.
     */
    public Dominio buscarDominio(String dc1, String dc2){
        for (Dominio dominio : dominios) {
            if (dominio.getDc().contentEquals(dc1) 
                    && dominio.getDc2().contentEquals(dc2)) {
                return dominio;
            }
        }
        return null;
    }
    
    /**
     * Método que permite buscar un cliente en un dominio específico.
     * @param dominio El dominio del cliente a buscar.
     * @param cn El cliente a buscar.
     * @return El cliente si es encontrado. Null si no existe.
     */
    public Cliente buscarCliente (Dominio dominio, String cn){
        
        for (Cliente cliente : dominio.getClientes()) {
            if(cliente.getCn().contentEquals(cn))
                return cliente;
        }
        return null;
    }
    
    /**
     * Método que permite buscar un cliente en la lista de dominios.
     * @param cn El cliente a buscar.
     * @return El cliente si es encontrado o Null si no existe.
     */
    public Cliente buscarCliente(String cn){
        String nombreCliente = cn.substring(cn.indexOf(",")+1,cn.length());
        for (Dominio dominio : dominios) {
            for (Cliente cliente : dominio.getClientes()) {
                    if (cliente.getCn().contentEquals(nombreCliente))
                        return cliente;
            }
        }
        return null;
    }
    
    /**
     * Método que permite agregar un cliente a un dominio particular.
     * @param mensaje El cliente a agregar.
     * @return True si el cliente fue agregado. False en caso contrario.
     */
    public boolean agregarCliente(String mensaje){
        String[] partes = mensaje.split(",");
        Cliente manager;
        int posicion = 0;
        Cliente cliente = new Cliente();
        String nombreManager = "";
        String dominio1 = "";
        String dominio2 = "";
        Dominio dominio;
        for (String string : partes) {
            switch (posicion){
                case 1: cliente.setGivenName(string);
                    break;
                case 2: cliente.setSn(string);
                        cliente.setCn();
                    break;
                case 3: cliente.setTelephoneNumber(string);
                    break;
                case 4: cliente.setMail(string);
                    break;
                case 5: nombreManager = string;
                    break;
                case 6: dominio1 = string;
                    break;
                case 7: dominio2 = string;
                    break;
            };
            posicion++;
        }
        dominio = buscarDominio(dominio1, dominio2);
        if (dominio != null) {
            cliente.setDominio(dominio);
        } else {
            return false;
        }
        manager = buscarCliente(dominio,nombreManager);
        if (manager != null) {
            cliente.setManager(manager);
        }else {
            return false;
        }
        dominio.getClientes().add(cliente);
        
        return true;
        
    }
    
    /**
     * Método que permite eliminar un cliente de la lista de usuarios de un
     * dominio específico.
     * @param cn El nombre y apellido del cliente a eliminar.
     * @return True si el cliente fue eliminado. False en caso contrario.
     */
    public boolean eliminarCliente(String cn){
        
        String nombreCliente = cn.substring(cn.indexOf(",")+1,cn.length());
        Dominio dominioCliente = null;
        Cliente clienteAeliminar = null;
        for (Dominio dominio : dominios)
            for (Cliente cliente : dominio.getClientes())
                if (cliente.getCn().contentEquals(nombreCliente)){
                    clienteAeliminar = cliente;
                    dominioCliente = dominio;
                }
        if (dominioCliente != null){
            dominioCliente.getClientes().remove(clienteAeliminar);
            return true;
        }
        else {
            return false;
        }
        
    }
    
    
   
    
   
    
   
  
   
    
    
}
    
    
    
    
    
    
   
    
    
   

