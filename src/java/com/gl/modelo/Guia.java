/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.gl.modelo;

/**
 *
 * @author Josmarl
 */
public class Guia {

 
   private int idGuia;
   private String serie;
   private int nroGuia;
   private String puntoPartida;
   private String idpais;
   private String puntoLlegada;
   private String ciudadA;
   private String idcliente;
   private String fechaTraslado;
   private String rSocialDestinatario;
   private String costoMinimo;
   private double totCantidad;
   private String totBulto;
   private double totPesoTot;
   private String idconductor;
   private String idtracto;
   private String idrampla;
   private String datosTransportista;
   private String estado;
   private String login;

   private Cliente cliente;
   private Pais pais;
   private Conductor conductor;
   private Tracto tracto;
   private Rampla rampla;

   public Guia(){}

    public Guia(int idGuia, String serie, int nroGuia, String puntoPartida, String idpais, String puntoLlegada, String ciudadA, String idcliente, String fechaTraslado, String rSocialDestinatario, String costoMinimo, double totCantidad, String totBulto, double totPesoTot, String idconductor, String idtracto, String idrampla, String datosTransportista, String estado, String login, Cliente cliente, Pais pais, Conductor conductor, Tracto tracto, Rampla rampla) {
        this.idGuia = idGuia;
        this.serie = serie;
        this.nroGuia = nroGuia;
        this.puntoPartida = puntoPartida;
        this.idpais = idpais;
        this.puntoLlegada = puntoLlegada;
        this.ciudadA = ciudadA;
        this.idcliente = idcliente;
        this.fechaTraslado = fechaTraslado;
        this.rSocialDestinatario = rSocialDestinatario;
        this.costoMinimo = costoMinimo;
        this.totCantidad = totCantidad;
        this.totBulto = totBulto;
        this.totPesoTot = totPesoTot;
        this.idconductor = idconductor;
        this.idtracto = idtracto;
        this.idrampla = idrampla;
        this.datosTransportista = datosTransportista;
        this.estado = estado;
        this.login = login;
        this.cliente = cliente;
        this.pais = pais;
        this.conductor = conductor;
        this.tracto = tracto;
        this.rampla = rampla;
    }

    public String getCiudadA() {
        return ciudadA;
    }

    public void setCiudadA(String ciudadA) {
        this.ciudadA = ciudadA;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Conductor getConductor() {
        return conductor;
    }

    public void setConductor(Conductor conductor) {
        this.conductor = conductor;
    }

    public String getCostoMinimo() {
        return costoMinimo;
    }

    public void setCostoMinimo(String costoMinimo) {
        this.costoMinimo = costoMinimo;
    }

    public String getDatosTransportista() {
        return datosTransportista;
    }

    public void setDatosTransportista(String datosTransportista) {
        this.datosTransportista = datosTransportista;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getFechaTraslado() {
        return fechaTraslado;
    }

    public void setFechaTraslado(String fechaTraslado) {
        this.fechaTraslado = fechaTraslado;
    }

    public int getIdGuia() {
        return idGuia;
    }

    public void setIdGuia(int idGuia) {
        this.idGuia = idGuia;
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

    public String getIdpais() {
        return idpais;
    }

    public void setIdpais(String idpais) {
        this.idpais = idpais;
    }

    public String getIdrampla() {
        return idrampla;
    }

    public void setIdrampla(String idrampla) {
        this.idrampla = idrampla;
    }

    public String getIdtracto() {
        return idtracto;
    }

    public void setIdtracto(String idtracto) {
        this.idtracto = idtracto;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public int getNroGuia() {
        return nroGuia;
    }

    public void setNroGuia(int nroGuia) {
        this.nroGuia = nroGuia;
    }

    public Pais getPais() {
        return pais;
    }

    public void setPais(Pais pais) {
        this.pais = pais;
    }

    public String getPuntoLlegada() {
        return puntoLlegada;
    }

    public void setPuntoLlegada(String puntoLlegada) {
        this.puntoLlegada = puntoLlegada;
    }

    public String getPuntoPartida() {
        return puntoPartida;
    }

    public void setPuntoPartida(String puntoPartida) {
        this.puntoPartida = puntoPartida;
    }

    public String getrSocialDestinatario() {
        return rSocialDestinatario;
    }

    public void setrSocialDestinatario(String rSocialDestinatario) {
        this.rSocialDestinatario = rSocialDestinatario;
    }

    public Rampla getRampla() {
        return rampla;
    }

    public void setRampla(Rampla rampla) {
        this.rampla = rampla;
    }

    public String getSerie() {
        return serie;
    }

    public void setSerie(String serie) {
        this.serie = serie;
    }

    public String getTotBulto() {
        return totBulto;
    }

    public void setTotBulto(String totBulto) {
        this.totBulto = totBulto;
    }

    public double getTotCantidad() {
        return totCantidad;
    }

    public void setTotCantidad(double totCantidad) {
        this.totCantidad = totCantidad;
    }

    public double getTotPesoTot() {
        return totPesoTot;
    }

    public void setTotPesoTot(double totPesoTot) {
        this.totPesoTot = totPesoTot;
    }

    public Tracto getTracto() {
        return tracto;
    }

    public void setTracto(Tracto tracto) {
        this.tracto = tracto;
    }

   
}
