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
public interface Hello extends java.rmi.Remote{
    
    String sayHello() throws RemoteException;
    
}
