/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package desafios;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;

/**
 * Clase que verifica si han llegado mensajes a través de la librería de mensajes.
 * @author sam
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
    
    

    public EscucharClientes(LogicaAplicacion logicaAplicacion, LibreriaMensajes libreriaMensajes) {
        this.logicaAplicacion = logicaAplicacion;
        this.libreriaMensajes = libreriaMensajes;
    }
    
    /**
     * Método que permite verificar constantemente si llegaron mensajes en la 
     * librería de mensajes.
     */
    @Override
    public void run(){
        
        while (control){
            
            
            if (libreriaMensajes.ultimoMensaje()!=null){
                Mensaje mensaje= libreriaMensajes.ultimoMensaje();
                logicaAplicacion.verificarMensajeRecibido(mensaje);
                libreriaMensajes.eliminarMensaje(mensaje);
      
            }
            
        }
    }
    
    /**
     * Método para eliminar el hilo.
     * @return True.
     */
    public boolean kill(){
        control = false;
        return true;
    }
    
    
    
    
    
}
