/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package promedio;

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
 * Clase que implementa la lógica de la aplicación para el tópico Relojes 
 * Físicos: Algoritmo con promedio (distribuido).
 * @author Héctor Sam.
 */
public class LogicaAplicacion {

    private static LogicaAplicacion instancia = null;
    private LibreriaMensajes libreriaMensajes;
    private int puertoAgente;
    private DatosAplicacion datosAplicacion;
    private String horaActual;
    private ArrayList<String> nodos;
    private ArrayList<Date> horasRecibidas;
    private EscuchaHoras escuchaHoras;
    private int tiempoEspera;
 
    

    private LogicaAplicacion(LibreriaMensajes libreriaMensajes,
            DatosAplicacion datosAplicacion,int puertoAgente, int tiempoEspera) {
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        nodos = new ArrayList<>();
        horasRecibidas = new ArrayList<>();
        this.tiempoEspera = tiempoEspera;
    }
    
    public static LogicaAplicacion getInstancia(LibreriaMensajes libreriaMensajes,
            DatosAplicacion datosAplicacion,int puertoAgente, int tiempoEspera) {
        if (instancia == null) {
            instancia = new LogicaAplicacion(libreriaMensajes, datosAplicacion,
                    puertoAgente, tiempoEspera);
        }
        return instancia;
    }

    public String getHoraActual() {
        return horaActual;
    }

    public void setHoraActual(String horaActual) {
        this.horaActual = horaActual;
    }
    
    public void agregarNodo(String ip){
        nodos.add(ip);
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

    public ArrayList<Date> getHorasRecibidas() {
        return horasRecibidas;
    }

    public void setHorasRecibidas(ArrayList<Date> horasRecibidas) {
        this.horasRecibidas = horasRecibidas;
    }

    public EscuchaHoras getEscuchaHoras() {
        return escuchaHoras;
    }

    public void setEscuchaHoras(EscuchaHoras escuchaHoras) {
        this.escuchaHoras = escuchaHoras;
    }

    public int getTiempoEspera() {
        return tiempoEspera;
    }

    public void setTiempoEspera(int tiempoEspera) {
        this.tiempoEspera = tiempoEspera;
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
            case "iniciar":
                enviarMensaje();
                escuchaHoras = new EscuchaHoras(tiempoEspera, this);
                escuchaHoras.start();
                return true;
            default:{             
                 System.out.println("Se ha recibido el mensaje: \""
                         +mensaje.getMensaje()+"\" proveniente del host: "
                         +mensaje.getIpOrigen());
                 
                 if (mensaje.getMensaje().contains("_hora")){
                       
                    enviarMensaje(datosAplicacion.getNumeroNodoAplicacion()
                            +":hora",mensaje.getIpOrigen());
                 }
                 else if (mensaje.getMensaje().contains(":hora")){
                     agregarHora(mensaje);                     
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
        libreriaMensajes.enviarMensaje("id<"
                +datosAplicacion.getIdProceso(),ipServidor);
        libreriaMensajes.enviarMensaje("Ejecutable inicializado");
    }
    
  
    
    /**
     * Método que envía a un nodo espcífico la hora local.
     * @param mensaje El mensaje de solicitud de hora.
     * @param ip La dirección ip del nodo solicitante.
     * @return True si el mensaje pudo ser enviado. False en caso contrario.
     */
    public boolean enviarMensaje(String mensaje, String ip){
        libreriaMensajes.enviarMensaje("Enviando hora actual...");
        Mensaje m = new Mensaje(libreriaMensajes.getIpOrigen(), mensaje);
        if (libreriaMensajes.enviarMensaje(mensaje+"_"+m.getHora(),ip)) {
            return true;
        }
        return false;
        
    }
    
    /**
     * Método que envía un mensaje a los demás nodos para solicitar la hora.
     * @return True.
     */
    public boolean enviarMensaje(){
        libreriaMensajes.enviarMensaje("Solicitando hora a los demas nodos...");
        for (String ip : nodos) {
            libreriaMensajes.enviarMensaje("_hora",ip);
        }
        return true;
    }
    
    /**
     * Método que permite sincronizar el reloj del nodo al calcular el tiempo
     * promedio de todas las horas recibidas.
     * @return True.
     */
    public boolean sincronizarReloj(){
        long differenceInMillis = 0;
        Date date;
        String complemento;
        for (Date date1 : horasRecibidas)
            differenceInMillis = differenceInMillis + date1.getTime();
        horaActual = new Mensaje("","").getHora();
        differenceInMillis = differenceInMillis / horasRecibidas.size();
        System.out.println("Hora Actual: "+horaActual);
        libreriaMensajes.enviarMensaje("Hora Actual: "+horaActual);
        date = new Date(differenceInMillis);
        complemento = date.toString().substring(date.toString().
                indexOf(":")+1,date.toString().indexOf(":")+6);
        System.out.println("Hora Actualizada: "
                +horaActual.substring(0,horaActual.indexOf(":")+1)+complemento);
        libreriaMensajes.enviarMensaje("Hora Actualizada: "
                +horaActual.substring(0,horaActual.indexOf(":")+1)+complemento);
        return true;
    }
    
    
    /**
     * Método que permite agregar una hora recibida a la lista de horas.
     * @param mensaje La hora recibida.
     * @return True si se pudo agregar. False en caso contrario.
     */
    public boolean agregarHora(Mensaje mensaje){
         try {
            SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss", Locale.ENGLISH);
            Date date = sdf.parse(mensaje.getHora());
            libreriaMensajes.enviarMensaje("Agregando hora recibida...");
            horasRecibidas.add(date);
            return true;

        } catch (ParseException ex) {
            Logger.getLogger(LogicaAplicacion.class.getName()).
                    log(Level.SEVERE, null, ex);
            return false;
        }

    }
    
   
    
    
   
}
