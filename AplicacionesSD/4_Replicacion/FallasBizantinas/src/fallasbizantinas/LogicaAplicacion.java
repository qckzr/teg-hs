/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package fallasbizantinas;

import Libreria.LibreriaMensajes;
import Libreria.Mensaje;
import java.util.ArrayList;
import java.util.Arrays;
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
    private ArrayList<String> nodos;
    private String vectorProcesos;
    private String[] vectorDemasProcesos;
    private String valorNodo = "";
    private String nodo1 = "";
    private String nodo2 = "";
    private String nodo3 = "";
    private String[] vectorFinal;
    private boolean corrupto = false;
    

    public LogicaAplicacion(LibreriaMensajes libreriaMensajes, DatosAplicacion datosAplicacion,int puertoAgente) {
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        nodos = new ArrayList<>();

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
                
                System.out.println("Se ha recibido el mensaje: \""+mensaje.getMensaje()+"\" proveniente del host: "+mensaje.getIpOrigen());
                if (mensaje.getMensaje().contains("id")){
                    enviarMensaje(1);
                }
                else if (mensaje.getMensaje().contains("numero:")){
                    colocarNumero(mensaje);
                }
                else if (mensaje.getMensaje().contains("vector:")){
                    colocarVector(mensaje);
                }
                
            }
        };
        return false;
    }
     
    public void enviarId(String ipServidor){
        libreriaMensajes.enviarMensaje("id<"+datosAplicacion.getIdProceso(),ipServidor);
    }
    
    
    public void agregarNodo(String ip){
        nodos.add(ip);
    }
    
    public void enviarMensaje(int opcion){
        libreriaMensajes.enviarMensaje("Enviando Id a los demas procesos...");
        String mensaje = "";
        switch (opcion){
            case 1: 
                mensaje ="numero:"+valorNodo;
                break;
        }
        
        for (String nodo : nodos) {
            if (corrupto == false)
                libreriaMensajes.enviarMensaje(mensaje, nodo);
            else{
                 int valorAleatorio = (int) (1 + Math.random()*5);
                 libreriaMensajes.enviarMensaje("numero:"+valorAleatorio, nodo);
            }
        }
    }
    
    public void colocarNumero(Mensaje mensaje){
        
        if (mensaje.getIpOrigen().contentEquals(nodos.get(0)))
            nodo1 = mensaje.getMensaje().substring(mensaje.getMensaje().indexOf(":")+1);
        else if (mensaje.getIpOrigen().contentEquals(nodos.get(1)))
            nodo2 = mensaje.getMensaje().substring(mensaje.getMensaje().indexOf(":")+1);
        else
            nodo3 = mensaje.getMensaje().substring(mensaje.getMensaje().indexOf(':')+1);
        
        
        if (nodo1.length()>0 && nodo2.length()>0 && nodo3.length()>0){
            if (datosAplicacion.getNumeroNodoAplicacion().contains("1"))
                vectorProcesos = valorNodo+"-"+nodo1+"-"+nodo2+"-"+nodo3;
            else if (datosAplicacion.getNumeroNodoAplicacion().contains("2"))
                vectorProcesos = nodo1+"-"+valorNodo+"-"+nodo2+"-"+nodo3;
            else if (datosAplicacion.getNumeroNodoAplicacion().contains("3"))
                vectorProcesos = nodo1+"-"+nodo2+"-"+valorNodo+"-"+nodo3;
            else
                vectorProcesos = nodo1+"-"+nodo2+"-"+nodo3+"-"+valorNodo;
            enviarVector();
        }
    }
    
    public void enviarVector(){
        for (String nodo : nodos) {
            if (corrupto == false)
                libreriaMensajes.enviarMensaje("vector:"+vectorProcesos,nodo);
            else{
                String nuevoVector = valorAleatorio()+"-"+valorAleatorio()+"-"+
                        valorAleatorio()+"-"+valorAleatorio();
                libreriaMensajes.enviarMensaje("vector:"+nuevoVector,nodo);
            }
        }
        
    }
    
    
    public void colocarVector(Mensaje mensaje){
        String vector = mensaje.getMensaje().substring(mensaje.getMensaje().indexOf(":") +1);
        if (mensaje.getIpOrigen().contentEquals(nodos.get(0)))
            vectorDemasProcesos[0] = vector;
        else if (mensaje.getIpOrigen().contentEquals(nodos.get(1)))
            vectorDemasProcesos[1] = vector;
        else
            vectorDemasProcesos[2] = vector;
        
        if (vectorDemasProcesos[0].length()>0 && vectorDemasProcesos[1].length()>0 && vectorDemasProcesos[2].length()>0){
             System.out.println("Vector Procesos:"+vectorProcesos);
             libreriaMensajes.enviarMensaje("Vector Procesos:"+vectorProcesos);
             System.out.println("Vector Otros Procesos 1:"+vectorDemasProcesos[0]);
             libreriaMensajes.enviarMensaje("Vector Otros Procesos 1:"+vectorDemasProcesos[0]);
             System.out.println("vector demas procesos:"+vectorDemasProcesos[1]);
             libreriaMensajes.enviarMensaje("Vector Otros Procesos 2:"+vectorDemasProcesos[1]);
             System.out.println("vector demas procesos:"+vectorDemasProcesos[2]);
             libreriaMensajes.enviarMensaje("Vector Otros Procesos 3:"+vectorDemasProcesos[2]);
            calcularVector();
            
        }
    }
    
    
    public void calcularVector(){
       int posicion = 0;
       String [] casillas = vectorProcesos.split("-");
        for (String string : casillas) {
            compararCasilla(Integer.valueOf(string), posicion);
            posicion++;
        }
        
        imprimirVectorFinal();
        
        
    }
    
    
    public void compararCasilla(int valor,int posicion){
        int [] vector =  new int [3];
        String []vector1 = vectorDemasProcesos[0].split("-");
        String []vector2 = vectorDemasProcesos[1].split("-");
        String []vector3 = vectorDemasProcesos[2].split("-");
        switch (posicion){
            case 0:
                    vector[0] = Integer.valueOf(vector1[0]);
                    vector[1] = Integer.valueOf(vector2[0]);
                    vector[2] = Integer.valueOf(vector3[0]);
                break;
            case 1:
                    vector[0] = Integer.valueOf(vector1[1]);
                    vector[1] = Integer.valueOf(vector2[1]);
                    vector[2] = Integer.valueOf(vector3[1]);
                break;
            case 2:
                    vector[0] = Integer.valueOf(vector1[2]);
                    vector[1] = Integer.valueOf(vector2[2]);
                    vector[2] = Integer.valueOf(vector3[2]);
                break;
            case 3:
                    vector[0] = Integer.valueOf(vector1[3]);
                    vector[1] = Integer.valueOf(vector2[3]);
                    vector[2] = Integer.valueOf(vector3[3]);
                break;

        }
        int repeticion = contarRepeticion(valor, vector);
        if (repeticion >2)
            vectorFinal[posicion] = String.valueOf(valor);
        else{
            repeticion = contarRepeticion(vector[0],Arrays.copyOfRange(vector,1, vector.length));
            if (repeticion>1)
                vectorFinal[posicion] = String.valueOf(vector[0]);
            else{
                repeticion = contarRepeticion(vector[1], Arrays.copyOfRange(vector,2, vector.length));
                if (repeticion>1)
                    vectorFinal[posicion] = String.valueOf(vector[1]);
                else
                    vectorFinal[posicion] = "UNKNOWN";
            }
                
        }
        
                
            
        
        
        
        
        
    }
    
    public int contarRepeticion (int valor, int[] vector){
         int repeticiones = 1;
         for (int i = 0; i < vector.length; i++) {
            if (valor == vector[i])
                repeticiones++;
            
        }
         return repeticiones;
    }
    
    public void imprimirVectorFinal(){
        System.out.println("Vector Final: ["+vectorFinal[0]+","+vectorFinal[1]+","
                + ""+vectorFinal[2]+","+vectorFinal[3]+"]");
        libreriaMensajes.enviarMensaje("Vector Final: ["+vectorFinal[0]+","+vectorFinal[1]+","
                + ""+vectorFinal[2]+","+vectorFinal[3]+"]");
    }
    
    public void iniciar(int opcion){
        try {
            vectorDemasProcesos = new String[3];
            vectorDemasProcesos[0] = "";
            vectorDemasProcesos[1] = "";
            vectorDemasProcesos[2] = "";
            vectorFinal = new String[4];
            valorNodo = datosAplicacion.getNumeroNodoAplicacion();
            int valorAleatorio = (int) (1 + Math.random()*5);
            if (valorAleatorio == 1){
                System.out.println("Corrupto");
                libreriaMensajes.enviarMensaje("Corrupto");
                corrupto = true;
                
            }
            Thread.sleep(5000);
            if (opcion == 1){
                for (String string : nodos) {
                    libreriaMensajes.enviarMensaje("id:", string);
                }
                libreriaMensajes.enviarMensaje("id:",libreriaMensajes.getIpOrigen());
            }
        } catch (InterruptedException ex) {
            Logger.getLogger(LogicaAplicacion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    public String valorAleatorio(){
        return String.valueOf((int)(5 + Math.random()*10));
        
    }
    
    
    
    
   
    
   

    
    
   
}
