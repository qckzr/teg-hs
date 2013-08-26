/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import Libreria.*;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

/**
 *
 * @author sam
 */
public class MensajesRemotosImpl extends UnicastRemoteObject implements MensajesRemotos{
        
    public MensajesRemotosImpl() throws RemoteException{

    }

    
    
    @Override
    public String horaActual() throws RemoteException {
        Mensaje mensaje = new Mensaje(null, null);
        return "Hora del nodo servidor: "+mensaje.getHora();
    }

    @Override
    public String fechaActual() throws RemoteException {
        Mensaje mensaje = new Mensaje(null, null);
        return "Fecha del nodo servidor: "+mensaje.getFecha();
    }

    @Override
    public String saludos() throws RemoteException {
        return "¡Saludando remotamente!";
    }
    
}
