/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cristian_cliente;

import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author sam
 */
public class Sincronizacion extends Thread{
    
    private boolean control = true;
    private int tiempoSincronizacion;
    private LogicaAplicacion logicaAplicacion;

    public Sincronizacion(int tiempoSincronizacion, LogicaAplicacion logicaAplicacion) {
        this.tiempoSincronizacion = tiempoSincronizacion;
        this.logicaAplicacion = logicaAplicacion;
    }
    
    
    
    
    
    
    @Override
    public void run(){
     
        
        while (control){
            try {
              
                logicaAplicacion.enviarMensaje("sincronizacion");  
                Thread.sleep(1000*tiempoSincronizacion);
            } catch (InterruptedException ex) {
                Logger.getLogger(Sincronizacion.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
}
