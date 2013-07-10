package Libreria;


import agente.InformacionAgente;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.net.InetAddress;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Hector
 */
public final  class LibreriaMensajes {

    private final static int PUERTO = 1337;
    private final static int MENSAJES_MAXIMOS = 5;
    private EscucharMensajes hiloDeEscucha;
    private ArrayList<String> ipDestino;
    private String ipOrigen;
    private ArrayList<Mensaje> mensajesRecibidos;
    private ArrayList<InformacionAgente> mensajesAgente;


    public LibreriaMensajes(){
        
        
        inicializarEscucha();
        ipDestino = new ArrayList<String>();
        mensajesRecibidos = new ArrayList<Mensaje>();
        mensajesAgente = new ArrayList<InformacionAgente>();
        try {
            this.ipOrigen = InetAddress.getLocalHost().getHostAddress();
        } catch (UnknownHostException ex) {
            Logger.getLogger(LibreriaMensajes.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    public LibreriaMensajes(int puerto){
        
        
        inicializarEscucha(puerto);
        ipDestino = new ArrayList<String>();
        mensajesRecibidos = new ArrayList<Mensaje>();
        mensajesAgente = new ArrayList<InformacionAgente>();
        try {
            this.ipOrigen = InetAddress.getLocalHost().getHostAddress();
        } catch (UnknownHostException ex) {
            Logger.getLogger(LibreriaMensajes.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    public EscucharMensajes getHiloDeEscucha() {
        return hiloDeEscucha;
    }

    public void setHiloDeEscucha(EscucharMensajes hiloDeEscucha) {
        this.hiloDeEscucha = hiloDeEscucha;
    }

    public ArrayList<String> getIpDestino() {
        return ipDestino;
    }

    public void setIpDestino(ArrayList<String> ipDestino) {
        this.ipDestino = ipDestino;
    }

    public String getIpOrigen() {
        return ipOrigen;
    }

    public void setIpOrigen(String ipOrigen) {
        this.ipOrigen = ipOrigen;
    }

    public ArrayList<Mensaje> getMensajesRecibidos() {
        return mensajesRecibidos;
    }

    public void setMensajesRecibidos(ArrayList<Mensaje> mensajesRecibidos) {
        this.mensajesRecibidos = mensajesRecibidos;
    }
    
    public static int getPuerto(){
        return PUERTO;
    }

    public ArrayList<InformacionAgente> getMensajesAgente() {
        return mensajesAgente;
    }

    public void setMensajesAgente(ArrayList<InformacionAgente> mensajesAgente) {
        this.mensajesAgente = mensajesAgente;
    }
    
    
    
    
    
    public void inicializarEscucha(){
            hiloDeEscucha = new EscucharMensajes(this,PUERTO);
            hiloDeEscucha.start();      
    }
    public void inicializarEscucha(int puerto){
            hiloDeEscucha = new EscucharMensajes(this,puerto);
            hiloDeEscucha.start();      
    }


    public boolean enviarMensaje(String mensaje){

            Mensaje m = new Mensaje(ipOrigen,mensaje);
            Iterator iterator = ipDestino.iterator();
            while (iterator.hasNext()){
                try {
                    
                    Socket socket = new Socket(iterator.next().toString(), PUERTO);
                    ObjectOutputStream oos = new ObjectOutputStream(socket.getOutputStream());
                    oos.writeObject(m);
                    socket.close();
                   
                } catch (UnknownHostException ex) {
                    Logger.getLogger(LibreriaMensajes.class.getName()).log(Level.SEVERE, null, ex);
                    return false;
                } catch (IOException ex) {
                    Logger.getLogger(LibreriaMensajes.class.getName()).log(Level.SEVERE, null, ex);
                    return false;
                }
            }
            return true;

    }
    
    public boolean enviarMensaje(String mensaje, String ipDestino){

            Mensaje m = new Mensaje(ipOrigen,mensaje);
                try {
                    
                    Socket socket = new Socket(ipDestino, PUERTO);
                    ObjectOutputStream oos = new ObjectOutputStream(socket.getOutputStream());
                    oos.writeObject(m);
                    socket.close();
                   
                } catch (UnknownHostException ex) {
                    Logger.getLogger(LibreriaMensajes.class.getName()).log(Level.SEVERE, null, ex);
                    return false;
                } catch (IOException ex) {
                    Logger.getLogger(LibreriaMensajes.class.getName()).log(Level.SEVERE, null, ex);
                    return false;
                }
            
            return true;

    }
    
     public boolean enviarMensaje(String mensaje, String ipDestino,int puerto){

            Mensaje m = new Mensaje(ipOrigen,mensaje);
                try {
                    
                    Socket socket = new Socket(ipDestino, puerto);
                    ObjectOutputStream oos = new ObjectOutputStream(socket.getOutputStream());
                    oos.writeObject(m);
                    socket.close();
                   
                } catch (UnknownHostException ex) {
                    Logger.getLogger(LibreriaMensajes.class.getName()).log(Level.SEVERE, null, ex);
                    return false;
                } catch (IOException ex) {
                    Logger.getLogger(LibreriaMensajes.class.getName()).log(Level.SEVERE, null, ex);
                    return false;
                }
            
            return true;

    }
     
      public boolean enviarMensaje(InformacionAgente informacion){

            
            Iterator iterator = ipDestino.iterator();
            while (iterator.hasNext()){
                try {
                    
                    Socket socket = new Socket(iterator.next().toString(), PUERTO);
                    ObjectOutputStream oos = new ObjectOutputStream(socket.getOutputStream());
                    oos.writeObject(informacion);
                    socket.close();
                   
                } catch (UnknownHostException ex) {
                    Logger.getLogger(LibreriaMensajes.class.getName()).log(Level.SEVERE, null, ex);
                    return false;
                } catch (IOException ex) {
                    Logger.getLogger(LibreriaMensajes.class.getName()).log(Level.SEVERE, null, ex);
                    return false;
                }
            }
            return true;

    }
     
     
    public boolean enviarMensaje(InformacionAgente informacionAgente, String ipDestino){

            
                try {
                    
                    Socket socket = new Socket(ipDestino,PUERTO);
                    ObjectOutputStream oos = new ObjectOutputStream(socket.getOutputStream());
                    oos.writeObject(informacionAgente);
                    socket.close();
                   
                } catch (UnknownHostException ex) {
                    Logger.getLogger(LibreriaMensajes.class.getName()).log(Level.SEVERE, null, ex);
                    return false;
                } catch (IOException ex) {
                    Logger.getLogger(LibreriaMensajes.class.getName()).log(Level.SEVERE, null, ex);
                    return false;
                }
            
            return true;

    }
    
    
     

    public boolean agregarMensajeRecibido(Mensaje mensaje){
        
        if (mensajesRecibidos.size()<=MENSAJES_MAXIMOS)
            
            if (mensajesRecibidos.size()==MENSAJES_MAXIMOS){
                mensajesRecibidos.remove(0);
                mensajesRecibidos.add(mensaje);
                return true;
            }
            else{
                mensajesRecibidos.add(mensaje);
                return true;
            }
        
        else
            return false;
    
    }
    
    public boolean agregarMensajeRecibido(InformacionAgente informacionAgente){
        
        if (mensajesAgente.size()<=MENSAJES_MAXIMOS)
            
            if (mensajesAgente.size()==MENSAJES_MAXIMOS){
                mensajesAgente.remove(0);
                mensajesAgente.add(informacionAgente);
                return true;
            }
            else{
                mensajesAgente.add(informacionAgente);
                return true;
            }
        
        else
            return false;
    
    }

    public void agregarIpDestino(String ip){
        ipDestino.add(ip);
    }

    public void eliminarIpDestino(String ip){

        if (buscarIp(ip)!=null)
           ipDestino.remove(buscarIp(ip));

    }

    public String buscarIp(String ip){
        
        Iterator iterator = ipDestino.iterator();
        while (iterator.hasNext())
            if (iterator.next().toString().contains(ip))
                return iterator.next().toString();
        return null;
    }
    
    public Mensaje ultimoMensaje(){
        
        if (mensajesRecibidos.size()>0)
            return (mensajesRecibidos.get(mensajesRecibidos.size()-1));
        else return null;
    }
      public InformacionAgente ultimoMensajeAgente(){
        
        if (mensajesAgente.size()>0)
            return (mensajesAgente.get(mensajesAgente.size()-1));
        else return null;
    }
    
    public Mensaje buscarMensaje(int index){
        
        if (index>0 && index<mensajesRecibidos.size())
            return mensajesRecibidos.get(index);
        else return null;
    }


}
