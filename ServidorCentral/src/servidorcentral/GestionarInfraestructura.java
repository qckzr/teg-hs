/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servidorcentral;
import Libreria.LibreriaMensajes;
import Libreria.Mensaje;
import agente.InformacionAgente;
import java.io.IOException;
import java.net.Socket;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Clase que permite controlar los mensajes enviados en la infraestructura, ya 
 * sea de tipo agente o generales así como la ejecución y detención de los nodos
 * del sistema distribuido actual.
 * @author hector
 */
public class GestionarInfraestructura extends Thread{
    
    private ConexionBD bd;
    private LibreriaMensajes libreria;
    private String ipModuloMonitoreo;
    private String pathScripts = "scripts/";
    private String pathEjecutables = "ejecutables/";
    private String ipBaseDeDatos;
    private boolean control = true;
    private ArrayList<NodoActivo> nodos;
    private final int PUERTO_APP_WEB = 5000;

    public GestionarInfraestructura(LibreriaMensajes libreria, String usuarioBd,
            String passwordBd, String puerto, String ipBaseDeDatos) {
        this.libreria = libreria;
        bd = new ConexionBD(usuarioBd,passwordBd,puerto, ipBaseDeDatos);
        this.ipBaseDeDatos = ipBaseDeDatos;
        nodos = new ArrayList<>();
    }

    public ConexionBD getBd() {
        return bd;
    }

    public void setBd(ConexionBD bd) {
        this.bd = bd;
    }

    public String getIpModuloMonitoreo() {
        return ipModuloMonitoreo;
    }

    public void setIpModuloMonitoreo(String ipModuloMonitoreo) {
        this.ipModuloMonitoreo = ipModuloMonitoreo;
    }

    public LibreriaMensajes getLibreria() {
        return libreria;
    }

    public void setLibreria(LibreriaMensajes libreria) {
        this.libreria = libreria;
    }

    public String getPathEjecutables() {
        return pathEjecutables;
    }

    public void setPathEjecutables(String pathEjecutables) {
        this.pathEjecutables = pathEjecutables;
    }

    public String getPathScripts() {
        return pathScripts;
    }

    public void setPathScripts(String pathScripts) {
        this.pathScripts = pathScripts;
    }

    public String getIpBaseDeDatos() {
        return ipBaseDeDatos;
    }

    public void setIpBaseDeDatos(String ipBaseDeDatos) {
        this.ipBaseDeDatos = ipBaseDeDatos;
    }
    
    
    
    
    
    /**
     * Método que permite guardar un mensaje de agente en la base de datos.
     * @param informacion Mensaje del agente a guardar en base de datos.
     * @return True si el mensaje pudo ser guardado. False en caso contrario.
     */
    public boolean insertarEnBd(InformacionAgente informacion){
        boolean retorno = false;
        try {
            String aplicacionActiva = "NULL";
            String estadoAplicacion = "'DESACTIVA'";
            if (informacion.getAplicacionActiva().length()!=0){
                aplicacionActiva = "'"+informacion.getAplicacionActiva()+"'";
                estadoAplicacion = "'ACTIVA'";
            }
            String idNodo = bd.consultarRegistro(
                    "Select id from nodos where ip ='"+informacion.getDireccionIp()
                            +"'").getString(1);
            String query = "Insert into MENSAJES_AGENTE (ID,ID_PROCESO,CANTIDAD_PROCESOS,"
                    + "MEMORIA_DISPONIBLE,USO_CPU,PUERTOS_DISPONIBLES,ID_NODO,"
                    + "NOMBRE_APLICACION_ACTUAL,ESTADO_APLICACION)"
                    + " VALUES (S_MENSAJES_AGENTE.NEXTVAL,"+informacion.getIdProceso()+","
                    + ""+informacion.getProcesosActivos()+","+informacion.getMemoriaDisponible()+","
                    +informacion.getUsoCpu()+","
                    + "'"+informacion.getPuertosDisponibles()+"',"+idNodo+","+
                    aplicacionActiva+","+estadoAplicacion+")";
            if (bd.ejecutarQuery(query)==true){
                retorno = true;
            }

            
        } catch (SQLException ex) {
            Logger.getLogger(GestionarInfraestructura.class.getName()).log(Level.SEVERE, null, ex); 
            retorno =  false;
        }
        return retorno;
            
    }
    
    /**
     * Método que permite guardar la información de un mensaje  en la base de datos.
     * @param mensaje El mensaje a guardar en base de datos.
     * @return True si el mensaje pudo ser guardado en base de datos. False
     * en caso contrario.
     */
    public boolean insertarEnBd(Mensaje mensaje){
        boolean retorno = false;
        String idEjecutable = "";
        NodoActivo nodo;
        ResultSet rs;
        try {
             nodo = buscarNodo(mensaje.getIpOrigen());
             rs = bd.consultarRegistro("SELECT ID FROM EJECUTABLES WHERE"
                    + " NOMBRE ='"+nodo.getNombreEjecutable()+"'");
            idEjecutable = rs.getString(1);
            if (bd.ejecutarQuery("INSERT INTO MENSAJE_ENTRE_NODOS (ID,FECHA,HORA,"
                    + "MENSAJE,ID_EJECUTABLE,ID_PROCESO) VALUES"
                    + "(S_MENSAJE_ENTRE_NODOS.NEXTVAL,TO_DATE('"+mensaje.getFecha()+"',"
                    + "'dd/mm/yyyy'),TO_DATE('"+mensaje.getHora()+"','hh24:MI:ss'),'"
                    +mensaje.getMensaje()+"'"
                    + ","+idEjecutable+","+nodo.getIdProceso()+" )") == true)
                retorno = true;           
        } catch (SQLException ex) {
            Logger.getLogger(GestionarInfraestructura.class.getName()).
                    log(Level.SEVERE, null, ex);
        } catch (NullPointerException exception){
            Logger.getLogger(GestionarInfraestructura.class.getName()).
                    log(Level.SEVERE, null, exception);
        }
        return retorno;
         
    }
    
    /**
     * Método que permite reenviar un mensaje de tipo Agente hacia el módulo
     * de monitoreo
     * @param informacion El mensaje del agente.
     * @return True si el mensaje pudo ser reenviado. False en caso contrario.
     */
    public boolean reenviarMensaje(InformacionAgente informacion){
        boolean retorno = false;
        if (comprobarConexion()){
            if (libreria.enviarMensaje(informacion,"localhost",PUERTO_APP_WEB) == true){
            retorno = true;
            }
        }
        
        return retorno;
        
    }
    
    
    /**
     * Método que permite reenviar un mensaje recibido hacia el módulo de 
     * monitoreo.
     * @param mensaje El Mensaje a reenviar
     * @return  True si el mensaje pudo ser reenviado. False en caso contrario.
     */
    public boolean reenviarMensaje (Mensaje mensaje){
        boolean retorno = false;
        
        if (libreria.enviarMensaje(mensaje, "localhost",PUERTO_APP_WEB) == true){
            retorno = true;
        }
        return retorno;
    }
    
    
    /**
     * Método que permite correr un ejecutable en un nodo particular.
     * @param nombreEjecutable El Nombre del ejecutable a ejecutar.
     * @param ipNodo Dirección Ip del nodo donde se ejecutará la aplicación.
     * @return True si se realizó la ejecución. False en caso contrario.
     */
    public boolean ejecutarAplicacion(String nombreEjecutable, String ipNodo){
        boolean retorno  = false;
        String parametros = buscarParametros(nombreEjecutable);
        
        ResultSet rutaEjecutable = bd.consultarRegistro("SELECT RUTA_EJECUTABLE"
                + " FROM EJECUTABLES WHERE NOMBRE='"+nombreEjecutable+"' ");        
        ResultSet usuarioNodo = bd.consultarRegistro("SELECT NOMBRE_USUARIO FROM"
                + " NODOS WHERE IP='"+ipNodo+"' ");        
        try {
            Process p = Runtime.getRuntime().exec(pathScripts+"ejecutar.sh "
                    +nombreEjecutable+" "+rutaEjecutable.getString(1)+" "+ipNodo+" "
                    + ""+usuarioNodo.getString(1)+" "+parametros+"   ");
            agregarNodoActivo(ipNodo,nombreEjecutable,usuarioNodo.getString(1));
            
            retorno = true;
        } catch (IOException | SQLException ex) {
            Logger.getLogger(GestionarInfraestructura.class.getName()).
                    log(Level.SEVERE, null, ex);
        } catch (NullPointerException exception){
            Logger.getLogger(GestionarInfraestructura.class.getName()).
                    log(Level.SEVERE, null, exception);
        }
        
        return retorno;
    }
    
    
    /**
     * Método que permite buscar parámetros dado un ejecutable particular.
     * @param nombreEjecutable El nombre del ejecutable a buscar sus parámetros.
     * @return Los parámetros del ejecutable.
     */
    public String buscarParametros(String nombreEjecutable){
        String parametros = "";

        try {
            ResultSet rs = bd.consultar("SELECT VALOR FROM PARAMETROS WHERE "
                + "ID_EJECUTABLE=(SELECT ID FROM EJECUTABLES WHERE NOMBRE='"
                +nombreEjecutable+"') ORDER BY ID ");
            while (rs.next()){
                parametros = parametros+" "+rs.getString(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(GestionarInfraestructura.class.getName()).
                    log(Level.SEVERE, null, ex);
        }catch (NullPointerException ex){
            Logger.getLogger(GestionarInfraestructura.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return parametros;        
    }
    
    
    /**
     * Método que permite eliminar una aplicación específica.
     * @param ipNodo Dirección ip del nodo a eliminar.
     * @param idProceso Número de proceso a eliminar.
     * @return True si se realizó la eliminación. False en caso contrario.
     */
    public boolean eliminarAplicacion(String ipNodo, String idProceso){
        boolean retorno = false;
        try {
            Process p = Runtime.getRuntime().exec(pathScripts+"eliminarNodo.sh "
                    +ipNodo+" "+nombreUsuarioNodo(ipNodo)+" "+idProceso+"");
            nodos.remove(buscarNodo(ipNodo));
            retorno = true;
        } catch (IOException ex) {
            Logger.getLogger(GestionarInfraestructura.class.getName()).
                    log(Level.SEVERE, null, ex);
        } catch (NullPointerException ex){
            Logger.getLogger(GestionarInfraestructura.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        
        return retorno;
    }
    
    
    /**
     * Método que permite eliminar todas las aplicaciones de los nodos raspberry
     * pi
     * @return True si se logró eliminar todas las aplicaciones. False en caso
     * contrario.
     */
    public boolean eliminarTodasAplicaciones(){
        Iterator iterator = nodos.iterator();
        String parametros = "";
        boolean retorno = true;
        
        while (iterator.hasNext()){
          NodoActivo   nodo = (NodoActivo) iterator.next();
          parametros = parametros + nodo.getUsuario() + " " + nodo.getIp() +
                  " " + nodo.getIdProceso() + " ";
        
        try {
            Process p = Runtime.getRuntime().exec(pathScripts+
                    "eliminarTodosNodos.sh "+parametros);
                
        } catch (IOException ex) {
            Logger.getLogger(GestionarInfraestructura.class.getName()).
                    log(Level.SEVERE, null, ex);
            retorno = false;
        }catch (NullPointerException ex){
            Logger.getLogger(GestionarInfraestructura.class.getName()).
                    log(Level.SEVERE, null, ex);
        } 
        }
        nodos = new ArrayList<>();
        return retorno;
    }
    
    
    
    /**
     * Método que permite enviar un mensaje a un nodo particular.
     * @param mensaje El mensaje a enviar.
     * @param ipNodo La dirección ip del nodo.
     * @return True si se pudo enviar el mensaje. False en caso contrario.
     */
    public boolean enviarMensajeNodo(String mensaje,String ipNodo){
        boolean retorno = false;
        
        if (libreria.enviarMensaje(mensaje, ipNodo) == true){
            retorno = true;
        }
        
        return  retorno;
        
    }
    
    /**
     * Método que devuelve el nombre del usuario de sesión en el nodo dado una 
     * dirección ip particular.
     * @param ipNodo La dirección ip del nodo a buscar.
     * @return El nombre de usuario del nodo.
     */
    public String nombreUsuarioNodo(String ipNodo){
        String retorno = "";
        try {
            ResultSet nodo = bd.consultarRegistro("SELECT NOMBRE_USUARIO FROM "
                    + "NODOS WHERE IP='"+ipNodo+"' ");
            retorno = nodo.getString(1);
        } catch (SQLException ex) {
            Logger.getLogger(GestionarInfraestructura.class.getName()).
                    log(Level.SEVERE, null, ex);
        } catch (NullPointerException ex){
            Logger.getLogger(GestionarInfraestructura.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return retorno;
    }
    
    
    
    /**
     * Método que verifica constantemente si se ha recibido un mensaje de agente
     * o un mensaje general.
     */
    @Override
    public void run(){
        
        while (control){
            
            if (libreria.ultimoMensajeAgente() != null){
                InformacionAgente info = libreria.ultimoMensajeAgente();
                reenviarMensaje(info);
            //    insertarEnBd(info);
                libreria.eliminarMensaje(info);             
            }
            
            if (libreria.ultimoMensaje() != null){
                Mensaje mensaje = libreria.ultimoMensaje();
                System.out.println("mensaje: "+mensaje.getMensaje());
                recibirMensaje(mensaje);
                libreria.eliminarMensaje(mensaje);
            }
                
        }
        
    }
    
    /**
     * Método que permite recibir un mensaje envíado por el módulo de ciclo de
     * vida o un nodo.
     * @param mensaje El mensaje recibido.
     */
    public void recibirMensaje(Mensaje mensaje){
        String texto = mensaje.getMensaje();
        String evento = "";
        String argumento = "";
        String ipNodo = "";
        
        if (texto.contains(">")){
            evento = texto.substring(0,texto.indexOf(">"));
            
            if (evento.contentEquals("eliminarTodos")){
                eliminarTodasAplicaciones();
            }
            
            else{
                
                argumento = texto.substring(texto.indexOf(">")+1,
                        texto.indexOf("192.")-1);
                ipNodo = texto.substring(texto.indexOf("192"), texto.length());
                
                switch (evento){
                    case "ejecutar":
                        ejecutarAplicacion(argumento, ipNodo);
                        break;
                    case "eliminar":
                        eliminarAplicacion(ipNodo,buscarNodo(ipNodo).
                                getIdProceso());
                        break;
                    case "mensajeNodo":
                        enviarMensajeNodo(argumento, ipNodo);
                        break;
                }
            }

        }
        else if (texto.contains("<")){
            
            asociarIdProceso(texto,mensaje);
        }
        
        else{
            reenviarMensaje(mensaje);
          //  insertarEnBd(mensaje);
        }
    }
    
    /**
     * Método que permite asociar el número de proceso de un ejecutable con un 
     * nodo particular.
     * @param texto Argumento del mensaje recibido.
     * @param mensaje Mensaje donde se envió el número de proceso.
     * @return  True si se logró  asociar el número con el nodo. False en caso
     * contrario.
     */
    public boolean asociarIdProceso(String texto, Mensaje mensaje){
        
        String idProceso = "";
        boolean retorno = true; 
        
        idProceso = texto.substring(texto.indexOf("<")+1, texto.length());
        if (agregarIdProceso(mensaje.getIpOrigen(),idProceso) == false){
            retorno = false;
        }
        idProceso  = texto.substring(texto.indexOf("<")+1, texto.length());
        if (insertarInformacionEjecutable(idProceso) == false){
            retorno = false;
        }
        
        return retorno;
           
    }
    
    
    /**
     * Método que permite agregar un nodo a la lista de nodos activos.
     * @param ip Dirección ip del nodo.
     * @param ejecutable Ejecutable actual en el nodo.
     * @param usuario Nombre del usuario de sesión del nodo.
     */
    public void agregarNodoActivo(String ip, String ejecutable,String usuario){
        
        NodoActivo nodo = new NodoActivo();
        nodo.setIp(ip);
        nodo.setNombreEjecutable(ejecutable);
        nodo.setUsuario(usuario);
        try {
            nodo.setId(bd.consultarRegistro("SELECT ID FROM NODOS WHERE IP='"+
                    ip+"'").getString(1));
        } catch (SQLException ex) {
            Logger.getLogger(GestionarInfraestructura.class.getName()).
                    log(Level.SEVERE, null, ex);
        } catch (NullPointerException ex ){
            Logger.getLogger(GestionarInfraestructura.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        nodos.add(nodo);
    }
    
    /**
     * Método que permite agregar el número de proceso a un nodo particular 
     * de la lista de nodos activos.
     * @param ip Dirección IP del nodo.
     * @param idProceso Número de proceso del ejecutable en el nodo.
     * @return True si se realizó la agregación. False en caso contrario.
     */
    public boolean agregarIdProceso(String ip, String idProceso){
        Iterator iterator = nodos.iterator();
        boolean retorno = false;
        while (iterator.hasNext()){
            NodoActivo nodo = (NodoActivo) iterator.next();
            
            if (nodo.getIp().contains(ip)){
                
                nodo.setIdProceso(idProceso);
                Date d = new Date();
                DateFormat fecha = new SimpleDateFormat("dd/MM/yyyy");
                DateFormat hora = new SimpleDateFormat("HH:mm:ss");
                nodo.setFecha(fecha.format(d).toString());
                nodo.setHora(hora.format(d).toString());
                
                retorno = true;
            }
        }
        return retorno;
    }
    
    /**
     * Método que permite insertar en la tabla informacion_ejecutable.
     * @param idProceso El número de proceso del ejecutable actual.
     * @return True si se realizó la inserción. False en caso contrario.
     */
    public boolean insertarInformacionEjecutable(String idProceso){
        Iterator iterator = nodos.iterator();
        boolean retorno = false;
        
        while (iterator.hasNext()){
            NodoActivo nodo = (NodoActivo) iterator.next();
            if (nodo.getIdProceso().contentEquals(idProceso)){
                try {
                    
                    String idEjecutable = bd.consultarRegistro(""
                            + "select id from ejecutables where nombre= "
                            + "'"+nodo.getNombreEjecutable()+"'").getString(1);
                    
                    if (bd.ejecutarQuery("INSERT INTO INFORMACION_EJECUTABLE (FECHA_DEPLOY,"
                            + "HORA_DEPLOY,ID_PROCESO,ID_EJECUTABLE) VALUES"
                            + "(TO_DATE('"+nodo.getFecha()+"','dd/mm/yyyy'),"
                            + "TO_DATE('"+nodo.getHora()+"','HH24:MI:SS'),"
                            +idProceso+","+ ""+idEjecutable+")") == true)
                        retorno = true;
                } catch (SQLException ex) {
                    Logger.getLogger(GestionarInfraestructura.class.getName()).
                            log(Level.SEVERE, null, ex);
                } catch (NullPointerException ex){
                    Logger.getLogger(GestionarInfraestructura.class.getName()).
                    log(Level.SEVERE, null, ex);
                }
                       
            }
        }
        return retorno;
    }
    
    
    /**
     * Método que permite buscar un nodo en la lista de nodos activos dado
     * su dirección ip
     * @param ipNodo Dirección Ip del nodo a buscar
     * @return Nodo a buscar.
     */
    public NodoActivo buscarNodo(String ipNodo){
        Iterator iterator = nodos.iterator();
        NodoActivo nodoActivo = null;
        
        while (iterator.hasNext()){
            
            NodoActivo nodo = (NodoActivo)iterator.next();
            
            if (nodo.getIp().contentEquals(ipNodo)){
                nodoActivo = nodo;
            }
        }
        return nodoActivo;
            
        
    }
    
    /**
     * Método que mata el hilo.
     */
    public void kill(){
        control = false;
    }
    
    /**
     * Método que permite comprobar la conexion del servidor central para enviar
     * la informacion.
     * @return True si la conexion fue exitosa. False en caso contrario.
     */
    public boolean comprobarConexion(){
        try {
            Socket socket = new Socket(ipModuloMonitoreo,
                    PUERTO_APP_WEB);
            socket.close();
            return true;
        } catch (IOException ex) {
           // Logger.getLogger(Monitoreo.class.getName()).
           //         log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    
    
  
    
}
