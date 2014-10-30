<%@include file="conexion.jsp" %>
<%@page import="java.util.*" %>
<%@page import="utils.*" %>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title></title>
        <link  rel="stylesheet" href="../css/ultimate.css" type="text/css" media="all">
    </head>
    <body>

        <div align="center">
            <h3>FACTURA</h3>
 &nbsp;<a href="registrarVenta.jsp" title="Nueva Factura"><img alt="" src="../imagenes/icons/add.png" height="38" width="38"/></a>&nbsp;
            &nbsp;<a href="factura_list.jsp" title="Listar Facturas"><img alt="" src="../imagenes/icons/gastos.png" height="40" width="40"/></a>&nbsp;
            &nbsp;<a href="detalleFactura_list.jsp" title="Buscar Facturas"><img style="margin-bottom: -3px" alt="" src="../imagenes/icons/search.png" height="40" width="40"/></a>&nbsp;
        </div>
        <br>
        <div align="center">

        <br>
        <table id="rounded-corner">
            <tr>
                <th class="rounded-company" colspan="5"></th>
                <th colspan="3" align="right">LISTA DE VENTAS</th>
                <th colspan="5" class="rounded-q4"></th>
            </tr>

            <tr>
                <th><div align="center" >#</div></th>
                <th ><div align="center" >Id</div></th>
                <th ><div align="center" >Serie</div></th>
                <th ><div align="center" >N°</div></th>
                <th ><div align="center" >Fecha</div></th>
                <th ><div align="center" >Desc.</div></th>
                <th ><div align="center" >Cantidad</div></th>
                <th ><div align="center" >Importe</div></th>
                <th ><div align="center" >Subtotal</div></th>
                <th ><div align="center" >IGV</div></th>
                <th ><div align="center" >Total</div></th>
                <th ><div align="center" >Son</div></th>
            </tr>
            <%
        NumeroFactura nf = new NumeroFactura();
        Redondear r=new Redondear();
            %>
            <%
            int i = 0;
         consulta = "SELECT f.idFactura AS IdFactura," +
                "f.idCliente AS IdCliente, " +
                "f.serieFactura AS SerieFactura, " +
                "f.numFactura AS NumFactura, " +
                "c.razonSocial AS RazonSocial, " +
                "f.fechaFactura AS FechaFactura," +
                "f.son AS Son," +
                "f.fechaLetras AS FechaLetras," +
                "d.descripcion AS Descripcion, " +
                "d.cantidad AS Cantidad, " +
                "d.importe AS Parcial, " +
                "f.subtotal AS SubTotal, " +
                "f.igv AS Igv," +
                "f.total AS Total " +
                "FROM Factura AS f " +
                "INNER JOIN DetalleFactura AS d " +
                "ON f.idFactura = d.idFactura " +
                "INNER JOIN cliente AS c " +
                "ON f.idCliente=c.idCliente " +
                "ORDER BY IdFactura, Descripcion";
ps=conex.prepareStatement(consulta);
rs=ps.executeQuery();
        while (rs.next()) {
            %>
            <tr >
                <td ><%=++i%></td>
                <td ><%=rs.getString("IdFactura")%></td>
                <td ><%=rs.getString("SerieFactura")%></td>
                <td ><%=nf.customFormat("000000", rs.getDouble("NumFactura"))%></td>
                <td ><%=(String)rs.getString("FechaFactura")%></td>
                <td ><%=rs.getString("Descripcion")%></td>
                <td ><%=rs.getDouble("Cantidad")%></td>
                <td ><%=r.Redondear(rs.getDouble("Parcial"), 2)%></td>
                <td ><%=r.Redondear(rs.getDouble("SubTotal"), 2)%></td>
                <td ><%=r.Redondear(rs.getDouble("Igv"), 2)%></td>
                <td ><%=r.Redondear(rs.getDouble("Total"), 2)%></td>
                <td ><%=rs.getString("Son")%></td>
            </tr>
            <%
        }conex.close();
            %>
        </table>
    </div>
        <br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br>

</body>
</html>
