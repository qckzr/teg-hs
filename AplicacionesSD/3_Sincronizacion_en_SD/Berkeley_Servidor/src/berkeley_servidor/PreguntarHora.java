/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package berkeley_servidor;

import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author sam
 */
public class PreguntarHora extends Thread{
    
    
    private boolean control = true;
    private int tiempoEspera;
    private LogicaAplicacion logicaAplicacion;

    public PreguntarHora(int tiempoEspera, LogicaAplicacion logicaAplicacion) {
        this.tiempoEspera = tiempoEspera;
        this.logicaAplicacion = logicaAplicacion;
    }
    
    
    @Override
    public void run(){
        while (control){
            try {
                
                Thread.sleep(tiempoEspera);
                logicaAplicacion.preguntarHora();
            } catch (InterruptedException ex) {
                Logger.getLogger(PreguntarHora.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    
    public void kill(){
        control = false;
    }
}
