/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

/**
 *
 * @author sam
 */
public class HelloImpl  extends UnicastRemoteObject implements Hello{

    public HelloImpl() throws RemoteException{}
    @Override
    public String sayHello() {
        return "Hello World";
    }
    
}
