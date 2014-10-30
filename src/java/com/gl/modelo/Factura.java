/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gl.modelo;
/**
 *
 * @author Josmarl
 */
public class Factura {
    private int idFactura;
    private String idCliente;
    private String login;
    private String serieFactura;
    private int numFactura;
    private String fechaFactura;
    private String fechaCancel;
    private String fechaLetras;
    private String estado;
    private String fechaCancelLetras;
    private double  subtotal;
    private double igv;
    private double total;
    private String son;
    private String descFactura;
    private String descripcionigv;
    private Cliente cliente;
    private Usuario usuario;
    private Factura factura;
    private String moneda;
    private String monedaletra;
    private String guias;

    public Factura(){}

    public Factura(int idFactura, String idCliente, String login, String serieFactura, int numFactura, String fechaFactura, String fechaCancel, String fechaLetras, String estado, String fechaCancelLetras, double subtotal, double igv, double total, String son, String descFactura, String descripcionigv, Cliente cliente, Usuario usuario, Factura factura, String moneda, String monedaletra, String guias) {
        this.idFactura = idFactura;
        this.idCliente = idCliente;
        this.login = login;
        this.serieFactura = serieFactura;
        this.numFactura = numFactura;
        this.fechaFactura = fechaFactura;
        this.fechaCancel = fechaCancel;
        this.fechaLetras = fechaLetras;
        this.estado = estado;
        this.fechaCancelLetras = fechaCancelLetras;
        this.subtotal = subtotal;
        this.igv = igv;
        this.total = total;
        this.son = son;
        this.descFactura = descFactura;
        this.descripcionigv = descripcionigv;
        this.cliente = cliente;
        this.usuario = usuario;
        this.factura = factura;
        this.moneda = moneda;
        this.monedaletra = monedaletra;
        this.guias = guias;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public String getDescFactura() {
        return descFactura;
    }

    public void setDescFactura(String descFactura) {
        this.descFactura = descFactura;
    }

    public String getDescripcionigv() {
        return descripcionigv;
    }

    public void setDescripcionigv(String descripcionigv) {
        this.descripcionigv = descripcionigv;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Factura getFactura() {
        return factura;
    }

    public void setFactura(Factura factura) {
        this.factura = factura;
    }

    public String getFechaCancel() {
        return fechaCancel;
    }

    public void setFechaCancel(String fechaCancel) {
        this.fechaCancel = fechaCancel;
    }

    public String getFechaCancelLetras() {
        return fechaCancelLetras;
    }

    public void setFechaCancelLetras(String fechaCancelLetras) {
        this.fechaCancelLetras = fechaCancelLetras;
    }

    public String getFechaFactura() {
        return fechaFactura;
    }

    public void setFechaFactura(String fechaFactura) {
        this.fechaFactura = fechaFactura;
    }

    public String getFechaLetras() {
        return fechaLetras;
    }

    public void setFechaLetras(String fechaLetras) {
        this.fechaLetras = fechaLetras;
    }

    public String getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(String idCliente) {
        this.idCliente = idCliente;
    }

    public int getIdFactura() {
        return idFactura;
    }

    public void setIdFactura(int idFactura) {
        this.idFactura = idFactura;
    }

    public double getIgv() {
        return igv;
    }

    public void setIgv(double igv) {
        this.igv = igv;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public int getNumFactura() {
        return numFactura;
    }

    public void setNumFactura(int numFactura) {
        this.numFactura = numFactura;
    }

    public String getSerieFactura() {
        return serieFactura;
    }

    public void setSerieFactura(String serieFactura) {
        this.serieFactura = serieFactura;
    }

    public String getSon() {
        return son;
    }

    public void setSon(String son) {
        this.son = son;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public String getMoneda() {
        return moneda;
    }

    public void setMoneda(String moneda) {
        this.moneda = moneda;
    }

    public String getMonedaletra() {
        return monedaletra;
    }

    public void setMonedaletra(String monedaletra) {
        this.monedaletra = monedaletra;
    }

    public String getGuias() {
        return guias;
    }

    public void setGuias(String guias) {
        this.guias = guias;
    }
    
    

  
}
