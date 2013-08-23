/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servidorcentral;

/**
 *
 * @author sam
 */
public class Directorios {
    
    private String directorioEjecutables = "/Users/hectorsam/Desktop/ejecutables";
    private String directorioImagenesEscenarios = "/Users/hectorsam/Desktop/escenarios";
    private String directorioImagenesTopico = "/Users/hectorsam/Desktop/topicos";

    public Directorios() {
    }

    
    
    public String getDirectorioEjecutables() {
        return directorioEjecutables;
    }

    public void setDirectorioEjecutables(String directorioEjecutables) {
        this.directorioEjecutables = directorioEjecutables;
    }

    public String getDirectorioImagenesEscenarios() {
        return directorioImagenesEscenarios;
    }

    public void setDirectorioImagenesEscenarios(String directorioImagenesEscenarios) {
        this.directorioImagenesEscenarios = directorioImagenesEscenarios;
    }

    public String getDirectorioImagenesTopico() {
        return directorioImagenesTopico;
    }

    public void setDirectorioImagenesTopico(String directorioImagenesTopico) {
        this.directorioImagenesTopico = directorioImagenesTopico;
    }
    
    
    
}
