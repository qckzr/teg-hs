/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package berkeley_servidor;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Clase que implementa la lógica de la aplicación para el tópico Algoritmo de
 * Berkeley - Servidor.
 * @author Héctor Sam.
 */
public class LogicaAplicacion {

    private static LogicaAplicacion instancia = null;
    private LibreriaMensajes libreriaMensajes;
    private int puertoAgente;
    private DatosAplicacion datosAplicacion;
    private ArrayList<String> nodos;
    private int mensajesRecibidos;
    private ArrayList<Date> horas;
    private PreguntarHora preguntarHora;
    

    private LogicaAplicacion(LibreriaMensajes libreriaMensajes,
            DatosAplicacion datosAplicacion,int puertoAgente, int tiempo) {
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        nodos = new ArrayList<>();
        horas = new ArrayList<Date>();
        mensajesRecibidos = 0;
        preguntarHora = new PreguntarHora(tiempo, this);
        preguntarHora.start();
      
        
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

    public ArrayList<String> getNodos() {
        return nodos;
    }

    public void setNodos(ArrayList<String> nodos) {
        this.nodos = nodos;
    }

    public int getMensajesRecibidos() {
        return mensajesRecibidos;
    }

    public void setMensajesRecibidos(int mensajesRecibidos) {
        this.mensajesRecibidos = mensajesRecibidos;
    }

    public ArrayList<Date> getHoras() {
        return horas;
    }

    public void setHoras(ArrayList<Date> horas) {
        this.horas = horas;
    }

    public PreguntarHora getPreguntarHora() {
        return preguntarHora;
    }

    public void setPreguntarHora(PreguntarHora preguntarHora) {
        this.preguntarHora = preguntarHora;
    }
    
    
    
    /**
     * Singleton
     * @param libreriaMensajes
     * @param datosAplicacion
     * @param puertoAgente
     * @param tiempo
     * @return 
     */
    public static LogicaAplicacion getInstancia(LibreriaMensajes libreriaMensajes,
            DatosAplicacion datosAplicacion,int puertoAgente, int tiempo) {
        if (instancia == null) {
            instancia = new LogicaAplicacion(libreriaMensajes, datosAplicacion,
                    puertoAgente, tiempo);
        }
        return instancia;
        
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
                 if (mensaje.getMensaje().contains(":activo")){
                     libreriaMensajes.enviarMensaje("Registrando nodo activo...");
                     agregarNodo(mensaje);
                 }
                 else if (mensaje.getMensaje().contains(":hora")){   
                     agregarHora(mensaje);
                     comprobarPromedio();
                 }
                     
           
            }
        };
        return false;
    }
     
    /**
     * Método que permite enviar el número de proceso al servidor central.
     * @param ipServidor 
     */
    public void enviarId(String ipServidor){
        libreriaMensajes.enviarMensaje("id<"+datosAplicacion.
                getIdProceso(),ipServidor);
        libreriaMensajes.enviarMensaje("Ejecutable inicializado");
    }
    
    /**
     * Método que permite agregar un nodo a la lista de nodos del servidor.
     * @param mensaje El mensaje con la dirección ip del nodo a agregar.
     * @return True si el nodo pudo agregarse. False en caso contrario.
     */
    public boolean agregarNodo(Mensaje mensaje){
        if (nodos.add(mensaje.getIpOrigen())) {
            return true;
        } else {
            return false;
        }
        
    }
    
    /**
     * Método que permite agregar una hora recibida.
     * @param mensaje El mensaje con la hora.
     * @return True si la hora fue agregada. False si hubo un error.
     */
    public boolean agregarHora(Mensaje mensaje){
        libreriaMensajes.enviarMensaje("Agregando hora...");
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss", Locale.ENGLISH);
            Date date = sdf.parse(mensaje.getHora());
            horas.add(date);
            mensajesRecibidos++;
            return true;
        } catch (ParseException ex) {
            Logger.getLogger(LogicaAplicacion.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        
    }
    
    /**
     * Método que permite calcular el promedio de todas las horas recibidas.
     * @return True si se recibieron tantos mensajes como nodos en el sistema.
     * False en caso contrario.
     */
    public boolean comprobarPromedio(){
        long longitud;
        Mensaje mensaje;
        Date nuevaFecha;
        
        if (mensajesRecibidos == nodos.size()){
            libreriaMensajes.enviarMensaje("Sincronizando relojes...");
            longitud = 0;
            for (Date date : horas) {
                longitud = longitud +date.getTime();
            }
            longitud = longitud / nodos.size();
            mensaje = new Mensaje(libreriaMensajes.getIpOrigen(),"_sincronizacionHora~");
            nuevaFecha = new Date(longitud);
            mensaje.setMensaje(mensaje.getMensaje()+mensaje.getHora().substring(
                    0,mensaje.getHora().indexOf(":")+1)+nuevaFecha.toString().substring(
                    nuevaFecha.toString().indexOf(":")+1,nuevaFecha.toString().
                    indexOf(":")+6));
            enviarMensaje(mensaje);
            return true;
        }
        else {
            return false;
        }
    }
    
    
    /**
     * Método que permite enviar un mensaje a todos los nodos clientes.
     * @param mensaje El mensaje a enviar.
     */
    public void enviarMensaje(Mensaje mensaje){
        for (String ip : nodos) {
            libreriaMensajes.enviarMensaje(mensaje, ip);
        }
        horas = new ArrayList<>();
        mensajesRecibidos = 0;
        
    }
    
    /**
     * Método que permite conocer la hora de cada nodo.
     */
    public void preguntarHora(){
        for (String ip : nodos) {
            libreriaMensajes.enviarMensaje("_hora", ip);
        }
    }
    
    
    
   
    
    
   
}
