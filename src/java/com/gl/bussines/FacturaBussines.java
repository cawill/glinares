/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gl.bussines;

import com.gl.dao.DetalleFacturaDao;
import com.gl.dao.FacturaDao;
import com.gl.modelo.DetalleFactura;
import com.gl.modelo.Factura;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author José Manuel
 */
public class FacturaBussines {
    
    public FacturaDao facturaDao;
    public DetalleFacturaDao detalleFacturaDao;
    
    public void saveFactura(HttpServletRequest request) {
        Factura factura = new Factura();
        facturaDao = new FacturaDao();
        
        factura.setIdCliente(request.getParameter("txtIdCliente"));
        factura.setNumFactura(Integer.parseInt(request.getParameter("txtNumFactura")));
        factura.setSerieFactura(request.getParameter("txtSerieFactura"));
        factura.setLogin(request.getParameter("txtLogin"));
        
        facturaDao.saveFactura(factura);
    }
    
    public Factura findUltimateFacturaByUser(String user) {
        facturaDao = new FacturaDao();
        return facturaDao.findUltimateFacturaByUser(user);
    }
    
    public void saveDetalleFactura(HttpServletRequest request) {
        
        DetalleFactura detalleFactura = new DetalleFactura();
        facturaDao = new FacturaDao();
        
        detalleFactura.setCantidad(request.getParameter("txtCantidad") == null ? "" : request.getParameter("txtCantidad"));
        detalleFactura.setDescripcion(request.getParameter("txtDescripcion") == null ? "" : request.getParameter("txtDescripcion"));
        detalleFactura.setImporte(Double.parseDouble(request.getParameter("txtImporte").equals("") ? "0.0" : request.getParameter("txtImporte")));
        detalleFactura.setIdFactura(Integer.parseInt(request.getParameter("txtIdFactura")));
        
        facturaDao.saveDetalleFactura(detalleFactura);
        
    }
    
    public List listDetalleFactura(String idFactura) {
        facturaDao = new FacturaDao();
        return facturaDao.listDetalleFactura(idFactura);
    }
    
    public void updateFooterFactura(HttpServletRequest request, String idFactura) {        
        Factura factura = new Factura();
        facturaDao = new FacturaDao();
        factura.setSubtotal(Double.parseDouble(request.getParameter("txtSubTotal")));
        factura.setIgv(Double.parseDouble(request.getParameter("txtIgv")));
        factura.setTotal(Double.parseDouble(request.getParameter("txtTotal")));
        factura.setIdFactura(Integer.parseInt(request.getParameter("txtIdFactura")));
        facturaDao.updateFooterFactura(factura, idFactura);
    }
    
    public void updateCerosByDetalle(String idFactura) {
        facturaDao = new FacturaDao();
        facturaDao.updateCerosByDetalle(idFactura);
    }
    
    public void updateDetalleFactura (HttpServletRequest request, String  idDetalleFactura){
     
        DetalleFactura detalleFactura = new DetalleFactura();
        detalleFacturaDao = new DetalleFacturaDao();
        
        detalleFactura.setCantidad(request.getParameter("txtCantidad")== null ? "" : request.getParameter("txtCantidad"));
        detalleFactura.setDescripcion(request.getParameter("txtDescripcion")== null ? "" : request.getParameter("txtDescripcion"));
        detalleFactura.setImporte(Double.parseDouble(request.getParameter("txtImporte").equals("") ? "0.0" : request.getParameter("txtImporte")));
          detalleFacturaDao.updateDetalleFactura(detalleFactura, idDetalleFactura);
        
        
    }
}
