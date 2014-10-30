/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.gl.modelo;

/**
 *
 * @author Josmarl
 */
public class Boleta {

  private int idboleta;
  private String login;
  private String serieboleta;
  private int numboleta;
  private String fechaelaboleta;
  private String fechacancelacion;
  private double total;
  private String son;
  private String idCliente;
  private String fechaLetras;
  private String estado;
  private String fechaCancelLetras;
  private String descripcionboleta;
  private String descripcionigv;
  private Cliente cliente;
  private Usuario usuario;
  private Boleta boleta;
  private String moneda;
  private String monedaletra;

  public Boleta(){}



    public Boleta getBoleta() {
        return boleta;
    }

    public void setBoleta(Boleta boleta) {
        this.boleta = boleta;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public String getDescripcionboleta() {
        return descripcionboleta;
    }

    public void setDescripcionboleta(String descripcionboleta) {
        this.descripcionboleta = descripcionboleta;
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

    public String getFechaCancelLetras() {
        return fechaCancelLetras;
    }

    public void setFechaCancelLetras(String fechaCancelLetras) {
        this.fechaCancelLetras = fechaCancelLetras;
    }

    public String getFechaLetras() {
        return fechaLetras;
    }

    public void setFechaLetras(String fechaLetras) {
        this.fechaLetras = fechaLetras;
    }

    public String getFechacancelacion() {
        return fechacancelacion;
    }

    public void setFechacancelacion(String fechacancelacion) {
        this.fechacancelacion = fechacancelacion;
    }

    public String getFechaelaboleta() {
        return fechaelaboleta;
    }

    public void setFechaelaboleta(String fechaelaboleta) {
        this.fechaelaboleta = fechaelaboleta;
    }

    public String getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(String idCliente) {
        this.idCliente = idCliente;
    }

    public int getIdboleta() {
        return idboleta;
    }

    public void setIdboleta(int idboleta) {
        this.idboleta = idboleta;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public int getNumboleta() {
        return numboleta;
    }

    public void setNumboleta(int numboleta) {
        this.numboleta = numboleta;
    }

    public String getSerieboleta() {
        return serieboleta;
    }

    public void setSerieboleta(String serieboleta) {
        this.serieboleta = serieboleta;
    }

    public String getSon() {
        return son;
    }

    public void setSon(String son) {
        this.son = son;
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

    
}
