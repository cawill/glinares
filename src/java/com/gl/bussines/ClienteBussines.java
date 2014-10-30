/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gl.bussines;

import com.gl.dao.ClienteDao;
import com.gl.modelo.DetalleCliente;
import java.util.List;

/**
 *
 * @author José Manuel
 */
public class ClienteBussines {

    public ClienteDao clienteDao;

    public List clienteList() {
        clienteDao = new ClienteDao();
        return clienteDao.clienteList();
    }

    public DetalleCliente findCliente(String idCliente) {
        clienteDao = new ClienteDao();
        return clienteDao.findCliente(idCliente);
    }
}
