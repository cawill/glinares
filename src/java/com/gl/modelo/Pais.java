/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.gl.modelo;

/**
 *
 * @author Josmarl
 */
public class Pais {

        private String idpais;
	private String pais;
	private String ciudad;
	private String puerto;

        public Pais(){}

    public Pais(String idpais, String pais, String ciudad, String puerto) {
        this.idpais = idpais;
        this.pais = pais;
        this.ciudad = ciudad;
        this.puerto = puerto;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getIdpais() {
        return idpais;
    }

    public void setIdpais(String idpais) {
        this.idpais = idpais;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }

    public String getPuerto() {
        return puerto;
    }

    public void setPuerto(String puerto) {
        this.puerto = puerto;
    }

        
}
