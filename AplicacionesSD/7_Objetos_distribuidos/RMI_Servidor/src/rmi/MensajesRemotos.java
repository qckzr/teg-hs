/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package rmi;

import java.rmi.RemoteException;
import java.util.ArrayList;

/**
 * Interfaz que permite definir los métodos que pueden ser invocados.
 * @author sam
 */
public interface MensajesRemotos extends java.rmi.Remote {
    
    ArrayList<String> mensajes = new ArrayList<>();
    
    ArrayList<String> listarMensajes() throws RemoteException;
    boolean agregarMensaje(String mensaje) throws RemoteException;
    boolean eliminarMensajes() throws RemoteException;
    
}
