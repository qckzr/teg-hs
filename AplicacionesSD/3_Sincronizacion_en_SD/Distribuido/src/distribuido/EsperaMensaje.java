/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package distribuido;

import Libreria.Mensaje;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author sam
 */
public class EsperaMensaje extends Thread{
    
    private boolean control = true;
    private long tiempoEspera;
    private LogicaAplicacion logicaAplicacion;
    private Mensaje mensaje;
    
    
    public EsperaMensaje(LogicaAplicacion logicaAplicacion,long tiempoEspera,Mensaje mensaje){
        this.logicaAplicacion = logicaAplicacion;
        this.tiempoEspera = tiempoEspera;
        this.mensaje = mensaje;
    }
    
    
    public void run(){
        
        while (control){
            try {
                EsperaMensaje.sleep(tiempoEspera);
                logicaAplicacion.enviarMensaje(mensaje);
                control = false;
            } catch (InterruptedException ex) {
                Logger.getLogger(EsperaMensaje.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            
        }
    }
    
}
