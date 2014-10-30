<%-- 
    Document   : detalle_factura
    Created on : 30-jul-2012, 18:32:16
    Author     : magwi
--%>
<%@include file="../conexion.jsp" %>
<%@include file="../session_verifica.jsp" %>
<%@page import="com.gl.controlador.FacturaController" %>
<%@page import="utils.Redondear" %>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%
    Redondear red = new Redondear();
%>
<%
    consulta = "SELECT  f.idfactura,df.cantidad, df.descripcion, df.importe,df.idDetalleFactura "
            + " FROM factura f INNER JOIN detallefactura df ON f.idfactura = df.idfactura "
            + " WHERE f.login=? AND f.idfactura = (SELECT MAX(idfactura) FROM factura WHERE login = ?); ";
    ps = conex.prepareStatement(consulta);
    ps.setString(1, session_login);
    ps.setString(2, session_login);
    rs = ps.executeQuery();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
        <link href="recursos/css/tabla.css" media="screen" rel="stylesheet" type="text/css" />
    </head>
    <body>
    <center>
            <table border="0">
                <thead>
                    <tr>
                        <th>[&nbsp;CANTIDAD&nbsp;]</th>
                        <th>[&nbsp;DESCRIPCION&nbsp;]</th>
                        <th>[&nbsp;IMPORTE&nbsp;]</th>
                        <th>[&nbsp;OPT&nbsp;]</th>
                    </tr>
                </thead>
                <tbody>
                    <%while (rs.next()) {%>
                    <tr>
                        <td><%=rs.getString("cantidad")%></td>
                        <td><%=rs.getString("descripcion")%></td>
                        <td><%=red.red().Redondear(rs.getDouble("importe"),2) %></td>

                        <td><a href="detalle_factura_update.jsp?accion=actualizar&idDetalleFactura=<%=rs.getString("idDetalleFactura")%>"><img src="../../imagenes/icons/edit_f2.png" height="16" width="16"alt=""/></a>
                            <a href="factura_save_detalle.jsp?accion=eliminar&idDetalleFactura=<%=rs.getString("idDetalleFactura")%>"><img src="../../imagenes/icons/trash.png" height="18" width="18"  alt=""/></a></td>
                        </tr>
                    <%}%>
                </tbody>
            </table>
                
    </center>
             <%conex.close();%>   
</body>
</html>
