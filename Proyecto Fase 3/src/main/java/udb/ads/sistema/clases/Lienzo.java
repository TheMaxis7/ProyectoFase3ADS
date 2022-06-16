/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package udb.ads.sistema.clases;


import java.awt.Color;
import java.awt.Graphics;
import java.util.ArrayList;

/**
 *
 * @author Kelvin
 */
public class Lienzo{
    
    private void construirLinea(Graphics g, int x, int y, int x1, int y1){
        g.setColor(Color.BLACK);
        g.drawLine(x, y, x1, y1);
    }
    
    private void construirRectangulo(Graphics g, int x, int y, int x1, int y1){
        g.setColor(Color.BLACK);
        g.drawRect(x, y, x1, y1);
        g.setColor(Color.WHITE);
        g.fillRect(x, y, x1, y1);
    }
    
    private void construirTexto(Graphics g, String texto, int x, int y){
        g.setColor(Color.BLACK);
        g.drawString(texto, x, y);
        
    }
    
    public void Dibujar(Graphics g, ArrayList<Reclamo> datos){
        //Dibujar Raiz
        construirRectangulo(g, 375, 30, 70, 30);
        construirTexto(g, "Usuario", 385, 50);
        
        //Nodo 1
        construirLinea(g, 410, 60, 100, 100);
        construirRectangulo(g, 90, 100, 70, 30);
        construirTexto(g, "Cantidad", 100, 125);
        //Hijo Nodo 1
        construirLinea(g, 115, 135, 25, 155);
        construirRectangulo(g, 10, 155, 65, 30);
        construirTexto(g, "Numero de gestion", 20, 180);
        
        construirLinea(g, 115, 135, 195, 155);
        construirRectangulo(g, 165, 155, 65, 30);
        construirTexto(g, "Mujer", 180, 180);
        
        //Nodo 2
        construirLinea(g, 410, 60, 410, 100);
        construirRectangulo(g, 360, 100, 100, 30);
        construirTexto(g, "Tipo de Sangre", 365, 125);
        
        //Hijos Nodo 2
        construirLinea(g, 410, 135, 300, 155);
        construirRectangulo(g, 290, 155, 65, 30);
        construirTexto(g, "A", 300, 180);
        
        construirLinea(g, 410, 135, 375, 155);
        construirRectangulo(g, 365, 155, 65, 30);
        construirTexto(g, "B", 375, 180);
        
        construirLinea(g, 410, 135, 450, 155);
        construirRectangulo(g, 440, 155, 65, 30);
        construirTexto(g, "AB", 450, 180);
        
        construirLinea(g, 410, 135, 525, 155);
        construirRectangulo(g, 515, 155, 65, 30);
        construirTexto(g, "O", 525, 180);
        
        //Nodo 3
        construirLinea(g, 410, 60, 740, 100);
        construirRectangulo(g, 690, 100, 70, 30);
        construirTexto(g, "Presión", 700, 125);
        //Hijos Nodo 3
        construirLinea(g, 725, 135, 625, 155);
        construirRectangulo(g, 615, 155, 65, 30);
        construirTexto(g, "Alta", 625, 180);
        
        construirLinea(g, 725, 135, 725, 155);
        construirRectangulo(g, 700, 155, 65, 30);
        construirTexto(g, "Media", 710, 180);
        
        construirLinea(g, 725, 135, 825, 155);
        construirRectangulo(g, 800, 155, 65, 30);
        construirTexto(g, "Baja", 810, 180);
        
        //*******************************************************************
        //*******************************************************************
        
        // Arreglo de pacientes ingresados, para generar dinamicamente las 
        //figuras geometricas en el form
        
        //*******************************************************************
        //*******************************************************************
        
        ArrayList<Cliente> listaPacientes = new ArrayList<>();
        int y_rect, y_lin;
        
        int cont_muj = 0, cont_hom = 0;
        int cont_tsA = 0, cont_tsB = 0, cont_tsAB = 0, cont_tsO = 0;
        int cont_pA = 0, cont_pM = 0, cont_pB = 0;
        int valorPredeteminado = 190;
        int pasos = 30;
        listaPacientes = DatosPaciente.xPacientes;
        
        System.out.println(listaPacientes.size());
        for (int i=0; i < listaPacientes.size(); i++){
            String nombre = listaPacientes.get(i).getNombre();
            String genero = listaPacientes.get(i).getGenero();
            String tSanguineo = listaPacientes.get(i).getG_sanguineo();
            String tPresion = listaPacientes.get(i).getT_presion();
            
            if(genero.equals("Mujer")){
                cont_muj = cont_muj + 1;
                y_rect = valorPredeteminado + (cont_muj * pasos);
                //construirRectangulo(g, 115, 340, 70, 25);
                construirTexto(g, nombre, 175, y_rect);
            }else{
                cont_hom = cont_hom + 1;
                y_rect = valorPredeteminado + (cont_hom * pasos);
                //construirRectangulo(g, 115, 340, 70, 25);
                construirTexto(g, nombre, 20, y_rect);
            }
            
            switch (tSanguineo) {
                case "A":
                    cont_tsA = cont_tsA + 1;
                    y_rect = valorPredeteminado + (cont_tsA * pasos);
                    //construirRectangulo(g, 375, 30, 70, 25);
                    construirTexto(g, nombre, 300, y_rect);
                    break;
                case "B":
                    cont_tsB = cont_tsB + 1;
                    y_rect = valorPredeteminado + (cont_tsB * pasos);
                    //construirRectangulo(g, 375, 30, 70, 25);
                    construirTexto(g, nombre, 375, y_rect);
                    break;
                case "AB":
                    cont_tsAB = cont_tsAB + 1;
                    y_rect = valorPredeteminado + (cont_tsAB * pasos);
                    //construirRectangulo(g, 375, 30, 70, 25);
                    construirTexto(g, nombre, 450, y_rect);
                    break;
                case "O":
                    cont_tsO = cont_tsO + 1;
                    y_rect = valorPredeteminado + (cont_tsO * pasos);
                    //construirRectangulo(g, 375, 30, 70, 25);
                    construirTexto(g, nombre, 525, y_rect);
                    break;
                default:
                    break;
            }
            
            
            switch (tPresion) {
                case "Alta":
                    cont_pA = cont_pA + 1;
                    y_rect = valorPredeteminado + (cont_pA * pasos);
                    //construirRectangulo(g, 375, 30, 70, 25);
                    construirTexto(g, nombre, 625, y_rect);
                    break;
                case "Media":
                    cont_pM = cont_pM + 1;
                    y_rect = valorPredeteminado + (cont_pM * pasos);
                    //construirRectangulo(g, 375, 30, 70, 25);
                    construirTexto(g, nombre, 710, y_rect);
                    break;
                case "Baja":
                    cont_pB = cont_pB + 1;
                    y_rect = valorPredeteminado + (cont_pB * pasos);
                    //construirRectangulo(g, 375, 30, 70, 25);
                    construirTexto(g, nombre, 810, y_rect);
                    break;
                default:
                    break;
            }
           
            //System.out.println(listaPacientes.get(i).getNombre());
            //System.out.println(listaPacientes.get(i).getGenero());
            //System.out.println(listaPacientes.get(i).getG_sanguineo());
            //System.out.println(listaPacientes.get(i).getT_presion());
        }

        
    }
    
    public String estadistica(){
        
        float cont_muj = 0, cont_hom = 0;
        float cont_tsA = 0, cont_tsB = 0, cont_tsAB = 0, cont_tsO = 0;
        float cont_pA = 0, cont_pM = 0, cont_pB = 0;
        
        ArrayList<Cliente> listaReclamos = new ArrayList<>();
        listaReclamos = DatosReclamos.xPacientes;
        
        for (int i=0; i < listaReclamos.size(); i++){
            String genero = listaReclamos.get(i).get.nombre();
            String tSanguineo = listaReclamos.get(i).getG_id_usuario();
            String tPresion = listaReclamos.get(i).getT_numero_cuenta();
            
            if(genero.equals("Mujer")){
                cont_muj = cont_muj + 1;
            }else{
                cont_hom = cont_hom + 1;
            }
            
            switch (tSanguineo) {
                case "A":
                    cont_tsA = cont_tsA + 1;
                    break;
                case "B":
                    cont_tsB = cont_tsB + 1;
                    break;
                case "AB":
                    cont_tsAB = cont_tsAB + 1;
                    break;
                case "O":
                    cont_tsO = cont_tsO + 1;
                    break;
                default:
                    break;
            }
            
            
            switch (tPresion) {
                case "Alta":
                    cont_pA = cont_pA + 1;
                    break;
                case "Media":
                    cont_pM = cont_pM + 1;
                    break;
                case "Baja":
                    cont_pB = cont_pB + 1;
                    break;
                default:
                    break;
            }
            
                        
        }
        String resultado;
            
        resultado = "Total de dato procesados " + listaPacientes.size();
        resultado = resultado + "\nNúmero de hombres: " + cont_hom;
        resultado = resultado + "\nNúmero de mujeres: " + cont_muj;
        
        resultado = resultado + "\n\nCantidad de personas con sangre tipo A: " + cont_tsA;
        resultado = resultado + "\nCantidad de personas con sangre tipo B: " + cont_tsB;
        resultado = resultado + "\nCantidad de personas con sangre tipo AB: " + cont_tsAB;
        resultado = resultado + "\nCantidad de personas con sangre tipo O: " + cont_tsO;
        resultado = resultado + "\nCantidad de personas con presion Alta: " + cont_pA;
        resultado = resultado + "\nCantidad de personas con presion Media: " + cont_pM;
        resultado = resultado + "\nCantidad de personas con presion Baja: " + cont_pB;
        
        return resultado;
    }
    
}
