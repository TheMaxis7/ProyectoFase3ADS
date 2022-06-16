/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package udb.ads.sistema.clases;

import javax.swing.JFrame;

/**
 *
 * @author Kelvin
 */
public class ArbolGeneral extends JFrame{
    
    private Nodo raiz;
    private Nodo trabajo;
    public int i = 0;
    
    //Raiz del árbol
    public ArbolGeneral() { 
    this.raiz = new Nodo();
    }
    
    //Generamos el metodo para ingresar nodos
    
    public Nodo insertar(String xDato, Nodo xNodo){
        if(xNodo == null){
            raiz = new Nodo();
            raiz.setDato(xDato);
            raiz.setHijo(null);
            raiz.setHermano(null);
            
            return raiz;
        }
        if(xNodo.getHijo() == null){
            //Creamos un nodo temporal
            Nodo temp = new Nodo();
            temp.setDato(xDato);
            
            xNodo.setHijo(temp);
            
            return temp;
        }else{
            trabajo = xNodo.getHijo();
            
            while(trabajo.getHermano() != null){
                trabajo = trabajo.getHermano();
            }
            
            Nodo temp = new Nodo();
            temp.setDato(xDato);
            
            trabajo.setHermano(temp);
            
            return temp;
        }
    }
    
    public void TransversaPreO(Nodo xNodo){
        if(xNodo == null){
            return;
        }
        
        for(int nodo = 0; nodo < i; nodo++){
            if(xNodo.getHijo() != null){
                i++;
                TransversaPreO(xNodo.getHijo());
                i--;
            }
            if(xNodo.getHermano() != null){
                TransversaPreO(xNodo.getHermano());
            }
        }
    }
    
    public Nodo ingresarPaciente (String nombre, String genero, String tSangre, String tPresion){
        ArbolGeneral arbolPacientes = new ArbolGeneral();             
        
        //Nivel 0 - Raiz
        Nodo xRaiz = arbolPacientes.insertar("Paciente", null);
        //Nivel 1 - Caracteristicas
        Nodo xNodo = arbolPacientes.insertar("Género", xRaiz);
        arbolPacientes.insertar(nombre, xNodo);
        arbolPacientes.insertar(genero, xNodo);
        
        xNodo = arbolPacientes.insertar("Tipo de Sangre", xRaiz);
        arbolPacientes.insertar(tSangre, xNodo);
        arbolPacientes.insertar(nombre, xNodo);
        
        xNodo = arbolPacientes.insertar("Presión", xRaiz);
        arbolPacientes.insertar(tPresion, xNodo);
        arbolPacientes.insertar(nombre, xNodo);
        
        
        
        return xRaiz;
    }
    
    public Nodo BuscarPaciente(String xDato, Nodo xNodo){
        Nodo busqueda = null;
        
        if(xNodo == null){
            return busqueda;
        }
        if(xNodo.getDato().compareTo(xDato) == 0){
            busqueda = raiz;
            return busqueda;
        }
        
        // Revisamos los nodo hijos
        
        if(raiz.getHijo() != null){
            busqueda = BuscarPaciente(xDato, raiz.getHijo());
            
            if(busqueda != null) return busqueda;
        }
        
        // Revisamos los hermanos
        
        if(raiz.getHermano() != null){
            busqueda = BuscarPaciente(xDato, raiz.getHermano());
            
            if(busqueda != null) return busqueda;
        }
            return busqueda;
    }
    
    
}
