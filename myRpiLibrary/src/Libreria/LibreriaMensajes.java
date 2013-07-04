
import java.util.ArrayList;

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
    private ArrayList<String> ipDestino;
    private String ipOrigen;


    public LibreriaRpiHS() {
        hiloDeEscucha = new HiloDeEscucha(PUERTO);
        hiloDeEscucha.start();
    }

    public HiloDeEscucha getHiloDeEscucha() {
        return hiloDeEscucha;
    }

    public void setHiloDeEscucha(HiloDeEscucha hiloDeEscucha) {
        this.hiloDeEscucha = hiloDeEscucha;
    }


    public void enviarMensaje(String mensaje){

            Mensaje m = new Mensaje(ipOrigen,mensaje);


    }

    public Mensaje recibirMensaje(){
        return null;
    }

      public void agregarIpDestino(String ip){
        ipDestino.add(ip);
    }

    public void eliminarIpDestino(String ip){

        if (buscarIp(ip)!=null)
           ipDestino.remove(buscarIp(ip));

    }

    public String buscarIp(String ip){

        while (ipDestino.iterator().hasNext())
            if (ipDestino.iterator().next().contains(ip))
                return ipDestino.iterator().next();
        return null;
    }


}
