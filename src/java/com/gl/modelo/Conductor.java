/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.gl.modelo;

/**
 *
 * @author Josmarl
 */
public class Conductor {

        private String idconductor;
	private String idcliente;
	private String dniconductor;
	private String licenciaconductor;
	private String apellidopconductor;
	private String apellidomconductor;
	private String nombreconductor;
	private String ciudadconductor;
	private String paisconductor;
	private String estado;

        private Cliente cliente;

        public Conductor(){}

    public Conductor(String idconductor, String idcliente, String dniconductor, String licenciaconductor, String apellidopconductor, String apellidomconductor, String nombreconductor, String ciudadconductor, String paisconductor, String estado, Cliente cliente) {
        this.idconductor = idconductor;
        this.idcliente = idcliente;
        this.dniconductor = dniconductor;
        this.licenciaconductor = licenciaconductor;
        this.apellidopconductor = apellidopconductor;
        this.apellidomconductor = apellidomconductor;
        this.nombreconductor = nombreconductor;
        this.ciudadconductor = ciudadconductor;
        this.paisconductor = paisconductor;
        this.estado = estado;
        this.cliente = cliente;
    }

    public String getApellidomconductor() {
        return apellidomconductor;
    }

    public void setApellidomconductor(String apellidomconductor) {
        this.apellidomconductor = apellidomconductor;
    }

    public String getApellidopconductor() {
        return apellidopconductor;
    }

    public void setApellidopconductor(String apellidopconductor) {
        this.apellidopconductor = apellidopconductor;
    }

    public String getCiudadconductor() {
        return ciudadconductor;
    }

    public void setCiudadconductor(String ciudadconductor) {
        this.ciudadconductor = ciudadconductor;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public String getDniconductor() {
        return dniconductor;
    }

    public void setDniconductor(String dniconductor) {
        this.dniconductor = dniconductor;
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

    public String getIdconductor() {
        return idconductor;
    }

    public void setIdconductor(String idconductor) {
        this.idconductor = idconductor;
    }

    public String getLicenciaconductor() {
        return licenciaconductor;
    }

    public void setLicenciaconductor(String licenciaconductor) {
        this.licenciaconductor = licenciaconductor;
    }

    public String getNombreconductor() {
        return nombreconductor;
    }

    public void setNombreconductor(String nombreconductor) {
        this.nombreconductor = nombreconductor;
    }

    public String getPaisconductor() {
        return paisconductor;
    }

    public void setPaisconductor(String paisconductor) {
        this.paisconductor = paisconductor;
    }

        

}
