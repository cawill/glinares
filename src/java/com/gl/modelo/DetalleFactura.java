/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.gl.modelo;

import java.io.Serializable;


/**
 *
 * @author Josmarl
 */
public class DetalleFactura implements Serializable{

    private int idDetalleFactura;
    private String cantidad;
    private String descripcion;
    private double precioUnit;
    private double importe;
    private int idFactura;
    private Factura factura;

    public DetalleFactura(){}

    public DetalleFactura(String cantidad, String descripcion, double precioUnit, double importe, int idFactura, Factura factura) {
        this.cantidad = cantidad;
        this.descripcion = descripcion;
        this.precioUnit = precioUnit;
        this.importe = importe;
        this.idFactura = idFactura;
        this.factura = factura;
    }

    public int getIdDetalleFactura() {
        return idDetalleFactura;
    }

    public void setIdDetalleFactura(int idDetalleFactura) {
        this.idDetalleFactura = idDetalleFactura;
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

    public Factura getFactura() {
        return factura;
    }

    public void setFactura(Factura factura) {
        this.factura = factura;
    }

    public int getIdFactura() {
        return idFactura;
    }

    public void setIdFactura(int idFactura) {
        this.idFactura = idFactura;
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
