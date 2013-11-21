package Libreria;


import agente.InformacionAgente;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.net.*;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *Clase que implementa  el envío de mensajes a través de sockets, los mensajes 
 * puede ser de tipo Mensaje o InformacionAgente.
 * 
 * @author Hector
 */
public final  class LibreriaMensajes {

    private final static int PUERTO = 1337;
    private int mensajes_maximos = 5;
    private static EscucharMensajes hiloDeEscucha;
    private ArrayList<String> ipDestino;
    private String ipOrigen;
    private ArrayList<Mensaje> mensajesRecibidos;
    private ArrayList<InformacionAgente> mensajesAgente;

    /**
     * Constructor de la clase, se inicia la escucha d emensajes con el puerto
     * por defecto para la espera de mensajes. Posee una lista de direcciones ip
     * a que se le puede enviar mensajes. Se obtiene la dirección ip local a 
     * través del método obtenerIp.
     */
    
    
    public LibreriaMensajes(){
        
        
        inicializarEscucha();
        ipDestino = new ArrayList<String>();
        mensajesRecibidos = new ArrayList<Mensaje>();
        mensajesAgente = new ArrayList<InformacionAgente>();
        ipOrigen = obtenerIp("192.168.1."); //CAMBIAR
        
    }
    
    /**
     * Constructor de la clase, se inicia con un puerto distinto al puerto por 
     * defecto.
     * @param puerto Puerto en el que se quiere escuchar por mensajes.
     */
    public LibreriaMensajes(int puerto){
        
        
        inicializarEscucha(puerto);
        ipDestino = new ArrayList<String>();
        mensajesRecibidos = new ArrayList<Mensaje>();
        mensajesAgente = new ArrayList<InformacionAgente>();
        ipOrigen = obtenerIp("192.168.1.");
        
    }
    
    /**
     * Constructor de la clase, que se inicia sin la escucha de puerto, solo
     * para enviar mensajes (no recibe).
     * @param puerto True o False, no inicia escucha de mensajes.
     */
    public LibreriaMensajes(boolean puerto){
        ipDestino = new ArrayList<String>();
        mensajesRecibidos = new ArrayList<Mensaje>();
        mensajesAgente = new ArrayList<InformacionAgente>();
        ipOrigen = obtenerIp("192.168.1.");
    }

    public static EscucharMensajes getHiloDeEscucha() {
        return hiloDeEscucha;
    }

    public static void setHiloDeEscucha(EscucharMensajes hiloDeEscucha) {
        LibreriaMensajes.hiloDeEscucha = hiloDeEscucha;
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

    public int getMensajes_maximos() {
        return mensajes_maximos;
    }

    public void setMensajes_maximos(int mensajes_maximos) {
        this.mensajes_maximos = mensajes_maximos;
    }
    
    
    
    
    
    
    /**
     * Metodo de creación del hilo de escucha de mensajes. Utiliza el puerto por
     * defecto para esperar por los mensajes enviados.
     */
    public void inicializarEscucha(){
            hiloDeEscucha = new EscucharMensajes(this,PUERTO);
            hiloDeEscucha.start();      
    }
    
    /**
     * Método de creación del hilo de escucha de mensajes. Utiliza el puerto
     * enviado por parámetro para la espera de mensajes.
     * @param puerto Puerto para iniciar la escucha de mensajes.
     */
    public void inicializarEscucha(int puerto){
            hiloDeEscucha = new EscucharMensajes(this,puerto);
            hiloDeEscucha.start();      
    }

    /**
     * Método que permite enviar mensajes a los hosts contenidos en la lista de
     * ipDestino utilizando el puerto por defecto.
     * @param mensaje El mensaje a enviar.
     * @return True si se envían los mensajes a los host, caso contrario False.
     */
    public boolean enviarMensaje(String mensaje){

            Mensaje m = new Mensaje(ipOrigen,mensaje);
            Iterator iterator = ipDestino.iterator();
            Socket socket;
            ObjectOutputStream oos;
            boolean retorno = false;
            while (iterator.hasNext()){
                try {
                    
                    socket = new Socket(iterator.next().toString(), PUERTO);
                    oos = new ObjectOutputStream(socket.getOutputStream());
                    oos.writeObject(m);
                    socket.close();
                    retorno = true;
                } catch (UnknownHostException ex) {
                    Logger.getLogger(LibreriaMensajes.class.getName()).
                            log(Level.SEVERE, null, ex);
                    retorno = false;
                    
                } catch (IOException ex) {
                    Logger.getLogger(LibreriaMensajes.class.getName()).
                            log(Level.SEVERE, null, ex);
                    retorno = false;
                }
            }
            return retorno;

    }
    
    /**
     * Método que permite enviar un mensaje a un host particular utilizando el
     * puerto por defecto.
     * @param mensaje El mensaje a enviar
     * @param ipDestino El host al que se le enviará el mensaje.
     * @return True si el mensaje se envío. False si hubo algún error.
     */
    public boolean enviarMensaje(String mensaje, String ipDestino){

            Mensaje m = new Mensaje(ipOrigen,mensaje);
            Socket socket;
            ObjectOutputStream oos;
            boolean retorno = false;
            try {
                    
                socket = new Socket(ipDestino, PUERTO);
                oos = new ObjectOutputStream(socket.getOutputStream());
                oos.writeObject(m);
                socket.close();
                retorno = true;
            } catch (UnknownHostException ex) {
                    Logger.getLogger(LibreriaMensajes.class.getName()).
                            log(Level.SEVERE, null, ex);
                    retorno = false;
                } catch (IOException ex) {
                    Logger.getLogger(LibreriaMensajes.class.getName()).
                            log(Level.SEVERE, null, ex);
                    retorno = false;
                }
            
            return retorno;

    }
    
    /**
     * Método que permite enviar un mensaje a un host particular utilizando un
     * puerto específico.
     * @param mensaje El mensaje a enviar.
     * @param ipDestino El host destino.
     * @param puerto El puerto de conexión.
     * @return True si el mensaje pudo ser enviado. False si hubo algún error.
     */
     public boolean enviarMensaje(String mensaje, String ipDestino,int puerto){

        Mensaje m = new Mensaje(ipOrigen,mensaje);
        Socket socket;
        ObjectOutputStream oos;
        boolean retorno = false;
        
        try {

             socket = new Socket(ipDestino, puerto);
             oos = new ObjectOutputStream(socket.getOutputStream());
             oos.writeObject(m);
             socket.close();
             retorno = true;

            } catch (UnknownHostException ex) {
                Logger.getLogger(LibreriaMensajes.class.getName()).
                        log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
                Logger.getLogger(LibreriaMensajes.class.getName()).
                        log(Level.SEVERE, null, ex);
            }

        return retorno;

    }
     
     /**
      * Método que permite enviar un mensaje completo (ya creado anteriormente) 
      * a todos los host de la lista ipDestino utilizando el puerto por defecto.
      * @param mensaje El mensaje a reenviar
      * @return True si el mensaje fue envíado. False si hubo algún error.
      */
      public boolean enviarMensaje(Mensaje mensaje){

        Socket socket;
        ObjectOutputStream oos;
        boolean retorno = false;    
        Iterator iterator = ipDestino.iterator();
        while (iterator.hasNext()){
            try {

                socket = new Socket(iterator.next().toString(), PUERTO);
                oos = new ObjectOutputStream(socket.getOutputStream());
                oos.writeObject(mensaje);
                socket.close();
                retorno = true;

            } catch (UnknownHostException ex) {
                Logger.getLogger(LibreriaMensajes.class.getName()).
                        log(Level.SEVERE, null, ex);
                retorno = false;
            } catch (IOException ex) {
                Logger.getLogger(LibreriaMensajes.class.getName()).
                        log(Level.SEVERE, null, ex);
                retorno = false;
            }
        }
        return retorno;

    }
    
      /**
       * Método que permite enviar un mensaje completo (ya creado anteriormente)
       * a un host particular utilizando el puerto por defecto
       * @param mensaje El mensaje a reenviar
       * @param ipDestino El host de destino
       * @return True si se envío el mensaje. False si hubo un problema.
       */
    public boolean enviarMensaje(Mensaje mensaje, String ipDestino){

        Socket socket;
        ObjectOutputStream oos;
        boolean retorno = false;
        
        try {

            socket = new Socket(ipDestino, PUERTO);
            oos = new ObjectOutputStream(socket.getOutputStream());
            oos.writeObject(mensaje);
            socket.close();
            retorno = true;

        } catch (UnknownHostException ex) {
            Logger.getLogger(LibreriaMensajes.class.getName()).
                    log(Level.SEVERE, null, ex);
            retorno = false;
        } catch (IOException ex) {
            Logger.getLogger(LibreriaMensajes.class.getName()).
                    log(Level.SEVERE, null, ex);
            retorno = false;

        }

        return retorno;

    }
    
     /**
      * Método que permite enviar un mensaje completo (ya creado anteriormente)
      * a un host y puerto específico. 
      * @param mensaje El mensaje a reenviar.
      * @param ipDestino El host destino.
      * @param puerto El puerto de envío.
      * @return True si el mensaje fue envíado. False si hubo error.
      */
     public boolean enviarMensaje(Mensaje mensaje, String ipDestino,int puerto){
        
         Socket socket;
         ObjectOutputStream oos;
         boolean retorno = false;
           
        try {

            socket = new Socket(ipDestino, puerto);
            oos = new ObjectOutputStream(socket.getOutputStream());
            oos.writeObject(mensaje);
            socket.close();
            retorno = true;
        } catch (UnknownHostException ex) {
            Logger.getLogger(LibreriaMensajes.class.getName()).
                    log(Level.SEVERE, null, ex);

        } catch (IOException ex) {
            Logger.getLogger(LibreriaMensajes.class.getName()).
                    log(Level.SEVERE, null, ex);

        }

        return retorno;

    }
    
    /**
     * Método que envía un mensaje de tipo agente a todos los host de la lista
     * ipDestino utilizando el puerto por defecto.
     * @param informacion El mensaje a enviar de tipo agente.
     * @return True si el mensaje fue enviado. False si hubo error.
     */ 
    public boolean enviarMensaje(InformacionAgente informacion){
        Socket socket;
        ObjectOutputStream oos;
        boolean retorno = false;
            
        Iterator iterator = ipDestino.iterator();
        while (iterator.hasNext()){
            try {

                socket = new Socket(iterator.next().toString(), PUERTO);
                oos = new ObjectOutputStream(socket.getOutputStream());
                oos.writeObject(informacion);
                socket.close();
                retorno = true;

            } catch (UnknownHostException ex) {
                Logger.getLogger(LibreriaMensajes.class.getName()).
                        log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
                Logger.getLogger(LibreriaMensajes.class.getName()).
                        log(Level.SEVERE, null, ex);
            }
        }
        return retorno;

    }
     
    /**
     * Método que envía un mensaje de tipo agente a un host específico
     * utilizando el puerto por defecto.
     * @param informacionAgente El mensaje a enviar de tipo agente.
     * @param ipDestino La dirección ip del host destino.
     * @return  True si el mensaje fue enviado. False si hubo error.
     */ 
    public boolean enviarMensaje(InformacionAgente informacionAgente, 
            String ipDestino){
        
        Socket socket;
        ObjectOutputStream oos;
        boolean retorno = false;

        try {

            socket = new Socket(ipDestino,PUERTO);
            oos = new ObjectOutputStream(socket.getOutputStream());
            oos.writeObject(informacionAgente);
            socket.close();
            retorno = true;

        } catch (UnknownHostException ex) {
            Logger.getLogger(LibreriaMensajes.class.getName()).
                    log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(LibreriaMensajes.class.getName()).
                    log(Level.SEVERE, null, ex);
        }

        return retorno;

    }
    
    /**
     * Método que permite enviar el mensaje agente hacia un host y puerto
     * particular.
     * @param informacionAgente El mensaje tipo agente.
     * @param ipDestino Dirección ip del host destino
     * @param puerto Puerto de destino.
     * @return True si se envió el mensaje. False si hubo error.
     */
    public boolean enviarMensaje(InformacionAgente informacionAgente, 
            String ipDestino, int puerto){
        
        Socket socket;
        ObjectOutputStream oos;   
        boolean retorno = false; 
            
        try {       
                socket = new Socket(ipDestino,puerto);
                oos = new ObjectOutputStream(socket.getOutputStream());
                oos.writeObject(informacionAgente);
                socket.close();
                retorno = true;
        } catch (UnknownHostException ex) {
                Logger.getLogger(LibreriaMensajes.class.getName()).
                        log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
                Logger.getLogger(LibreriaMensajes.class.getName()).
                        log(Level.SEVERE, null, ex);       
        }
        return retorno;

    }
    
    
     
    /**
     * Método que permite agregar un mensaje recibido a la lista de mensajes.
     * @param mensaje El mensaje a agregar.
     * @return True si el mensaje se pudo agregar. False si hubo error.
     */
    public boolean agregarMensajeRecibido(Mensaje mensaje){
        
        if (mensajesRecibidos.size() <= mensajes_maximos)
            
            if (mensajesRecibidos.size() == mensajes_maximos){
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
    
    /**
     * Método que permite agregar un mensaje de tipo agente recibido a su lista
     * de mensajes 
     * @param informacionAgente El mensaje a agregar.
     * @return True si el mensaje se pudo agregar. False si hubo error.
     */
    public boolean agregarMensajeRecibido(InformacionAgente informacionAgente){
        boolean retorno = false;
        
        if (mensajesAgente.size() <= mensajes_maximos){
            
            if (mensajesAgente.size() == mensajes_maximos){
                mensajesAgente.remove(0);
                mensajesAgente.add(informacionAgente);
                retorno = true;
            }
            else{
                mensajesAgente.add(informacionAgente);
                retorno = true;
            }
        }
        
       return  retorno;
    
    }

    /**
     * Método que añade una dirección ip a la lista de ips destino.
     * @param ip  La dirección a agregar.
     */
    public void agregarIpDestino(String ip){
        
        ipDestino.add(ip);
    }
    
    /**
     * Método que elimina una dirección ip de la lista de ips destino. 
     * @param ip El ip a eliminar.
     */
    public void eliminarIpDestino(String ip){

        if (buscarIp(ip) != null)
           ipDestino.remove(buscarIp(ip));

    }

    /**
     * Método que busca una dirección ip de la lista de ips destino.
     * @param ip La dirección ip a buscar.
     * @return La dirección ip.
     */
    public String buscarIp(String ip){
        String direccionIp = "";
        String ips = "";
        Iterator iterator = ipDestino.iterator();
        
        while (iterator.hasNext()){
            ips = iterator.next().toString();
            if (ips.contentEquals(ip)){
                direccionIp = ips;
            }
        }
        return direccionIp;
    }
    
    /**
     * Método que devuelve el último mensaje general de la lista.
     * @return El último mensaje recibido.
     */
    public Mensaje ultimoMensaje(){
        Mensaje mensaje = null;
        
        if (mensajesRecibidos.size()>0){
            mensaje = (mensajesRecibidos.get(mensajesRecibidos.size()-1));
        }
        return  mensaje;
    }
    
    /**
     * Método que devuelve el último mensaje de tipo agente recibido
     * @return El último mensaje del agente.
     */
    public InformacionAgente ultimoMensajeAgente(){
        InformacionAgente informacionAgente = null;
        
        if (mensajesAgente.size()>0){
            informacionAgente = (mensajesAgente.get(mensajesAgente.size()-1));
        }
        return  informacionAgente;
    }
    
    /**
     * Busca un mensaje dado un indice de la lista de mensajes.
     * @param index El indice (posicion) del mensaje.
     * @return El mensaje a buscar.
     */
    public Mensaje buscarMensaje(int index){
        Mensaje mensaje = null;
        
        if ((index>=0) && (index<mensajesRecibidos.size())){
            mensaje = mensajesRecibidos.get(index);
        }
        return  mensaje;
    }
    
    /**
     * Método que permite eliminar un mensaje de la lista de mensajes
     * @param m El mensaje a eliminar
     * @return True si el mensaje fue eliminado. False si hubo error.
     */
    public boolean eliminarMensaje(Mensaje m){
        boolean retorno = false;
        
        if (mensajesRecibidos.remove(m) == true){
            retorno = true;
        }
        return retorno;
    }
    
    /**
     * Método que elimina un mensaje de tipo agente de la lista de mensajes.
     * @param informacionAgente El mensaje a eliminar
     * @return  True si el mensaje fue eliminado. False si hubo un error.
     */
    public boolean eliminarMensaje(InformacionAgente informacionAgente){
        boolean retorno = false;
        
        if (mensajesAgente.remove(informacionAgente) == true){
            retorno = true;
        }
        return retorno;
        
    }
    
    /**
     * Método que retorna la dirección ip de la máquina asociada al patrón
     * envíado
     * @param direccion Patrón enviado para retornar la dirección ip.
     * @return Dirección ip del host.
     */
    public String obtenerIp(String direccion){
        String direccionIp = "";
        Enumeration enumeration;
        NetworkInterface networkInterface;
        InetAddress inetAddress;
        Enumeration enumeration1;
        try {
            enumeration = NetworkInterface.getNetworkInterfaces();
            while(enumeration.hasMoreElements()){
                    
                networkInterface = (NetworkInterface) enumeration.nextElement();
                enumeration1 = networkInterface.getInetAddresses();
                    
                while(enumeration1.hasMoreElements()){
                        
                    inetAddress = (InetAddress) enumeration1.nextElement();
                        
                    if (inetAddress.getHostAddress().contains(direccion)){
                        direccionIp = inetAddress.getHostAddress();
                    }
                }
            }
        } catch (SocketException ex) {
            Logger.getLogger(LibreriaMensajes.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return direccionIp;
    }


}
