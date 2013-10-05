/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ldap_servidor;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;
import java.util.ArrayList;

/**
 *
 * @author sam
 */
public class LogicaAplicacion {

    private LibreriaMensajes libreriaMensajes;
    private int puertoAgente;
    private DatosAplicacion datosAplicacion;
    private ArrayList<Dominio> dominios;
    
    

    public LogicaAplicacion(LibreriaMensajes libreriaMensajes, DatosAplicacion datosAplicacion,int puertoAgente) {
        
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        dominios = new ArrayList<>();
        iniciar();

    }

  
    public boolean verificarMensajeRecibido(Mensaje mensaje){
        
        switch (mensaje.getMensaje()){
            case "aplicacion": 
                if (libreriaMensajes.enviarMensaje(datosAplicacion.getNombreAplicacion(),"localhost", puertoAgente))
                    return true;
                break;
            case "nodo":
                if (libreriaMensajes.enviarMensaje(datosAplicacion.getNumeroNodoAplicacion(),"localhost",puertoAgente))
                    return true;
                break;
            default:{
                 
                 System.out.println("Se ha recibido el mensaje: \""+mensaje.getMensaje()+"\" proveniente del host: "+mensaje.getIpOrigen());
                 if (mensaje.getMensaje().contains("add")){
                     if (agregarCliente(mensaje.getMensaje())==true)
                         libreriaMensajes.enviarMensaje("Se agregó el cliente",mensaje.getIpOrigen());
                     else
                         libreriaMensajes.enviarMensaje("Error agregando el cliente",mensaje.getIpOrigen());
                 }
                 else if (mensaje.getMensaje().contains("search")) {
                     libreriaMensajes.enviarMensaje("Buscando usuario...");
                     Cliente cliente = buscarCliente(mensaje.getMensaje());
                     if (cliente!=null){
                         libreriaMensajes.enviarMensaje("Usuario encontrado, enviando datos...");
                         libreriaMensajes.enviarMensaje(cliente.imprimirDatos(),mensaje.getIpOrigen());
                     }
                     else
                         libreriaMensajes.enviarMensaje("No se consiguió el usuario",mensaje.getIpOrigen());

                 }
                 else if (mensaje.getMensaje().contains("delete")){
                     libreriaMensajes.enviarMensaje("Eliminando usuario...");
                      if (eliminarCliente(mensaje.getMensaje())==true)
                          libreriaMensajes.enviarMensaje("Se eliminó el usuario",mensaje.getIpOrigen());
                      else
                          libreriaMensajes.enviarMensaje("No se pudo eliminar el usuario",mensaje.getIpOrigen());
                     
                 }
                 else if (mensaje.getMensaje().contains("list")){
                     for (Dominio dominio : dominios) {
                         for (Cliente cliente : dominio.getClientes()) {
                             System.out.println(cliente.toString());
                             libreriaMensajes.enviarMensaje(cliente.toString());
                         }
                     }
                 }
                 
            }
        };
        return false;
    }
     
    public void enviarId(String ipServidor){
        libreriaMensajes.enviarMensaje("id<"+datosAplicacion.getIdProceso(),ipServidor);
    }
    
    public void iniciar(){
        Dominio dominio = new Dominio("ucab","edu");
        Cliente hector = new Cliente("Hector","Sam","+584125899127", "hfsam88@gmail.com", null, dominio);
        dominio.getClientes().add(hector);
        Cliente aileen = new Cliente("Aileen","Posadas","+584123415780", "aileen.posadas@gmail.com", hector, dominio);
        dominio.getClientes().add(aileen);
        Cliente daniel = new Cliente("Daniel","Sam","+584125899127", "hfsam88@gmail.com", hector, dominio);
        dominio.getClientes().add(daniel);
        Dominio dominio1 = new Dominio("ibm","com");
        Cliente juan = new Cliente("Juan","Rodriguez","+21290812313", "iscandre@ve.ibm.com",null, dominio1);
        Cliente motta = new Cliente("Jessica","Motta","+2129083432", "jcmotta@ve.ibm.com",juan, dominio1);
        Cliente cristobal = new Cliente("Cristobal","Gimon","+2129083214", "csgimon@ve.ibm.com",juan, dominio1);
        Cliente dany = new Cliente("Dany","Esteves","+2129081398", "desteves@ve.ibm.com",juan, dominio1);
        dominio1.getClientes().add(juan);
        dominio1.getClientes().add(motta);
        dominio1.getClientes().add(cristobal);
        dominio1.getClientes().add(dany);
        dominios.add(dominio);
        dominios.add(dominio1);
    }
    
    
    public Dominio buscarDominio(String dc1, String dc2){
        for (Dominio dominio : dominios) {
            if (dominio.getDc().contentEquals(dc1) && dominio.getDc2().contentEquals(dc2))
                return dominio;
        }
        return null;
    }
    
    public Cliente buscarCliente (Dominio dominio, String cn){
        
        for (Cliente cliente : dominio.getClientes()) {
            if(cliente.getCn().contentEquals(cn))
                return cliente;
        }
        return null;
    }
    
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
    
    
    public boolean agregarCliente(String mensaje){
        String[] partes = mensaje.split(",");
        int posicion = 0;
        Cliente cliente = new Cliente();
        String nombreManager = "";
        String dominio1 = "";
        String dominio2 = "";
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
        Dominio dominio = buscarDominio(dominio1, dominio2);
        if (dominio!=null)
            cliente.setDominio(dominio);
        else
            return false;
        Cliente manager = buscarCliente(dominio,nombreManager);
        if (manager!=null)
            cliente.setManager(manager);
        else return false;
        dominio.getClientes().add(cliente);
        
        return true;
        
    }
    
    
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
        if (dominioCliente!=null){
            dominioCliente.getClientes().remove(clienteAeliminar);
            return true;
        }
        else
            return false;
        
    }
    
    
   
    
   
    
   
  
   
    
    
}
    
    
    
    
    
    
   
    
    
   

