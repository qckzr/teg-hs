/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ldap_servidor;

import java.util.ArrayList;

/**
 *
 * @author sam
 */
public class Dominio {
    
    
    private String dc;
    private String dc2;
    private ArrayList<Cliente> clientes;

    public Dominio(String dc, String dc2) {
        this.dc = dc;
        this.dc2 = dc2;
        clientes = new ArrayList<>();
    }

    public String getDc() {
        return dc;
    }

    public void setDc(String dc) {
        this.dc = "dc="+dc;
    }

    public String getDc2() {
        return dc2;
    }

    public void setDc2(String dc2) {
        this.dc2 = "dc="+dc2;
    }

    public ArrayList<Cliente> getClientes() {
        return clientes;
    }

    public void setClientes(ArrayList<Cliente> clientes) {
        this.clientes = clientes;
    }
    
    @Override
    public String toString(){
        return dc+","+dc2;
    }
    
    
    
    
    
}
