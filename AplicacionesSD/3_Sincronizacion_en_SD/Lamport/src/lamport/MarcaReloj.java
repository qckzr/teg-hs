/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lamport;

import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author sam
 */
public class MarcaReloj extends Thread{
    
    
    private int incrementoMarcaReloj;
    private int marcaActual;
    private LogicaAplicacion logicaAplicacion;
    private boolean control = true;

    public MarcaReloj(LogicaAplicacion logicaAplicacion) {
        this.logicaAplicacion = logicaAplicacion;
        incrementoMarcaReloj = (int) (1 + Math.random()*10);
        logicaAplicacion.enviarId("INCREMENTANDO LAS MARCA DE RELOJ EN: "+incrementoMarcaReloj+" UNIDADES");
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
