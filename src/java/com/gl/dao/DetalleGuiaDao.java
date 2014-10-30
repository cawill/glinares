/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.gl.dao;


import com.gl.modelo.Conexion;
import com.gl.modelo.DetalleFactura;
import com.gl.modelo.DetalleGuia;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

/**
 *
 * @author Josmarl
 */
public class DetalleGuiaDao {

   public static synchronized boolean insertarDetalleGuia(DetalleGuia varDetalle, Connection cn) {
        CallableStatement cl = null;
        boolean rpta = false;
        try {
            //Nombre del procedimiento almacenado y como espera tres parametros
            //le ponemos 3 interrogantes
            String call = "{CALL spI_detalleguia(?,?,?,?,?,?)}";
            //Preparamos la sentecia
            cl = cn.prepareCall(call);
            //Codigo de la venta
            cl.setInt(1, varDetalle.getIdGuia());
            //Codigo del producto
            cl.setString(2, varDetalle.getCodigo());
            //La cantidad
            cl.setString(3, varDetalle.getDescripcion());
            //El descuento
            cl.setDouble(4, varDetalle.getCantidad());
            cl.setString(5, varDetalle.getUnidMedida());
            cl.setDouble(6, varDetalle.getPesoTotal());
            //Ejecutamos la sentencia y si nos devuelve el valor de 1 es porque
            //registro de forma correcta los datos
            rpta = cl.executeUpdate() == 1 ? true : false;
            Conexion.cerrarCall(cl);
        } catch (SQLException e) {
            e.printStackTrace();
            Conexion.cerrarCall(cl);
        } catch (Exception e) {
            e.printStackTrace();
            Conexion.cerrarCall(cl);
        }
        return rpta;
    }
}