/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package desafios;

import java.io.BufferedReader;
import java.io.InputStreamReader;

/**
 * Clase que permite conocer los datos de la aplicación: Nombre, número de nodo
 * y número de proceso.
 * @author Hector Sam
 */
public class DatosAplicacion {
    
    private String nombreAplicacion;
    private String numeroNodoAplicacion;
    private String idProceso;

    public DatosAplicacion(String nombreAplicacion, String numeroNodoAplicacion) {
        this.nombreAplicacion = nombreAplicacion;
        this.numeroNodoAplicacion = numeroNodoAplicacion;
        idProceso = idProceso(nombreAplicacion);
    }

    public String getNombreAplicacion() {
        return nombreAplicacion;
    }

    public void setNombreAplicacion(String nombreAplicacion) {
        this.nombreAplicacion = nombreAplicacion;
    }

    public String getNumeroNodoAplicacion() {
        return numeroNodoAplicacion;
    }

    public void setNumeroNodoAplicacion(String numeroNodoAplicacion) {
        this.numeroNodoAplicacion = numeroNodoAplicacion;
    }

    public String getIdProceso() {
        return idProceso;
    }

    public void setIdProceso(String idProceso) {
        this.idProceso = idProceso;
    }
    
    
    /**
     * Método que retorna el número de proceso de la aplicación.
     * @param nombreAplicacion El nombre de la aplicación.
     * @return El número de proceso.
     */
     public String idProceso(String nombreAplicacion){
        
        String line;
        String id = "";
        try {
           
            Process p = Runtime.getRuntime().exec("ps -ax");
            BufferedReader input = new BufferedReader(new InputStreamReader(p.getInputStream()));
            while ((line = input.readLine()) != null) {
                if (line.contains("java -jar "+nombreAplicacion)){
                  id =line.substring(0,5);
                  for (int i = 0; i < id.length(); i++) {
                    if (id.charAt(i)!=' '){
                        id = id.substring(i,id.length());
                        break;
                    }
                   
                    }
                }
                
            }          
            input.close();
            return id;
             } catch (Exception err) {
            err.printStackTrace();
        }
        return id;
    }
    
    
    
    
}
