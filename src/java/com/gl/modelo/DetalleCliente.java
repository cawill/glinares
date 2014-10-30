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
public class DetalleCliente implements Serializable{

    private int iddetallecliente;
    private String idCliente;
    private String direccion;
    private Cliente cliente;

    public DetalleCliente(){}

    public DetalleCliente(int iddetallecliente, String idCliente, String direccion, Cliente cliente) {
        this.iddetallecliente = iddetallecliente;
        this.idCliente = idCliente;
        this.direccion = direccion;
        this.cliente = cliente;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(String idCliente) {
        this.idCliente = idCliente;
    }

    public int getIddetallecliente() {
        return iddetallecliente;
    }

    public void setIddetallecliente(int iddetallecliente) {
        this.iddetallecliente = iddetallecliente;
    }

   
    

}
