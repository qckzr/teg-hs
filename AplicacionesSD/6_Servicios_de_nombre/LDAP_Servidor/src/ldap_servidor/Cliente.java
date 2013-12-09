/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ldap_servidor;

/**
 * Clase que permite almacenar los datos de un cliente del servidor de nombres.
 * @author Héctor Sam
 */
public class Cliente {
    
    private String cn;
    private String givenName;
    private String sn;
    private String telephoneNumber;
    private String mail;
    private Cliente manager;
    private Dominio dominio;

    public Cliente(String givenName, String sn, String telephoneNumber,
            String mail, Cliente manager,Dominio dominio) {
        this.cn = givenName+" "+sn;
        this.givenName = givenName;
        this.sn = sn;
        this.telephoneNumber = telephoneNumber;
        this.mail = mail;
        this.manager = manager;
        this.dominio = dominio;
    }

    public Cliente() {
    }

    @Override
    public String toString(){
        return "dn: cn="+cn+","+dominio.toString();
    }

    public String getCn() {
        return cn;
    }

    public void setCn() {
        this.cn = givenName +" "+sn;
    }

    public Dominio getDominio() {
        return dominio;
    }

    public void setDominio(Dominio dominio) {
        this.dominio = dominio;
    }

    public String getGivenName() {
        return givenName;
    }

    public void setGivenName(String givenName) {
        this.givenName = givenName;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getManager() {
        if (manager!=null)
            return manager.getCn()+","+manager.getDominio();
        else
            return "";
    }

    public void setManager(Cliente manager) {
        this.manager = manager;
    }

    public String getSn() {
        return sn;
    }

    public void setSn(String sn) {
        this.sn = sn;
    }

    public String getTelephoneNumber() {
        return telephoneNumber;
    }

    public void setTelephoneNumber(String telephoneNumber) {
        this.telephoneNumber = telephoneNumber;
    }
    
    public String imprimirDatos(){
        return this.toString()+" || Cn: "+cn+" || Given Name: "
                +givenName+" || Sn: "+sn+" || Telephone Number: "+telephoneNumber+" || "
                + "mail: "+mail+" || manager: "+getManager();
    }
    
    
    
    
    
    
    
}
