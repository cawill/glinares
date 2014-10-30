/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gl.dao;

import com.gl.modelo.Cliente;
import com.gl.modelo.DetalleCliente;
import java.util.ArrayList;
import java.util.List;
import utils.DBConn;

/**
 *
 * @author José Manuel
 */
public class ClienteDao extends DBConn {
    
    public List clienteList() {
        Cliente cliente;
        List<Cliente> listaClientes = new ArrayList<Cliente>();
        try {
            getConexionDb();
            ps = con.prepareStatement("select*from cliente");
            rs = ps.executeQuery();
            while (rs.next()) {
                cliente = new Cliente();
                cliente.setIdCliente(rs.getInt("idCliente"));
                cliente.setRazonSocial(rs.getString("razonSocial"));
                cliente.setRuc(rs.getString("ruc"));
                listaClientes.add(cliente);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            getCerrarConexion();
        }
        return listaClientes;
    }
    
    public DetalleCliente findCliente(String idCliente) {
        DetalleCliente detalleCliente = new DetalleCliente();
        try {
            getConexionDb();
            ps = con.prepareStatement("select c.idCliente,c.razonSocial,"
                    + "c.ruc,d.direccion from cliente c "
                    + "inner join detalleCliente d "
                    + "on c.idCliente=d.idCliente "
                    + "where c.idCliente=?");
            ps.setString(1, idCliente);
            rs = ps.executeQuery();
            if (rs.next()) {
                
                Cliente cliente = new Cliente();
                cliente.setIdCliente(rs.getInt("idCliente"));
                detalleCliente.setCliente(cliente);
                
                cliente.setRazonSocial(rs.getString("razonSocial"));
                detalleCliente.setCliente(cliente);
                
                cliente.setRuc(rs.getString("ruc"));
                detalleCliente.setCliente(cliente);
                
                detalleCliente.setDireccion(rs.getString("direccion"));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            getCerrarConexion();
        }
        return detalleCliente;
        
    }
}
