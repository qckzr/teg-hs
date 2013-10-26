/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package grandulon;

import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * Clase que permite esperar por los mensajes de los demás nodos al iniciar una
 * votación de coordinador.
 * @author Héctor Sam
 */
public class EsperaMensaje extends Thread{
    
    private boolean control = true;
    private long tiempoEspera;
    private LogicaAplicacion logicaAplicacion;
    private boolean empezar = false;
    
    
    public EsperaMensaje(LogicaAplicacion logicaAplicacion,long tiempoEspera){
        this.logicaAplicacion = logicaAplicacion;
        this.tiempoEspera = tiempoEspera;
    }

    public boolean isEmpezar() {
        return empezar;
    }

    public void setEmpezar(boolean empezar) {
        this.empezar = empezar;
    }
    
    
    
    
    /**
     * Método que perite enviar el mensaje de anuncion del coordinador al
     * pasar el tiempo de espera.
     */
    @Override
    public void run(){
        
        while (control){
            try {
                EsperaMensaje.sleep(tiempoEspera);
                control = false;
                if (!logicaAplicacion.isRecibiOk()){
                    System.out.println("nodo COORDINADOR");
                    logicaAplicacion.getLibreriaMensajes().
                            enviarMensaje("nodo COORDINADOR");
                    logicaAplicacion.enviarMensaje("COORDINADOR");
                    logicaAplicacion.setCoordinador(true);
                    logicaAplicacion.eliminarNodosCaidos();
                }
            } catch (InterruptedException ex) {
                Logger.getLogger(EsperaMensaje.class.getName()).
                        log(Level.SEVERE, null, ex);
            }
            
            
        }
    }
    
}
