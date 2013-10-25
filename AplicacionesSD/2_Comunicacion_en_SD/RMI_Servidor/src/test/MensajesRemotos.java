/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import java.rmi.RemoteException;

/**
 * Interfaz que permite definir los métodos que pueden ser invocados.
 * @author sam
 */
public interface MensajesRemotos extends java.rmi.Remote {
    
    String horaActual() throws RemoteException;
    String fechaActual() throws RemoteException;
    String saludos() throws RemoteException;
    
}
