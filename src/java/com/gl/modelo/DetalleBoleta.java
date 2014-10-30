/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.gl.modelo;

/**
 *
 * @author Josmarl
 */
public class DetalleBoleta {

    private String cantidad;
    private String descripcion;
    private double precioUnit;
    private double importe;
    private int idboleta;
    private Boleta boleta;

    public DetalleBoleta(){}

    public DetalleBoleta(String cantidad, String descripcion, double precioUnit, double importe, int idboleta, Boleta boleta) {
        this.cantidad = cantidad;
        this.descripcion = descripcion;
        this.precioUnit = precioUnit;
        this.importe = importe;
        this.idboleta = idboleta;
        this.boleta = boleta;
    }

    public Boleta getBoleta() {
        return boleta;
    }

    public void setBoleta(Boleta boleta) {
        this.boleta = boleta;
    }

    public String getCantidad() {
        return cantidad;
    }

    public void setCantidad(String cantidad) {
        this.cantidad = cantidad;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getIdboleta() {
        return idboleta;
    }

    public void setIdboleta(int idboleta) {
        this.idboleta = idboleta;
    }

    public double getImporte() {
        return importe;
    }

    public void setImporte(double importe) {
        this.importe = importe;
    }

    public double getPrecioUnit() {
        return precioUnit;
    }

    public void setPrecioUnit(double precioUnit) {
        this.precioUnit = precioUnit;
    }

  
   
}
