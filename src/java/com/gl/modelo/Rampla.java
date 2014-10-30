/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.gl.modelo;

/**
 *
 * @author Josmarl
 */
public class Rampla {

        private String idrampla;
	private String idcliente;
	private String tipo;
	private String ejes;
	private String placa;
	private String nroconstancia;
	private String configuracion;
	private String clase;
	private String descripcion;
	private String estado;

        private Cliente cliente;

        public Rampla(){}

    public Rampla(String idrampla, String idcliente, String tipo, String ejes, String placa, String nroconstancia, String configuracion, String clase, String descripcion, String estado, Cliente cliente) {
        this.idrampla = idrampla;
        this.idcliente = idcliente;
        this.tipo = tipo;
        this.ejes = ejes;
        this.placa = placa;
        this.nroconstancia = nroconstancia;
        this.configuracion = configuracion;
        this.clase = clase;
        this.descripcion = descripcion;
        this.estado = estado;
        this.cliente = cliente;
    }

    public String getClase() {
        return clase;
    }

    public void setClase(String clase) {
        this.clase = clase;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public String getConfiguracion() {
        return configuracion;
    }

    public void setConfiguracion(String configuracion) {
        this.configuracion = configuracion;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getEjes() {
        return ejes;
    }

    public void setEjes(String ejes) {
        this.ejes = ejes;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getIdcliente() {
        return idcliente;
    }

    public void setIdcliente(String idcliente) {
        this.idcliente = idcliente;
    }

    public String getIdrampla() {
        return idrampla;
    }

    public void setIdrampla(String idrampla) {
        this.idrampla = idrampla;
    }

    public String getNroconstancia() {
        return nroconstancia;
    }

    public void setNroconstancia(String nroconstancia) {
        this.nroconstancia = nroconstancia;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

        
}
