<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@include file="conexion.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
        <link  rel="stylesheet" href="../css/ultimate.css" type="text/css" media="all"/>

    </head>
    <body>
        <%
            consulta = "select d.idDetalleBoleta,b.idboleta,d.cantidad," +
                    "d.descripcion,d.importe " +
                    "from detalleboleta d " +
                    "inner join boleta b " +
                    "on d.idboleta=b.idboleta " +
                    "where d.idDetalleBoleta=?";
            ps = conex.prepareStatement(consulta);
            ps.setString(1, request.getParameter("idDetalleBoleta"));
            rs = ps.executeQuery();
        %>
        <form action="detalleBoleta_save.jsp" method="post">
            <table id="rounded-corner-list_2">
                <tr>
                    <th class="rounded-company">Cant</th>
                    <th style="padding: 7px">Descripcion</th>
                    <th>P. Unit.</th>
                    <th class="rounded-q4">Total</th>
                </tr>
                <%if (rs.next()) {%>
                <tr>
                    <td>
                        <input type="text" name="txtCantidad" size="4"value="<%=rs.getString("cantidad")%>"/>
                    </td>
                    <td>
                        <textarea name="txtDescripcion" cols="60" rows="1"><%=rs.getString("descripcion")%></textarea>
                    </td>
                    <td></td>
                    <td><input type="text" name="txtImporte" size="7" value="<%=rs.getString("importe")%>"/></td>
                </tr>
                <%}%>
                <tr>
                    <th colspan="1" class="rounded-foot-left"></th>
                    <th colspan="2" align="center">
                        <input type="submit" value="Actualizar"/>
                    </th>
                    <th colspan="2"class="rounded-foot-right"></th>
                </tr>
            </table>
                <input type="hidden" name="accion" value="edit"/>
                <input type="hidden" name="idDetalleBoleta" value="<%=rs.getString("idDetalleBoleta")%>"/>
                <input type="hidden" name="idboleta" value="<%=rs.getString("idboleta")%>"/>
        </form>
        <%conex.close();%>
        <br><br>
    </body>
</html>
