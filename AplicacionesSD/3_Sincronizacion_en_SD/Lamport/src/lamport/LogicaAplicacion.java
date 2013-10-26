/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lamport;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Clase que implementa la lógica de la aplicación para el tópico Relojes Lógicos
 * Algoritmo de Lamport.
 * @author Héctor Sam.
 */
public class LogicaAplicacion {

    private static LogicaAplicacion instancia = null;
    private LibreriaMensajes libreriaMensajes;
    private int puertoAgente;
    private DatosAplicacion datosAplicacion;
    private String nodoSiguiente;
    private String nodoAnterior;
    private MarcaReloj marcaReloj;
    

    private LogicaAplicacion(LibreriaMensajes libreriaMensajes, 
            DatosAplicacion datosAplicacion,int puertoAgente,
            String nodoSiguiente,String nodoAnterior) {
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        this.nodoSiguiente = nodoSiguiente;
        this.nodoAnterior = nodoAnterior;
        enviarId(libreriaMensajes.getIpDestino().get(0));
        marcaReloj = new MarcaReloj(this);
        marcaReloj.start();
        
        
    }
    
    /**
     * Singleton.
     * @param libreriaMensajes
     * @param datosAplicacion
     * @param puertoAgente
     * @param nodoSiguiente
     * @param nodoAnterior
     * @return 
     */
    public static LogicaAplicacion getInstancia(LibreriaMensajes libreriaMensajes, 
            DatosAplicacion datosAplicacion,int puertoAgente,
            String nodoSiguiente,String nodoAnterior) {
        if (instancia == null) {
            instancia = new LogicaAplicacion(libreriaMensajes,
                    datosAplicacion, puertoAgente, nodoSiguiente, nodoAnterior);
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

    public String getNodoSiguiente() {
        return nodoSiguiente;
    }

    public void setNodoSiguiente(String nodoSiguiente) {
        this.nodoSiguiente = nodoSiguiente;
    }

    public String getNodoAnterior() {
        return nodoAnterior;
    }

    public void setNodoAnterior(String nodoAnterior) {
        this.nodoAnterior = nodoAnterior;
    }

    public MarcaReloj getMarcaReloj() {
        return marcaReloj;
    }

    public void setMarcaReloj(MarcaReloj marcaReloj) {
        this.marcaReloj = marcaReloj;
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
                        getNombreAplicacion(),"localhost", puertoAgente))
                    return true;
                break;
            case "nodo":
                if (libreriaMensajes.enviarMensaje(datosAplicacion.
                        getNumeroNodoAplicacion(),"localhost",puertoAgente))
                    return true;
                break;
            default:{
                
                if (mensaje.getIpOrigen().contentEquals(nodoAnterior) 
                        || mensaje.getIpOrigen().contentEquals(nodoSiguiente)) {
                    evaluarMarca(mensaje.getMensaje());
                } else {   
                    enviarMarca();
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
    }
    
    /**
     * Método que permite evaluar la marca recibida para aplicar o no el algoritmo
     * de Lamport.
     * @param marcaRecibida La marca recibida para evaluar.
     * @return 
     */
    public boolean evaluarMarca(String marcaRecibida){
        try {
        String marca;
        Thread.sleep(2000);
        if (marcaRecibida.contains("+")){
            marca = marcaRecibida.substring(marcaRecibida.indexOf("+")+1);
            if (Integer.valueOf(marca)<marcaReloj.getMarcaActual()){
                if (nodoSiguiente.length()>0)
                    enviarMarca("+"+String.valueOf(marcaReloj.getMarcaActual()));
                else
                    enviarMarca("-"+String.valueOf(marcaReloj.getMarcaActual()));
            } else{
                System.out.println("ARREGLANDO MARCA DE LAMPORT! "
                        + ""+marca+" mayor que "+marcaReloj.getMarcaActual());
                libreriaMensajes.enviarMensaje("ARREGLANDO MARCA DE LAMPORT!"
                        + " "+marca+" mayor que "+marcaReloj.getMarcaActual());
                marcaReloj.setMarcaActual(Integer.valueOf(marca)+1);
                if (nodoSiguiente.length()>0) {
                    enviarMarca("+"+String.valueOf(marcaReloj.getMarcaActual()));
                } else {
                    enviarMarca("-"+String.valueOf(marcaReloj.getMarcaActual()));
                }
            }
                
        } else {
            marca = marcaRecibida.substring(marcaRecibida.indexOf("-")+1);
            if (Integer.valueOf(marca)<marcaReloj.getMarcaActual()){
                if (nodoAnterior.length()>0) {
                    enviarMarca("-"+String.valueOf(marcaReloj.getMarcaActual()));
                } else {
                    enviarMarca("+"+String.valueOf(marcaReloj.getMarcaActual()));
                }
            } else {
                System.out.println("ARREGLANDO MARCA DE RELOJ! "+marca+" mayor"
                        + " que "+marcaReloj.getMarcaActual());
                libreriaMensajes.enviarMensaje("ARREGLANDO MARCA DE RELOJ! "
                        + ""+marca+" mayor que "+marcaReloj.getMarcaActual());
                marcaReloj.setMarcaActual(Integer.valueOf(marca)+1);
                if (nodoAnterior.length()>0) {
                    enviarMarca("-"+String.valueOf(marcaReloj.getMarcaActual()));
                } else {
                    enviarMarca("+"+String.valueOf(marcaReloj.getMarcaActual()));
                }
            }
        }
            return true;
        } catch (InterruptedException ex) {
            Logger.getLogger(LogicaAplicacion.class.getName()).
                    log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    /**
     * Método que envia la marca de reloj actual al siguiente (o anterior) nodo
     * validando que si llega al borde (nodo 1 o 4) deba cambiar de sentido.
     * @param marcaActual La marca a enviar.
     * @return True.
     */
    public boolean enviarMarca(String marcaActual){
      
        if ( (marcaActual.contains("+")) && (nodoSiguiente.length() > 0) ){
                libreriaMensajes.enviarMensaje(marcaActual, nodoSiguiente);
                return true;
        }
        else if ( (marcaActual.contains("-"))&& (nodoAnterior.length() > 0)) {
            libreriaMensajes.enviarMensaje(marcaActual,nodoAnterior);
            return true;
        }
        else if (nodoSiguiente.length() == 0){
            libreriaMensajes.enviarMensaje(marcaActual, nodoAnterior);
            return true;
        }
        else{
            libreriaMensajes.enviarMensaje(marcaActual,nodoSiguiente);
            return true;
        }
            
    }
    
    /**
     * Método que permite enviar la marca de reloj al siguiente nodo.
     * @return True si la marca pudo ser enviada. False en caso contrario.
     */
    public boolean  enviarMarca(){
        if (libreriaMensajes.enviarMensaje("+"+marcaReloj.
                getMarcaActual(),nodoSiguiente)) {
        return true;
        } else {
            return false;
        }
    }
    
    

    
    
   
}
