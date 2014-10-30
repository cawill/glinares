/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.gl.dao;


import com.gl.modelo.Conexion;
import com.gl.modelo.DetalleBoleta;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

/**
 *
 * @author Josmarl
 */
public class DetalleBoletaDao {

   public static synchronized boolean insertarDetalleBoleta(DetalleBoleta varDetalle, Connection cn) {
        CallableStatement cl = null;
        boolean rpta = false;
        try {
            //Nombre del procedimiento almacenado y como espera tres parametros
            //le ponemos 3 interrogantes
            String call = "{CALL spI_detalleboleta(?,?,?,?,?)}";
            //Preparamos la sentecia
            cl = cn.prepareCall(call);
            //Codigo de la venta
            cl.setInt(1, varDetalle.getIdboleta());
            //Codigo del producto
            cl.setString(2, varDetalle.getDescripcion());
            //La cantidad
            cl.setString(3, varDetalle.getCantidad());
            //El descuento
            cl.setDouble(4, varDetalle.getPrecioUnit());
            cl.setDouble(5, varDetalle.getImporte());
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