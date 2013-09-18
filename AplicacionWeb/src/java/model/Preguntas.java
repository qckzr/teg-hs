/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author sam
 */
public class Preguntas {
    
    private String id;
    private String idTopico;
    private String enunciado;
    private ArrayList<String> respuestas;

    public Preguntas(String id, String enunciado) {
        this.id = id;
        this.enunciado = enunciado;
        respuestas = new ArrayList<>();
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getIdTopico() {
        return idTopico;
    }

    public void setIdTopico(String idTopico) {
        this.idTopico = idTopico;
    }
    
    

    public String getEnunciado() {
        return enunciado;
    }

    public void setEnunciado(String enunciado) {
        this.enunciado = enunciado;
    }

   

    public ArrayList<String> getRespuestas() {
        return respuestas;
    }

    public void setRespuestas(ArrayList<String> respuestas) {
        this.respuestas = respuestas;
    }
    
    public void agregarRespuesta(String opcion){
       
        respuestas.add(opcion);
    }
    
    public String imprimirRespuestas(){
        String respuesta = "";
        for (String string : respuestas) {
            respuesta = respuesta + " "+string;
        }
        return respuesta;
    }
    
    
}