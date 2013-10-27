/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cluster;

import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Clase que permite contar una cantidad de segundos específica.
 * @author Héctor Sam
 */
public class Tiempo extends Thread{
    
    private boolean control = true;
    private int segundos = 0;

    public  int getSegundos() {
        return segundos;
    }

    public void setSegundos(int segundos) {
        this.segundos = segundos;
    }
    
    
    /**
     * Método que permite contar cada segundo que transcurre.
     */
    @Override
    public void run(){
        
        while (control){
            try {
                segundos++;
                this.sleep(1000);
            } catch (InterruptedException ex) {
                Logger.getLogger(Tiempo.class.getName()).
                        log(Level.SEVERE, null, ex);
            }
            
        }
    }
    
    public void kill(){
        control = false;
    }
    
}
