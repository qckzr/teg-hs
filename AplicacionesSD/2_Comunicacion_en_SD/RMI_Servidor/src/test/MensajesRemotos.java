/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import java.rmi.RemoteException;

/**
 *
 * @author sam
 */
public interface MensajesRemotos extends java.rmi.Remote {
    
    String horaActual() throws RemoteException;
    String fechaActual() throws RemoteException;
    String saludos() throws RemoteException;
    
}
