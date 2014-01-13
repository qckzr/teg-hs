/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 * Clase que permite obtener los diferentes directorios para almacenar los
 * archivos que subirá el usuario.
 * @author Héctor Sam
 */
public class Directorios {
    
    private String directorioEjecutables = "/Users/hectorsam/teg-hs/"
            + "ServidorCentral/ejecutables/";
    private String directorioImagenesEscenarios = "/Users/hectorsam/teg-hs/"
            + "AplicacionWeb/web/images/escenarios/";
    private String directorioImagenesTopico = "/Users/hectorsam/teg-hs/"
            + "AplicacionWeb/web/images/topicos/";

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
