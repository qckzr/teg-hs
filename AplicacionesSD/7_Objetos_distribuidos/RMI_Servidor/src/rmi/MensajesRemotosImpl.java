/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package rmi;

import Libreria.*;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.util.ArrayList;

/**
 * Clase que implementa los métodos de la interfaz para poder ser invocados
 * desde otro host.
 * @author Héctor Sam
 */
public class MensajesRemotosImpl extends UnicastRemoteObject implements MensajesRemotos{
        
    public MensajesRemotosImpl() throws RemoteException{

    }

    @Override
    public ArrayList<String> listarMensajes() throws RemoteException {
        return mensajes;
    }

    @Override
    public boolean agregarMensaje(String mensaje) throws RemoteException {
        if (mensajes.add(mensaje)) {
            return  true;
        } else {
          return false;
          
        }
    }

    @Override
    public boolean eliminarMensajes() throws RemoteException {
        mensajes.clear();
        return true;
        
        
    }

    
    
    
    
}
