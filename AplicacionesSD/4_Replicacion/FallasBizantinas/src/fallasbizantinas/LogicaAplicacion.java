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
 * Clase que implementa la lógica de la aplicación para el tópico Fallas 
 * Bizantinas.
 * @author Héctor Sam.
 */
public class LogicaAplicacion {

    private static LogicaAplicacion instancia = null;
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
    private int tiempoHilo = 0;
    

    private LogicaAplicacion(LibreriaMensajes libreriaMensajes,
            DatosAplicacion datosAplicacion,int puertoAgente) {
        this.libreriaMensajes = libreriaMensajes;
        this.datosAplicacion = datosAplicacion;
        this.puertoAgente = puertoAgente;
        nodos = new ArrayList<>();

    }
    
    /**
     * Singleton.
     * @param libreriaMensajes
     * @param datosAplicacion
     * @param puertoAgente
     * @return 
     */
    public static LogicaAplicacion getInstance(LibreriaMensajes libreriaMensajes,
            DatosAplicacion datosAplicacion,int puertoAgente) {
        if (instancia == null) {
            instancia = new LogicaAplicacion(libreriaMensajes, datosAplicacion, puertoAgente);
        }
        return instancia;
    }

    public LibreriaMensajes getLibreriaMensajes() {
        return libreriaMensajes;
    }

    public void setLibreriaMensajes(LibreriaMensajes libreriaMensajes) {
        this.libreriaMensajes = libreriaMensajes;
    }

    public int getPuertoAgente() {
        return puertoAgente;
    }

    public void setPuertoAgente(int puertoAgente) {
        this.puertoAgente = puertoAgente;
    }

    public DatosAplicacion getDatosAplicacion() {
        return datosAplicacion;
    }

    public void setDatosAplicacion(DatosAplicacion datosAplicacion) {
        this.datosAplicacion = datosAplicacion;
    }

    public ArrayList<String> getNodos() {
        return nodos;
    }

    public void setNodos(ArrayList<String> nodos) {
        this.nodos = nodos;
    }

    public String getVectorProcesos() {
        return vectorProcesos;
    }

    public void setVectorProcesos(String vectorProcesos) {
        this.vectorProcesos = vectorProcesos;
    }

    public String[] getVectorDemasProcesos() {
        return vectorDemasProcesos;
    }

    public void setVectorDemasProcesos(String[] vectorDemasProcesos) {
        this.vectorDemasProcesos = vectorDemasProcesos;
    }

    public String getValorNodo() {
        return valorNodo;
    }

    public void setValorNodo(String valorNodo) {
        this.valorNodo = valorNodo;
    }

    public String getNodo1() {
        return nodo1;
    }

    public void setNodo1(String nodo1) {
        this.nodo1 = nodo1;
    }

    public String getNodo2() {
        return nodo2;
    }

    public void setNodo2(String nodo2) {
        this.nodo2 = nodo2;
    }

    public String getNodo3() {
        return nodo3;
    }

    public void setNodo3(String nodo3) {
        this.nodo3 = nodo3;
    }

    public String[] getVectorFinal() {
        return vectorFinal;
    }

    public void setVectorFinal(String[] vectorFinal) {
        this.vectorFinal = vectorFinal;
    }

    public boolean isCorrupto() {
        return corrupto;
    }

    public void setCorrupto(boolean corrupto) {
        this.corrupto = corrupto;
    }

    public int getTiempoHilo() {
        return tiempoHilo;
    }

    public void setTiempoHilo(int tiempoHilo) {
        this.tiempoHilo = tiempoHilo;
    }
    
    
    
    
    
    
    /**
     * Método que permite chequear el mensaje recibido para decidir si pertenece
     * al agente de configuración, al módulo de ciclo de vida o a un nodo.
     * @param mensaje El mensaje recibido.
     * @return True si pertence al agente. False en caso contrario.
     */
    public boolean verificarMensajeRecibido(Mensaje mensaje){
        
        switch (mensaje.getMensaje()){
            case "aplicacion": 
                if (libreriaMensajes.enviarMensaje(datosAplicacion.
                        getNombreAplicacion(),"localhost", puertoAgente))
                    return true;
                break;
            case "nodo":
                if (libreriaMensajes.enviarMensaje(datosAplicacion.
                        getNumeroNodoAplicacion(),"localhost",puertoAgente))
                    return true;
                break;
            default:{
                
                System.out.println("Se ha recibido el mensaje: \""
                        +mensaje.getMensaje()+"\" proveniente del host: "
                        +mensaje.getIpOrigen());
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
     
    /**
     * Método que permite enviar el número de proceso al servidor central.
     * @param ipServidor 
     */
    public void enviarId(String ipServidor){
        libreriaMensajes.enviarMensaje("id<"+datosAplicacion.getIdProceso(),ipServidor);
    }
    
    
    /**
     * Método que permite agregar un nodo a la lista de nodos locales.
     * @param ip La dirección ip del nodo.
     */
    public void agregarNodo(String ip){
        nodos.add(ip);
    }
    
    /**
     * Método que permite enviar el número de proceso a los demás nodos del
     * sistema distribuido.
     * @param opcion 1 Para enviar el número de proceso.
     */
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
    
    /**
     * Método que permite colocar los valores de los números de procesos de los 
     * otros nodos en el vector principal del nodo actual.
     * @param mensaje El número de proceso de un nodo particular.
     */
    public void colocarNumero(Mensaje mensaje){
        
        if (mensaje.getIpOrigen().contentEquals(nodos.get(0))) {
            nodo1 = mensaje.getMensaje().substring(mensaje.getMensaje().indexOf(":")+1);
        } else if (mensaje.getIpOrigen().contentEquals(nodos.get(1))) {
            nodo2 = mensaje.getMensaje().substring(mensaje.getMensaje().indexOf(":")+1);
        } else {
            nodo3 = mensaje.getMensaje().substring(mensaje.getMensaje().indexOf(':')+1);
        }
        
        
        if ( (nodo1.length() > 0) && (nodo2.length() > 0) && (nodo3.length() > 0)){
            if (datosAplicacion.getNumeroNodoAplicacion().contains("1")) {
                vectorProcesos = valorNodo+"-"+nodo1+"-"+nodo2+"-"+nodo3;
            } else if (datosAplicacion.getNumeroNodoAplicacion().contains("2")){
                vectorProcesos = nodo1+"-"+valorNodo+"-"+nodo2+"-"+nodo3;
            } else if (datosAplicacion.getNumeroNodoAplicacion().contains("3")){
                vectorProcesos = nodo1+"-"+nodo2+"-"+valorNodo+"-"+nodo3;
            } else {
                vectorProcesos = nodo1+"-"+nodo2+"-"+nodo3+"-"+valorNodo;
            }
            enviarVector();
        }
    }
    
    /**
     * Método que permite enviar el vector del nodo hacia los demás nodos
     * del sistema distribuido. Si el nodo es corrupo enviará mensajes distintos
     * a su número de proceso.
     */
    public void enviarVector(){
        for (String nodo : nodos) {
            if (corrupto == false) {
                libreriaMensajes.enviarMensaje("vector:"+vectorProcesos,nodo);
            } else{
                String nuevoVector = valorAleatorio()+"-"+valorAleatorio()+"-"+
                        valorAleatorio()+"-"+valorAleatorio();
                libreriaMensajes.enviarMensaje("vector:"+nuevoVector,nodo);
            }
        }
        
    }
    
    
    /**
     * Método que permite agrupar el vector perteneciente a los demás nodos
     * del sistema distribuido.
     * @param mensaje El vector perteneciente a otro nodo.
     */
    public void colocarVector(Mensaje mensaje){
        String vector = mensaje.getMensaje().substring(
                mensaje.getMensaje().indexOf(":") +1);
        if (mensaje.getIpOrigen().contentEquals(nodos.get(0))) {
            vectorDemasProcesos[0] = vector;
        } else if (mensaje.getIpOrigen().contentEquals(nodos.get(1))) {
            vectorDemasProcesos[1] = vector;
          } else {
                vectorDemasProcesos[2] = vector;
            }
        
        if ((vectorDemasProcesos[0].length() > 0) 
                && (vectorDemasProcesos[1].length() > 0 ) 
                && (vectorDemasProcesos[2].length() > 0) ){
             System.out.println("Vector Procesos:"+vectorProcesos);
             libreriaMensajes.enviarMensaje("Vector Procesos:"+vectorProcesos);
             System.out.println("Vector Otros Procesos 1:"
                     +vectorDemasProcesos[0]);
             libreriaMensajes.enviarMensaje("Vector Otros Procesos 1:"
                     +vectorDemasProcesos[0]);
             System.out.println("vector demas procesos:"
                     +vectorDemasProcesos[1]);
             libreriaMensajes.enviarMensaje("Vector Otros Procesos 2:"
                     +vectorDemasProcesos[1]);
             System.out.println("vector demas procesos:"
                     +vectorDemasProcesos[2]);
             libreriaMensajes.enviarMensaje("Vector Otros Procesos 3:"
                     +vectorDemasProcesos[2]);
            calcularVector();
            
        }
    }
    
    
    /**
     * Método que calcula el vector final del nodo.
     */
    public void calcularVector(){
       int posicion = 0;
       String [] casillas = vectorProcesos.split("-");
        for (String string : casillas) {
            compararCasilla(Integer.valueOf(string), posicion);
            posicion++;
        }
        
        imprimirVectorFinal();
        
        
    }
    
    
    /**
     * Método que permite comparar una casilla del vector de procesos del nodo
     * actual.
     * @param valor El valor de la casilla N del vector de procesos.
     * @param posicion La posición N del vector de procesos del nodo actual.
     */
    public void compararCasilla(int valor,int posicion){
        int [] vector =  new int [3];
        int repeticion;
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
        repeticion = contarRepeticion(valor, vector);
        if (repeticion > 2) {
            vectorFinal[posicion] = String.valueOf(valor);
        } else {
             repeticion = contarRepeticion(vector[0],Arrays.copyOfRange(
                     vector,1, vector.length));
             if (repeticion > 1) {
                vectorFinal[posicion] = String.valueOf(vector[0]);
             } else {
                repeticion = contarRepeticion(vector[1], Arrays.copyOfRange(
                        vector,2, vector.length));
                if (repeticion > 1) {
                    vectorFinal[posicion] = String.valueOf(vector[1]);
                } else {
                    vectorFinal[posicion] = "UNKNOWN";
                }
            }
                
        }
        
        
    }
    
    /**
     * Método que permite chequear las repeticiones que aparezcan en la casilla
     * del vector.
     * @param valor El valor a chequear
     * @param vector El vector de recorido.
     * @return La cantidad de repeticiones del valor en el vector.
     */
    public int contarRepeticion (int valor, int[] vector){
         int repeticiones = 1;
         for (int i = 0; i < vector.length; i++) {
            if (valor == vector[i])
                repeticiones++;
            
        }
         return repeticiones;
    }
    
    /**
     * Método que permite imprimir el vector final del nodo.
     */
    public void imprimirVectorFinal(){
        System.out.println("Vector Final: ["+vectorFinal[0]+","+vectorFinal[1]+","
                + ""+vectorFinal[2]+","+vectorFinal[3]+"]");
        libreriaMensajes.enviarMensaje("Vector Final: ["+vectorFinal[0]+","+vectorFinal[1]+","
                + ""+vectorFinal[2]+","+vectorFinal[3]+"]");
    }
    
    /**
     * Método que permite iniciar el comportamiento del nodo lo que permite
     * que pueda ser corrupto o no.
     * @param opcion 1 indica que es el nodo que inicia la transmisión de
     * su número de proceso
     */
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
            Thread.sleep(tiempoHilo);
            if (opcion == 1){
                for (String string : nodos) {
                    libreriaMensajes.enviarMensaje("id:", string);
                }
                libreriaMensajes.enviarMensaje("id:",
                        libreriaMensajes.getIpOrigen());
            }
        } catch (InterruptedException ex) {
            Logger.getLogger(LogicaAplicacion.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
    }
    
    
    /**
     * Método que retona un valor aleatorio entre 5 y 10
     * @return El valor aleatorio.
     */
    public String valorAleatorio(){
        return String.valueOf((int)(5 + Math.random()*10));
        
    }
    
    
    
    
   
    
   

    
    
   
}
