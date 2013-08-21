/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package promedio;

import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author sam
 */
public class EscuchaHoras extends Thread{
    
    
    private boolean control = true;
    private int tiempoEspera;
    private  LogicaAplicacion logicaAplicacion;
    
    public EscuchaHoras(int tiempoEspera,LogicaAplicacion logicaAplicacion){
        this.tiempoEspera = tiempoEspera;
        this.logicaAplicacion = logicaAplicacion;
    }
    
    @Override
    public void run(){
        
        while (control){
            try {
                EscuchaHoras.sleep(tiempoEspera);
                control = false;
            } catch (InterruptedException ex) {
                Logger.getLogger(EscuchaHoras.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        logicaAplicacion.sincronizarReloj();
    }
    
}
