/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Hector
 */
public class LibreriaRpiHS {

    private final static int PUERTO = 1337;
    private HiloDeEscucha hiloDeEscucha;


    public LibreriaRpiHS() {
        hiloDeEscucha = new HiloDeEscucha(PUERTO);
        hiloDeEscucha.start();
    }

    public void enviarMensaje(){

    }

    public void recibirMensaje(){

    }

}
