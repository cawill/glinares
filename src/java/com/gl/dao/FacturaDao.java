/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gl.dao;

import com.gl.modelo.Cliente;
import com.gl.modelo.DetalleFactura;
import com.gl.modelo.Factura;
import java.util.ArrayList;
import java.util.List;
import utils.DBConn;

/**
 *
 * @author Josmarl
 */
public class FacturaDao extends DBConn {

    public boolean saveFactura(Factura facturaTo) {
        boolean result = false;
        try {
            getConexionDb();
            ps = con.prepareStatement("insert into factura(idCliente,serieFactura,"
                    + "numFactura,login)"
                    + " values(?,?,?,?)");
            ps.setString(1, facturaTo.getIdCliente());
            ps.setString(2, facturaTo.getSerieFactura());
            ps.setInt(3, facturaTo.getNumFactura());
            ps.setString(4, facturaTo.getLogin());

            if (ps.executeUpdate() == 1) {
                result = true;
            } else {
                result = false;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            getCerrarConexion();
        }
        return result;
    }

    public Factura findFacturaByClient(String idCliente) {

        Factura factura = new Factura();
        try {
            ps = con.prepareStatement("select*from factura where idCliente=?");
            ps.setString(1, idCliente);
            rs = ps.executeQuery();
            if (rs.next()) {
                factura.setIdCliente(rs.getString("idCliente"));
            }
            getConexionDb();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            getCerrarConexion();
        }

        return factura;
    }

    public Factura findUltimateFacturaByUser(String user) {
        Factura factura = new Factura();
        Cliente cliente = new Cliente();
        try {
            getConexionDb();
            ps = con.prepareStatement("SELECT MAX(idFactura) AS id, idCliente, numFactura, serieFactura  FROM factura WHERE login=?");
//            ps = con.prepareStatement("SELECT MAX(f.idFactura) AS id, c.razonsocial, f.serieFactura  "
//                    + " FROM factura f"
//                    + " INNER JOIN cliente c ON c.idcliente=f.idcliente"
//                    + " WHERE f.login=?");
            ps.setString(1, user);
            rs = ps.executeQuery();
            if (rs.next()) {
                factura.setIdFactura(rs.getInt("id"));
                factura.setIdCliente(rs.getString("idCliente"));
                factura.setSerieFactura(rs.getString("serieFactura"));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            getCerrarConexion();
        }
        return factura;
    }

    public boolean saveDetalleFactura(DetalleFactura detalleFactura) {

        boolean result = false;

        try {
            getConexionDb();
            ps = con.prepareStatement("insert into detalleFactura(cantidad,"
                    + "descripcion,importe,idFactura) "
                    + "values(?,?,?,?)");
            ps.setString(1, detalleFactura.getCantidad());
            ps.setString(2, detalleFactura.getDescripcion());
            ps.setDouble(3, detalleFactura.getImporte());
            ps.setInt(4, detalleFactura.getIdFactura());
            if (ps.executeUpdate() == 1) {
                result = true;
            } else {
                result = false;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            getCerrarConexion();
        }
        return result;
    }

    public List listDetalleFactura(String idFactura) {

        DetalleFactura detalleFactura;
        List<DetalleFactura> listaDetalles = new ArrayList<DetalleFactura>();

        try {
            getConexionDb();
            ps = con.prepareStatement("SELECT * from detalleFactura where idFactura=?");
            ps.setString(1, idFactura);
            rs = ps.executeQuery();
            while (rs.next()) {
                detalleFactura = new DetalleFactura();
                detalleFactura.setIdDetalleFactura(rs.getInt("idDetalleFactura"));
                detalleFactura.setCantidad(rs.getString("cantidad"));
                detalleFactura.setDescripcion(rs.getString("descripcion"));
                detalleFactura.setImporte(rs.getDouble("importe"));
                detalleFactura.setIdFactura(rs.getInt("idFactura"));
                listaDetalles.add(detalleFactura);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            getCerrarConexion();
        }

        return listaDetalles;
    }

    public boolean updateFooterFactura(Factura factura, String idFactura) {
        boolean result = false;
        try {
            getConexionDb();
            ps = con.prepareStatement("update factura set subtotal=?,igv=?,total=? where idFactura=?");
            ps.setDouble(1, factura.getSubtotal());
            ps.setDouble(2, factura.getIgv());
            ps.setDouble(3, factura.getTotal());
            ps.setString(4, idFactura);

            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            getCerrarConexion();
        }
        return result;
    }
    
        public void updateCerosByDetalle(String idFactura) {
        try {
            getConexionDb();
            ps = con.prepareStatement("update detalleFactura set importe='' where idFactura=? and importe='0.0'");
            ps.setString(1, idFactura);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            getCerrarConexion();
        }
    }
    
}
