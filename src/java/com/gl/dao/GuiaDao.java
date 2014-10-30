/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gl.dao;

import com.gl.modelo.Conexion;
import com.gl.modelo.DetalleGuia;
import com.gl.modelo.Guia;
import java.sql.CallableStatement;
import java.sql.Connection;

import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;



/**
 *
 * @author Josmarl
 */
public class GuiaDao {

        public static synchronized boolean insertarGuia(Guia varventa, ArrayList<DetalleGuia> detalle) {

        Connection cn = null;
        CallableStatement cl = null;
        boolean rpta = false;
        try {
            //Nombre del procedimiento almacenado y como espera tres parametros
            //le ponemos 3 interrogantes
            String call = "{CALL spI_guia(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
            //Obtenemos la conexion
            cn = Conexion.getConexion();
            //Decimos que vamos a crear una transaccion
            cn.setAutoCommit(false);
            //Preparamos la sentecia
            cl = cn.prepareCall(call);
            //Como el codigo se autogenera y es del tipo OUT en el procedimiento
            //almacenado le decimos que es OUT y el del tipo Integer en Java
            cl.registerOutParameter(1, Types.INTEGER);
            //El siguiente parametro del procedimiento almacenado es el cliente
            cl.setString(2, varventa.getSerie());
            cl.setInt(3, varventa.getNroGuia());
            cl.setString(4, varventa.getPuntoPartida());
            cl.setString(5, varventa.getIdpais());
            cl.setString(6, varventa.getPuntoLlegada());
            cl.setString(7, varventa.getCiudadA());
            cl.setString(8, varventa.getIdcliente());
            cl.setString(9, varventa.getFechaTraslado());
            cl.setString(10, varventa.getrSocialDestinatario());
            cl.setString(11, varventa.getCostoMinimo());
            cl.setDouble(12, varventa.getTotCantidad());
            cl.setString(13, varventa.getTotBulto());
            cl.setDouble(14, varventa.getTotPesoTot());
            cl.setString(15, varventa.getIdconductor());
            cl.setString(16, varventa.getIdtracto());
            cl.setString(17, varventa.getIdrampla());
            cl.setString(18, varventa.getDatosTransportista());
            cl.setString(19, varventa.getEstado());
            cl.setString(20, varventa.getLogin());
            //Ejecutamos la sentencia y si nos devuelve el valor de 1 es porque
            //registro de forma correcta los datos
            rpta = cl.executeUpdate() == 1 ? true : false;
            //Codigo que se genero producto de la insercion ---> codigoVenta
            varventa.setIdGuia(cl.getInt(1));


            if (rpta) {
                for (DetalleGuia det : detalle) {
                    //Establecemos al detalle el codigo genero producto de la venta
                    det.setIdGuia(varventa.getIdGuia());
                    //Insertamos el detalle y le pasamos la conexion
                    rpta = DetalleGuiaDao.insertarDetalleGuia(det, cn);
                    //Si nos devuelve false salimos del for
                    if (!rpta) {
                        break;
                    }
                }
                if (rpta) {
                    //Confirmamos la transaccion
                    cn.commit();
                } else {
                    //Negamos la transaccion
                    Conexion.deshacerCambios(cn);
                }
            } else {
                //Negamos la transaccion
                Conexion.deshacerCambios(cn);
            }
            Conexion.cerrarCall(cl);
            Conexion.cerrarConexion(cn);
        } catch (SQLException e) {
            e.printStackTrace();
            Conexion.deshacerCambios(cn);
            Conexion.cerrarCall(cl);
            Conexion.cerrarConexion(cn);
        } catch (Exception e) {
            e.printStackTrace();
            Conexion.deshacerCambios(cn);
            Conexion.cerrarCall(cl);
            Conexion.cerrarConexion(cn);
        }
        return rpta;
    }

/*
      public static synchronized ArrayList<DetalleFactura> obtenerFacturas() {


       ArrayList<DetalleFactura> lista = new ArrayList<DetalleFactura>();
        Connection cn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

          try {

         String consulta = "SELECT f.idFactura AS IdFactura," +
                "f.idCliente AS IdCliente, " +
                "f.serieFactura AS SerieFactura, " +
                "f.numFactura AS NumFactura, " +
                "c.razonSocial AS RazonSocial, " +
                "f.fechaFactura AS FechaFactura," +
                "f.son AS Son," +
                "f.fechaLetras AS FechaLetras," +
                "d.descripcion AS Descripcion, " +
                "d.precioUnit AS PrecioUnit, " +
                "d.cantidad AS Cantidad, " +
                "d.importe AS Parcial, " +
                "f.subtotal AS SubTotal, " +
                "f.igv AS Igv," +
                "f.total AS Total " +
                "FROM Factura AS f " +
                "INNER JOIN DetalleFactura AS d " +
                "ON f.idFactura = d.idFactura " +
                "INNER JOIN cliente AS c " +
                "ON f.idCliente=c.idCliente " +
                "ORDER BY IdFactura, Descripcion";
            cn = Conexion.getConexion();
            ps = cn.prepareStatement(consulta);
            rs = ps.executeQuery();
            while (rs.next()) {
                Factura fac=new Factura();
                DetalleFactura det=new DetalleFactura();
                Cliente cli=new Cliente();
                cli.setRazonSocial(rs.getString("RazonSocial"));
                fac.setIdFactura(rs.getInt("IdFactura"));
                fac.setSerieFactura(rs.getString("SerieFactura"));
                fac.setNumFactura(rs.getInt("NumFactura"));
                fac.setCliente(cli);
                fac.setFechaFactura(rs.getString("FechaFactura"));
                fac.setSubtotal(rs.getDouble("SubTotal"));
                fac.setIgv(rs.getDouble("Igv"));
                fac.setTotal(rs.getDouble("Total"));
                fac.setSon(rs.getString("Son"));
                fac.setFechaLetras(rs.getString("FechaLetras"));
                det.setDescripcion(rs.getString("Descripcion"));
                det.setPrecioUnit(rs.getDouble("PrecioUnit"));
                det.setCantidad(rs.getDouble("Cantidad"));
                det.setImporte(rs.getDouble("Parcial"));
                det.setFactura(fac);

                lista.add(det);
            }
            Conexion.cerrarConexion(rs);
            Conexion.cerrarConexion(cn);
        } catch (SQLException e) {
            e.printStackTrace();
            Conexion.cerrarConexion(rs);
            Conexion.cerrarConexion(cn);
        } catch (Exception e) {
            Conexion.cerrarConexion(rs);
            Conexion.cerrarConexion(cn);
        }
        return lista;
    }

 */
}


