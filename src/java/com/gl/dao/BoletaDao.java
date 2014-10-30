/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gl.dao;

import com.gl.modelo.Boleta;
import com.gl.modelo.DetalleBoleta;
import java.util.ArrayList;
import java.util.List;
import utils.DBConn;

/**
 *
 * @author Josmarl
 */
public class BoletaDao extends DBConn{
    
    public boolean saveBoleta(Boleta boletaTo) {
        boolean result = false;
        try {
            getConexionDb();
            ps = con.prepareStatement("insert into boleta(idCliente,serieBoleta,"
                    + "numBoleta,login) "
                    + " values(?,?,?,?)");
            ps.setString(1, boletaTo.getIdCliente());
            ps.setString(2, boletaTo.getSerieboleta());
            ps.setInt(3, boletaTo.getNumboleta());
            ps.setString(4, boletaTo.getLogin());
            
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
    
    public Boleta findBoletaByClient(String idCliente) {
        
        Boleta boleta = new Boleta();
        try {
            ps = con.prepareStatement("select*from boleta where idCliente=?");
            ps.setString(1, idCliente);
            rs = ps.executeQuery();
            if (rs.next()) {
                boleta.setIdCliente(rs.getString("idCliente"));
            }
            getConexionDb();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            getCerrarConexion();
        }
        
        return boleta;
    }
    
    public Boleta findUltimateBoletaByUser(String user) {
        Boleta boleta = new Boleta();
        try {
            getConexionDb();
            ps = con.prepareStatement("SELECT MAX(idFactura) AS id,idCliente FROM Boleta WHERE login=?");
            ps.setString(1, user);
            rs = ps.executeQuery();
            if (rs.next()) {
                boleta.setIdboleta(rs.getInt("id"));
                boleta.setIdCliente(rs.getString("idCliente"));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            getCerrarConexion();
        }
        return boleta;
    }
    
    public boolean saveDetalleBoleta(DetalleBoleta detalleBoleta) {
        boolean result = false;
        try {
            getConexionDb();
            ps = con.prepareStatement("insert into detalleBoleta(cantidad,"
                    + "descripcion,importe,idBoleta) "
                    + "values(?,?,?,?)");
            ps.setString(1, detalleBoleta.getCantidad());
            ps.setString(2, detalleBoleta.getDescripcion());
            ps.setDouble(3, detalleBoleta.getImporte());
            ps.setInt(4, detalleBoleta.getIdboleta());
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
    
    public List listDetalleBoleta(String idBoleta) {
        
        DetalleBoleta detalleBoleta;
        List<DetalleBoleta> listaDetalles = new ArrayList<DetalleBoleta>();
        
        try {
            getConexionDb();
            ps = con.prepareStatement("SELECT * from detalleBoleta where idFactura=?");
            ps.setString(1, idBoleta);
            rs = ps.executeQuery();
            while (rs.next()) {
                detalleBoleta = new DetalleBoleta();
                detalleBoleta.setCantidad(rs.getString("cantidad"));
                detalleBoleta.setDescripcion(rs.getString("descripcion"));
                detalleBoleta.setImporte(rs.getDouble("importe"));
                detalleBoleta.setIdboleta(rs.getInt("idBoleta"));
                listaDetalles.add(detalleBoleta);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            getCerrarConexion();
        }
        return listaDetalles;
    }
       
}


