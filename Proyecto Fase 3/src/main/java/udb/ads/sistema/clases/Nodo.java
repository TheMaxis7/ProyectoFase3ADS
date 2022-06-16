/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package udb.ads.sistema.clases;
/**
 *
 * @author Kelvin
 */
public class Nodo {
    private String dato;
    private Nodo hijo;
    private Nodo hermano;

    public String getDato() {
        return dato;
    }

    public void setDato(String dato) {
        this.dato = dato;
    }

    public Nodo getHijo() {
        return hijo;
    }

    public void setHijo(Nodo hijo) {
        this.hijo = hijo;
    }

    public Nodo getHermano() {
        return hermano;
    }

    public void setHermano(Nodo hermano) {
        this.hermano = hermano;
    }

    public Nodo(){
        dato = "";
        hijo = null;
        hermano = null;
    }
    
}
