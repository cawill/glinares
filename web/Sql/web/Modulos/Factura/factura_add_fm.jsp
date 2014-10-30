<%--
    Document   : factura_add_fm
    Created on : 22/07/2012, 06:59:34 PM
    Author     : José Manuel
--%>

<%@page import="com.gl.modelo.DetalleFactura"%>
<%@page import="java.util.List"%>
<%@page import="com.gl.modelo.Factura"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        Factura facturaUltimate = (Factura) request.getSession().getAttribute("facturaUltimateSession");
    %>
    <body>
        <br/>
        <br/>
        <br/>
    <center>
        <table style="border-radius: 10px; background-color: appworkspace; box-shadow:0px 0px 10px rgba(0,0,0,1);">
            <tr>
                <th colspan="2">Factura</th>
            </tr>
            <tr>
                <td>Id Factura</td>
                <td><%=facturaUltimate.getIdFactura()%></td>
            </tr>
            <tr>
                <td>Id Cliente</td>
                <td><%=facturaUltimate.getIdCliente()%></td>
            </tr>
            <tr>
                <td>serie factura</td>
                <td><%=facturaUltimate.getSerieFactura()%></td>
                    
            </tr>
        </table>
    </center>
    <br/>
    <form action="../../FacturaController">
        <center>
            <table>
                <tr>
                    <th colspan="3">Detalle de factura</th>
                </tr>
                <tr>
                    <th>Cantidad</th>
                    <th>Descripcion</th>
                    <th>Importe</th>
                    <th>Aniadir</th>
                </tr>
                <tr>
                    <td><input type="text" name="txtCantidad"/></td>
                    <td><input type="text" name="txtDescripcion"/></td>
                    <td><input type="text" name="txtImporte" value=""/></td>
                    <td><input type="submit" value="+"/></td>
                </tr>
            </table>
        </center>

        <input type="hidden" name="txtIdFactura" value="<%=facturaUltimate.getIdFactura()%>"/>
        <input type="hidden" name="opt" value="4"/>
    </form>

        <center>
    <table style="border-radius: 10px; background-color: buttonface ; box-shadow:0px 0px 10px rgba(0,0,0,1);" border="1">
        <tr>
            <td>
                <form action="../../FacturaController">
                    
                
                <table>
                    <tr>
                        <th>Cantidad</th>
                        <th>Descripcion</th>
                        <th>Importe</th>
                        <th>Opciones</th>
                    </tr>
                    <%
                        double subtotal = 0;
                        double igv = 0.19;
                        double total = 0;
                        if ((List<DetalleFactura>) request.getSession().getAttribute("listaDetallesSession") == null) {
                    %>
                    <tr>
                        <td colspan="4">No hay valores</td>
                    </tr>
                    <%} else {
                        List<DetalleFactura> listaDetalles = (List<DetalleFactura>) request.getSession().getAttribute("listaDetallesSession");
                        for (DetalleFactura to : listaDetalles) {
                            subtotal = subtotal + to.getImporte();
                    %>
                    <tr>
                        <td><input type="text" name="txtCantidad" value="<%=to.getCantidad()%>"/></td>
                        <td><input type="text" name="txtDescripcion" size="50" value="<%=to.getDescripcion()%>"/></td>
                        <td><input type="text" name="txtImporte" value="<%=to.getImporte()%>"/></td>
                        <td><input type="text" name="txtIdDetalleFactura" value="<%=to.getIdDetalleFactura()%>" /></td>
                        <td><a href="../../FacturaController?opt=6&txtIdDetalleFactura=<%=to.getIdDetalleFactura()%>">editar</a></td>
                        
                    </tr>
                    <%}
                }%>
                </table>
                </form>
                <form action="../../FacturaController" name="formFooterFactura">
                    <table>
                        <tr>
                            <td>Subtotal:</td>
                            <td><input type="text" name="txtSubTotal" value="<%=subtotal%>"/></td>
                        </tr>
                        <tr>
                            <td>IGV:</td>
                            <td><input type="text" name="txtIgv" value="<%=subtotal * igv%>"/><br/></td>
                        </tr>
                        <tr>
                            <td>Total:</td>
                            <td><input type="text" name="txtTotal" value="<%=subtotal + (subtotal * igv)%>"/><br/></td>
                        </tr>
                    </table>
                    <input type="hidden" name="txtIdFactura" value="<%=facturaUltimate.getIdFactura()%>"/>
                    <input type="hidden" name="opt" value="5"/>
                    <input type="submit" value="Guardar Factura"/>
                </form>
            </td>
        </tr>
    </table>
</center>
</body>
</html>
