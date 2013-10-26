/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lamport;

import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Clase que permite incrementar las marcas de reloj del nodo.
 * @author Héctor Sam
 */
public class MarcaReloj extends Thread{
    
    
    private int incrementoMarcaReloj;
    private int marcaActual;
    private LogicaAplicacion logicaAplicacion;
    private boolean control = true;

    public MarcaReloj(LogicaAplicacion logicaAplicacion) {
        this.logicaAplicacion = logicaAplicacion;
        incrementoMarcaReloj = (int) (1 + Math.random()*10);
        logicaAplicacion.getLibreriaMensajes().enviarMensaje("INCREMENTANDO LAS MARCA DE RELOJ EN: "
                + ""+incrementoMarcaReloj+" UNIDADES"); //PENDIENTE.
    }

    public int getIncrementoMarcaReloj() {
        return incrementoMarcaReloj;
    }

    public void setIncrementoMarcaReloj(int incrementoMarcaReloj) {
        this.incrementoMarcaReloj = incrementoMarcaReloj;
    }

    public LogicaAplicacion getLogicaAplicacion() {
        return logicaAplicacion;
    }

    public void setLogicaAplicacion(LogicaAplicacion logicaAplicacion) {
        this.logicaAplicacion = logicaAplicacion;
    }

    public int getMarcaActual() {
        return marcaActual;
    }

    public void setMarcaActual(int marcaActual) {
        this.marcaActual = marcaActual;
    }

    public boolean isControl() {
        return control;
    }

    public void setControl(boolean control) {
        this.control = control;
    }
    
    
    
    /**
     * Método que permite incrementar las marcas de reloj cada 4 segundos.
     */
    @Override
    public void run(){
        
        while (control){
            try {
                marcaActual = marcaActual + incrementoMarcaReloj;
                System.out.println(marcaActual);
                logicaAplicacion.getLibreriaMensajes().enviarMensaje(String.valueOf(marcaActual));
                this.sleep(4000);
            } catch (InterruptedException ex) {
                Logger.getLogger(MarcaReloj.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
    }
    
    
    public void kill(){
        control = false;
    }
    
}
