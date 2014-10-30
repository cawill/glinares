/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.gl.dao;

import com.gl.modelo.DetalleFactura;
import utils.DBConn;


/**
 *
 * @author Josmarl
 */
public class DetalleFacturaDao extends DBConn{
    
    public void updateDetalleFactura(DetalleFactura detalleFactura, String idDetalleFactura){
        
        try {
            getConexionDb();
            
            ps = con.prepareStatement("update detalleFactura set descripcion=?, cantidad=?, importe=? "
                    + "where idDetalleFactura = ?");
            
            ps.setString(1, detalleFactura.getDescripcion());
            ps.setString(2, detalleFactura.getCantidad());
            ps.setDouble(3, detalleFactura.getImporte());
            ps.setString(4, idDetalleFactura);
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        getCerrarConexion();
    }

  
}