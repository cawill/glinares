/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gl.controlador;

import com.gl.bussines.ClienteBussines;
import com.gl.bussines.FacturaBussines;
import com.gl.modelo.Cliente;
import com.gl.modelo.DetalleCliente;
import com.gl.modelo.DetalleFactura;
import com.gl.modelo.Factura;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.NumeroFactura;

/**
 *
 * @author José Manuel
 */
public class FacturaController extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        ClienteBussines clienteBussines;
        FacturaBussines facturaBussines;
        int opt = Integer.parseInt(request.getParameter("opt"));
        try {
            switch (opt) {

                case 1: {
                    clienteBussines = new ClienteBussines();
                    List<Cliente> listaClientes = clienteBussines.clienteList();
                    request.getSession().setAttribute("listaClientesSession", listaClientes);
                    response.sendRedirect("Modulos/Factura/cliente_list.jsp");
                }
                break;
                case 2: {
                    clienteBussines = new ClienteBussines();
                    DetalleCliente clienteFind = clienteBussines.findCliente(request.getParameter("txtIdCliente"));
                    request.getSession().setAttribute("clienteFindSession", clienteFind);
                    response.sendRedirect("Modulos/Factura/cliente_prepare_factura.jsp");
                }
                break;
                case 3: {
                    facturaBussines = new FacturaBussines();
                    facturaBussines.saveFactura(request);

                    facturaBussines = new FacturaBussines();
                    Factura facturaUltimate = facturaBussines.findUltimateFacturaByUser(request.getParameter("txtLogin"));
                    request.getSession().setAttribute("facturaUltimateSession", facturaUltimate);
                    response.sendRedirect("Modulos/Factura/factura_add_fm.jsp");
                }
                break;
                case 4: {
                    facturaBussines = new FacturaBussines();
                    facturaBussines.saveDetalleFactura(request);

                    facturaBussines = new FacturaBussines();
                    List<DetalleFactura> listaDetalles = facturaBussines.listDetalleFactura(request.getParameter("txtIdFactura"));
                    request.getSession().setAttribute("listaDetallesSession", listaDetalles);
                    response.sendRedirect("Modulos/Factura/factura_add_fm.jsp");
                }
                break;
                case 5: {
                    facturaBussines = new FacturaBussines();
                    facturaBussines.updateFooterFactura(request, request.getParameter("txtIdFactura"));
                    facturaBussines = new FacturaBussines();
                    facturaBussines.updateCerosByDetalle(request.getParameter("txtIdFactura"));
                    request.getSession().removeAttribute("listaDetallesSession");
                    request.getSession().removeAttribute("facturaUltimateSession");

                    clienteBussines = new ClienteBussines();
                    List<Cliente> listaClientes = clienteBussines.clienteList();
                    request.getSession().setAttribute("listaClientesSession", listaClientes);
                    response.sendRedirect("Modulos/Factura/cliente_list.jsp");
                }
                break;
                case 6: {
                    facturaBussines = new FacturaBussines();
                    //facturaBussines.updateDetalleFactura(request.getParameter("txtIdDetalleFactura"));
                    facturaBussines.updateDetalleFactura(request, request.getParameter("txtIdDetalleFactura"));

                    facturaBussines = new FacturaBussines();
                    List<DetalleFactura> listaDetalles = facturaBussines.listDetalleFactura(request.getParameter("txtIdFactura"));
                    request.getSession().setAttribute("listaDetallesSession", listaDetalles);
                    response.sendRedirect("Modulos/Factura/factura_add_fm.jsp");

                }
                break;
                default:
                    System.out.print("No hay valores opt");
                    break;

            }
        } finally {
            out.close();
        }
    }

    public NumeroFactura nf(){
        return new NumeroFactura();
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
