/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.gl.modelo;

/**
 *
 * @author Josmarl
 */
public class Tracto {

        private String idtracto;
	private String idcliente;
	private String placa;
	private String marca;
	private String ejes;
	private String modelo;
	private String capacidad;
	private String anio;
	private String nroconstancia;
	private String configuracion;
	private String color;
	private String chasis;
	private String estado;

        private Cliente cliente;

        public Tracto(){}

    public Tracto(String idtracto, String idcliente, String placa, String marca, String ejes, String modelo, String capacidad, String anio, String nroconstancia, String configuracion, String color, String chasis, String estado, Cliente cliente) {
        this.idtracto = idtracto;
        this.idcliente = idcliente;
        this.placa = placa;
        this.marca = marca;
        this.ejes = ejes;
        this.modelo = modelo;
        this.capacidad = capacidad;
        this.anio = anio;
        this.nroconstancia = nroconstancia;
        this.configuracion = configuracion;
        this.color = color;
        this.chasis = chasis;
        this.estado = estado;
        this.cliente = cliente;
    }

    public String getAnio() {
        return anio;
    }

    public void setAnio(String anio) {
        this.anio = anio;
    }

    public String getCapacidad() {
        return capacidad;
    }

    public void setCapacidad(String capacidad) {
        this.capacidad = capacidad;
    }

    public String getChasis() {
        return chasis;
    }

    public void setChasis(String chasis) {
        this.chasis = chasis;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getConfiguracion() {
        return configuracion;
    }

    public void setConfiguracion(String configuracion) {
        this.configuracion = configuracion;
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

    public String getIdtracto() {
        return idtracto;
    }

    public void setIdtracto(String idtracto) {
        this.idtracto = idtracto;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
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

        
}
