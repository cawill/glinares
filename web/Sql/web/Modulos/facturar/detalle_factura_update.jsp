<%-- 
    Document   : detalle_factura_update
    Created on : 30-jul-2012, 21:15:10
    Author     : magwi
--%>

<%@include file="../conexion.jsp" %>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
    consulta = "SELECT  cantidad, descripcion, importe, idDetalleFactura "
            + " FROM detallefactura "
            + " WHERE idDetalleFactura=?; ";
    ps = conex.prepareStatement(consulta);
    ps.setString(1, request.getParameter("idDetalleFactura"));
    rs = ps.executeQuery();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="recursos/css/tabla.css" media="screen" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <form action="factura_save_detalle.jsp" method="POST">
            <center>
            <table border="1">
                <thead>
                    <tr>
                        <th>CANTIDAD</th>
                        <th>DESCRIPCION</th>
                        <th>IMPORTE</th>
                    </tr>
                </thead>
                <tbody>
                    <%if (rs.next()) {%>
                    <tr>
                        <td><input type="text" name="cantidad" value="<%=rs.getString("cantidad")%>"/></td>
                        <td><input type="text" name="descripcion" value="<%=rs.getString("descripcion")%>" size="70" maxlength="60" onChange="javascript:this.value=this.value.toUpperCase();"/></td>
                        <td><input type="text" name="importe" value="<%=rs.getString("importe")%>"/></td>
                    </tr>
                    
                    <tr>
                        <td colspan="3"><center><input type="submit" name="actualizar" value="actualizar"/></center></td>
                        
                    </tr>
                    <input type="hidden" name="accion" value="actualizar">
                    <input type="hidden" name="idDetalleFactura" value="<%=rs.getString("idDetalleFactura")%>"/>
                    <%}%>
                </tbody>
            </table>
                </center>
        </form>
<%conex.close();%>
</body>
</html>
