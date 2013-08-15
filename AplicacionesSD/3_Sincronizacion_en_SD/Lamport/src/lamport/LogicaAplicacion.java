/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lamport;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author sam
 */
public class LogicaAplicacion {

    private LibreriaMensajes libreriaMensajes;
    private int puertoAgente;
    private DatosAplicacion datosAplicacion;
    private String nodoSiguiente;
    private String nodoAnterior;
    private MarcaReloj marcaReloj;
    

    public LogicaAplicacion(LibreriaMensajes libreriaMensajes, DatosAplicacion datosAplicacion,int puertoAgente,String nodoSiguiente,String nodoAnterior) {
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        this.nodoSiguiente = nodoSiguiente;
        this.nodoAnterior = nodoAnterior;
        marcaReloj = new MarcaReloj(this);
        marcaReloj.start();
        
        
    }
    
    public boolean verificarMensajeRecibido(Mensaje mensaje){
        
        switch (mensaje.getMensaje()){
            case "aplicacion": 
                if (libreriaMensajes.enviarMensaje(datosAplicacion.getNombreAplicacion(),"localhost", puertoAgente))
                    return true;
                break;
            case "nodo":
                if (libreriaMensajes.enviarMensaje(datosAplicacion.getNumeroNodoAplicacion(),"localhost",puertoAgente))
                    return true;
                break;
            default:{
                
      //          System.out.println("Se ha recibido el mensaje: \""+mensaje.getMensaje()+"\" proveniente del host: "+mensaje.getIpOrigen());
                if (mensaje.getIpOrigen().contentEquals(nodoAnterior) || mensaje.getIpOrigen().contentEquals(nodoSiguiente))
                    evaluarMarca(mensaje.getMensaje());
                else
                    
                    enviarMarca();
                    
                
                
            }
        };
        return false;
    }
     
    public void enviarId(String ipServidor){
        libreriaMensajes.enviarMensaje(datosAplicacion.getIdProceso(),ipServidor);
    }
    
    public boolean evaluarMarca(String marcaRecibida){
        try {
            String marca;
            Thread.sleep(2000);
            if (marcaRecibida.contains("+")){
                marca = marcaRecibida.substring(marcaRecibida.indexOf("+")+1);
                if (Integer.valueOf(marca)<marcaReloj.getMarcaActual()){
                    if (nodoSiguiente.length()>0)
                        enviarMarca("+"+String.valueOf(marcaReloj.getMarcaActual()));
                    else
                        enviarMarca("-"+String.valueOf(marcaReloj.getMarcaActual()));
                }
                else{
                    System.out.println("ARREGLANDO MARCA DE LAMPORT! "+marca+" > "+marcaReloj.getMarcaActual());
                    marcaReloj.setMarcaActual(Integer.valueOf(marca)+1);
                    if (nodoSiguiente.length()>0)
                        enviarMarca("+"+String.valueOf(marcaReloj.getMarcaActual()));
                    else
                        enviarMarca("-"+String.valueOf(marcaReloj.getMarcaActual()));
                }
                
            }
            else{
                marca = marcaRecibida.substring(marcaRecibida.indexOf("-")+1);
                if (Integer.valueOf(marca)<marcaReloj.getMarcaActual()){
                    if (nodoAnterior.length()>0)
                        enviarMarca("-"+String.valueOf(marcaReloj.getMarcaActual()));
                    else
                        enviarMarca("+"+String.valueOf(marcaReloj.getMarcaActual()));
                }
                else{
                    System.out.println("ARREGLANDO MARCA DE RELOJ! "+marca+" > "+marcaReloj.getMarcaActual());
                    marcaReloj.setMarcaActual(Integer.valueOf(marca)+1);
                    if (nodoAnterior.length()>0)
                        enviarMarca("-"+String.valueOf(marcaReloj.getMarcaActual()));
                    else
                        enviarMarca("+"+String.valueOf(marcaReloj.getMarcaActual()));
                }
            }
                
            
            return true;
        } catch (InterruptedException ex) {
            Logger.getLogger(LogicaAplicacion.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    public boolean enviarMarca(String marcaActual){
      
        if (marcaActual.contains("+") && nodoSiguiente.length()>0){
                libreriaMensajes.enviarMensaje(marcaActual, nodoSiguiente);
                return true;
        }
        else if (marcaActual.contains("-") && nodoAnterior.length()>0){
            libreriaMensajes.enviarMensaje(marcaActual,nodoAnterior);
            return true;
        }
        else if (nodoSiguiente.length()==0){
            libreriaMensajes.enviarMensaje(marcaActual, nodoAnterior);
            return true;
        }
        else{
            libreriaMensajes.enviarMensaje(marcaActual,nodoSiguiente);
            return true;
        }
            
    }
    
    public boolean  enviarMarca(){
        libreriaMensajes.enviarMensaje("+"+marcaReloj.getMarcaActual(),nodoSiguiente);
        return true;
    }
    
    

    
    
   
}
