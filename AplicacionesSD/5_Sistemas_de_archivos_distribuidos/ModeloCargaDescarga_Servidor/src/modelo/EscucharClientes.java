/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;

/**
 * Clase que permite escuchar los mensajes enviados por otros hosts o por los 
 * agentes de configuración.
 * @author Héctor Sam
 */
public class EscucharClientes extends Thread{
    
    
    private boolean control = true;
    private LogicaAplicacion logicaAplicacion;
    private LibreriaMensajes libreriaMensajes;

    public boolean isControl() {
        return control;
    }

    public void setControl(boolean control) {
        this.control = control;
    }

    public LibreriaMensajes getLibreriaMensajes() {
        return libreriaMensajes;
    }

    public void setLibreriaMensajes(LibreriaMensajes libreriaMensajes) {
        this.libreriaMensajes = libreriaMensajes;
    }

    public LogicaAplicacion getLogicaAplicacion() {
        return logicaAplicacion;
    }

    public void setLogicaAplicacion(LogicaAplicacion logicaAplicacion) {
        this.logicaAplicacion = logicaAplicacion;
    }
    
    
    /**
     * Constructor de la clase, se recibe la clase lógica y librería de mensajes
     * para llamar a sus métodos.
     * @param logicaAplicacion La lógica de la aplicación.
     * @param libreriaMensajes La librería de mensajes.
     */
    public EscucharClientes(LogicaAplicacion logicaAplicacion, LibreriaMensajes libreriaMensajes) {
        this.logicaAplicacion = logicaAplicacion;
        this.libreriaMensajes = libreriaMensajes;
    }
    
    
    /**
     * Método que permite chequea si se han recibido mensajes en la librería
     * de mensajes.
     */
    @Override
    public void run(){
        
        while (control){
            
            if (libreriaMensajes.ultimoMensaje() != null){
                Mensaje mensaje= libreriaMensajes.ultimoMensaje();
                logicaAplicacion.verificarMensajeRecibido(mensaje);
                libreriaMensajes.eliminarMensaje(mensaje);
            }
            
        }
    }
    
    /**
     * Método que permite eliminar el hilo de ejecución.
     * @return True.
     */
    public boolean kill(){
        control = false;
        return true;
    }
    
    
    
    
    
}
