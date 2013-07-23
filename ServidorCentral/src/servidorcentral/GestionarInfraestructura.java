/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servidorcentral;
import Libreria.LibreriaMensajes;
import Libreria.Mensaje;
import agente.InformacionAgente;
import java.io.IOException;
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
 *
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

    public GestionarInfraestructura(LibreriaMensajes libreria, String usuarioBd, String passwordBd, String puerto, String ipBaseDeDatos) {
        this.libreria = libreria;
        bd = new ConexionBD(usuarioBd,passwordBd,puerto, ipBaseDeDatos);
        this.ipBaseDeDatos = ipBaseDeDatos;
        nodos = new ArrayList<NodoActivo>();
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
    
    
    
    
    
    
    public boolean insertarEnBd(InformacionAgente informacion){
        try {
            String aplicacionActiva = "NULL";
            String estadoAplicacion = "'DESACTIVA'";
            if (informacion.getAplicacionActiva().length()!=0){
                aplicacionActiva = "'"+informacion.getAplicacionActiva()+"'";
                estadoAplicacion = "'ACTIVA'";
            }
            String idNodo = bd.consultarRegistro("Select id from nodos where ip ='"+informacion.getDireccionIp()+"'").getString(1);
            String query = "Insert into MENSAJES_AGENTE (ID,ID_PROCESO,CANTIDAD_PROCESOS,MEMORIA_DISPONIBLE,USO_CPU,PUERTOS_DISPONIBLES,ID_NODO,NOMBRE_APLICACION_ACTUAL,ESTADO_APLICACION) VALUES (S_MENSAJES_AGENTE.NEXTVAL,"+informacion.getIdProceso()+","+informacion.getProcesosActivos()+","+informacion.getMemoriaDisponible()+","+informacion.getUsoCpu()+",'"+informacion.getPuertosDisponibles()+"',"+idNodo+","+aplicacionActiva+","+estadoAplicacion+")";
            if (bd.ejecutarQuery(query)==true)
                return true;
            else return false;
        } catch (SQLException ex) {
            Logger.getLogger(GestionarInfraestructura.class.getName()).log(Level.SEVERE, null, ex);
        }
        return  false;
    }
    
    public boolean insertarEnBd(Mensaje mensaje){
        try {
            NodoActivo nodo = buscarNodo(mensaje.getIpOrigen());
            String idEjecutable = bd.consultarRegistro("SELECT ID FROM EJECUTABLES WHERE NOMBRE ='"+nodo.getNombreEjecutable()+"'").getString(0);
            if (bd.ejecutarQuery("INSERT INTO MENSAJE_ENTRE_NODOS (ID,FECHA,HORA,"
                    + "MENSAJE,IP_DESTINO,ID_NODO,ID_EJECUTABLE,ID_PROCESO) VALUES"
                    + "(S_MENSAJES_ENTRE_NODOS.NEXTVAL,TO_DATE('"+mensaje.getFecha()+"',"
                    + "'dd/mm/yyyy'),TO_DATE('"+mensaje.getHora()+"','hh24:MI:ss')"
                    + ","+nodo.getId()+","+idEjecutable+","+nodo.getIdProceso()+" )"))
                return true;           
        } catch (SQLException ex) {
            Logger.getLogger(GestionarInfraestructura.class.getName()).log(Level.SEVERE, null, ex);
        }
         return false;
    }
    
    public boolean reenviarMensaje(InformacionAgente informacion){
        return true;
    }
    
    public boolean reenviarMensaje (Mensaje mensaje){
        return true;
    }
    
    public boolean ejecutarAplicacion(String nombreEjecutable, String ipNodo){
        String parametros = buscarParametros(nombreEjecutable);
        ResultSet usuarioNodo = bd.consultarRegistro("SELECT NOMBRE_USUARIO FROM NODOS WHERE IP='"+ipNodo+"' ");        
        try {
            Process p = Runtime.getRuntime().exec(pathScripts+"ejecutar.sh "
                    + pathEjecutables+nombreEjecutable+" "+ipNodo+" "
                    + ""+usuarioNodo.getString(1)+" "+parametros+"   ");
            agregarNodoActivo(ipNodo,nombreEjecutable,usuarioNodo.getString(1));
            
            return true;
        } catch (IOException | SQLException ex) {
            Logger.getLogger(GestionarInfraestructura.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public String buscarParametros(String nombreEjecutable){
        ResultSet rs = bd.consultar("SELECT VALOR FROM PARAMETROS WHERE "
                + "ID_EJECUTABLE=(SELECT ID FROM EJECUTABLES WHERE NOMBRE='"+nombreEjecutable+"') ");
        String parametros ="";
        try {
            while (rs.next())
                parametros = parametros+rs.getString(1);
            return parametros;
        } catch (SQLException ex) {
            Logger.getLogger(GestionarInfraestructura.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "";        
    }
    
    public boolean eliminarAplicacion(String ipNodo, String idProceso){
        try {
            Process p = Runtime.getRuntime().exec(pathScripts+"eliminarNodo.sh "+ipNodo+" "+nombreUsuarioNodo(ipNodo)+" "+idProceso+"");
            return true;
        } catch (IOException ex) {
            Logger.getLogger(GestionarInfraestructura.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public boolean eliminarTodasAplicaciones(){
        Iterator iterator = nodos.iterator();
        String parametros = "";
        while (iterator.hasNext()){
            NodoActivo nodo = (NodoActivo) iterator.next();
            parametros = parametros + nodo.getUsuario() + " " + nodo.getIp() + " " + nodo.getIdProceso() + " ";
        }
        try {
            Process p = Runtime.getRuntime().exec(pathScripts+"eliminarTodosNodos.sh "+parametros);
            return true;
        } catch (IOException ex) {
            Logger.getLogger(GestionarInfraestructura.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public boolean enviarMensajeNodo(String mensaje,String ipNodo){
        
        if (libreria.enviarMensaje(mensaje, ipNodo)==true)
            return  true;
        else
            return false;
        
    }
    
    public String nombreUsuarioNodo(String ipNodo){
        try {
            ResultSet nodo = bd.consultarRegistro("SELECT USUARIO FROM NODO WHERE IP='"+ipNodo+"' ");
            return nodo.getString(0);
        } catch (SQLException ex) {
            Logger.getLogger(GestionarInfraestructura.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "";
    }
    
    
    
    @Override
    public void run(){
        
        while (control){
            
            if (libreria.ultimoMensajeAgente()!=null){
                InformacionAgente info = libreria.ultimoMensajeAgente();
                reenviarMensaje(info);
                insertarEnBd(info);
                libreria.eliminarMensaje(info);             
            }
            
            if (libreria.ultimoMensaje()!=null){
                Mensaje mensaje = libreria.ultimoMensaje();
                recibirMensaje(mensaje);
                libreria.eliminarMensaje(mensaje);
            }
                
        }
        
    }
    
    
    public void recibirMensaje(Mensaje mensaje){
        String texto = mensaje.getMensaje();
        if (texto.contains("_")){
            String evento = texto.substring(0,texto.indexOf("_"));
            if (evento.contentEquals("eliminarTodos"))
                eliminarTodasAplicaciones();
            else{
                
                String ejecutable = texto.substring(texto.indexOf("_")+1, texto.indexOf(":"));
                String ipNodo = texto.substring(texto.indexOf(":")+1, texto.length());
                
                switch (evento){
                    case "ejecutar":
                        ejecutarAplicacion(ejecutable, ipNodo);
                        break;
                    case "eliminar":
                        eliminarAplicacion(ipNodo,buscarNodo(ipNodo).getIdProceso());
                        break;
                    case "mensajeNodo":
                        enviarMensajeNodo(ejecutable, ipNodo);
                        break;
                }
            }

        }
        else if (texto.contains("-")){
           agregarIdProceso(mensaje.getIpOrigen(),texto.substring(
                   texto.indexOf("-")+1, texto.length()));
           insertarE_N(texto.substring(texto.indexOf("-")+1, texto.length()));
        }
        
        else{
            reenviarMensaje(mensaje);
            insertarEnBd(mensaje);
        }
    }
    
    
    public void agregarNodoActivo(String ip, String ejecutable,String usuario){
        NodoActivo nodo = new NodoActivo();
        nodo.setIp(ip);
        nodo.setNombreEjecutable(ejecutable);
        try {
            nodo.setId(bd.consultarRegistro("SELECT ID FROM NODOS WHERE IP='"+ip+"'")
                    .getString(1));
        } catch (SQLException ex) {
            Logger.getLogger(GestionarInfraestructura.class.getName()).log(Level.SEVERE, null, ex);
        }
        nodos.add(nodo);
    }
    
    public boolean agregarIdProceso(String ip, String idProceso){
        Iterator iterator = nodos.iterator();
        while (iterator.hasNext()){
            NodoActivo nodo = (NodoActivo) iterator.next();
            if (nodo.getIp().contains(ip)){
                nodo.setIdProceso(idProceso);
                Date d = new Date();
                DateFormat fecha = new SimpleDateFormat("dd/MM/yyyy");
                DateFormat hora = new SimpleDateFormat("HH:mm:ss");
                nodo.setFecha(fecha.format(d).toString());
                nodo.setHora(hora.format(d).toString());
                return true;
            }
        }
        return false;
    }
    
    public boolean insertarE_N(String idProceso){
        Iterator iterator = nodos.iterator();
        while (iterator.hasNext()){
            NodoActivo nodo = (NodoActivo) iterator.next();
            if (nodo.getIdProceso().contentEquals(idProceso)){
                try {
                    String idEjecutable = bd.consultarRegistro(""
                            + "select id from ejecutables where nombre= "
                            + "'"+nodo.getNombreEjecutable()+"'").getString(0);
                    if (bd.ejecutarQuery("INSERT INTO E_N (FECHA_DEPLOY,HORA_DEPLOY,ID_PROCESO,ID_NODO,ID_EJECUTABLE) VALUES"
                            + "(TO_DATE('"+nodo.getFecha()+"','dd/mm/yyyy'),"
                            + "TO_DATE('"+nodo.getHora()+"','HH24:MI:SS'),"+idProceso+","
                            + ""+nodo.getId()+","+idEjecutable+")")==true)
                        return true;
                } catch (SQLException ex) {
                    Logger.getLogger(GestionarInfraestructura.class.getName()).log(Level.SEVERE, null, ex);
                }
            return true;                    
            }
        }
        return false;
    }
    
    
    public NodoActivo buscarNodo(String ipNodo){
        Iterator iterator = nodos.iterator();
        while (iterator.hasNext()){
            NodoActivo nodo = (NodoActivo)iterator.next();
            if (nodo.getIp().contentEquals(ipNodo))
                return nodo;
        }
        return null;
            
        
    }
    
    
    
  
    
}
