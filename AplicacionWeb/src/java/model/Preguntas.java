/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;

/**
 * Clase que permite guardar la información de una determinada pregunta
 * perteneciente a un tópico.
 * @author Héctor Sam.
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
    
    /**
     * Método que permite imprimir las respuestas asociadas a una pregunta.
     * @return 
     */
    public String imprimirRespuestas(){
        String respuesta = "";
        char[] opciones = new char[4];
        opciones[0] = 'a';
        opciones[1] = 'b';
        opciones[2] = 'c';
        opciones[3] = 'd';
        int i = 0;
        for (String string : respuestas) {
            respuesta = respuesta+opciones[i]+". "+string+" \n";
            i++;
        }
        return respuesta;
    }
    
    
}
