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

        <div align="center" class="style1">
            <h3 class="style33">BOLETA DE VENTA</h3>
            &nbsp;<a href="registrarVentaBoleta.jsp" title="Nueva Boleta de Venta"><img alt="" src="../imagenes/icons/add.png" height="38" width="38"/></a>&nbsp;
            &nbsp;<a href="boleta_list.jsp" title="Listar Boleta"><img alt="" src="../imagenes/icons/gastos.png" height="40" width="40"/></a>&nbsp;
            &nbsp;<a href="detalleBoleta_list.jsp" title="Buscar Boletas"><img alt="" style="margin-bottom: -3px" src="../imagenes/icons/search.png" height="40" width="40"/></a>&nbsp;
        </div>
        <br>
        <div align="center">

        <br>
        <table id="rounded-corner">
            <tr>
                <th colspan="5" class="rounded-company"></th>
                <th colspan="3" align="right">LISTA DE VENTAS</th>
                <th colspan="5" class="rounded-q4"></th>
                
            </tr>
            <tr>
                <th><div align="center" >#</div></th>
                <th><div align="center" >Id</div></th>
                <th><div align="center" >Serie</div></th>
                <th><div align="center" >N°</div></th>
                <th><div align="center" >Fecha</div></th>
                <th><div align="center" >Desc.</div></th>
                <th ><div align="center" >Cantidad</div></th>
                <th ><div align="center" >Importe</div></th>
                <th ><div align="center" >Total</div></th>
                <th ><div align="center" >Son</div></th>
                <th ><div align="center" >Estado</div></th>
            </tr>
            <%
        NumeroFactura nf = new NumeroFactura();
        Redondear r=new Redondear();
            %>
            <%int i = 0;
         consulta = "SELECT f.idboleta AS IdBoleta," +
                "f.idCliente AS IdCliente, " +
                "f.estado AS Estado, " +
                "f.serieboleta AS SerieBoleta, " +
                "f.numboleta AS NumBoleta, " +
                "c.razonSocial AS RazonSocial, " +
                "f.fechaelaboleta AS FechaBoleta," +
                "f.son AS Son," +
                "f.fechaLetras AS FechaLetras," +
                "d.descripcion AS Descripcion, " +
                "d.cantidad AS Cantidad, " +
                "d.importe AS Parcial, " +
                "f.total AS Total " +
                "FROM Boleta AS f " +
                "INNER JOIN DetalleBoleta AS d " +
                "ON f.idboleta = d.idboleta " +
                "INNER JOIN cliente AS c " +
                "ON f.idCliente=c.idCliente " +
                "ORDER BY Idboleta, Descripcion";
ps=conex.prepareStatement(consulta);
rs=ps.executeQuery();
        while (rs.next()) {
            %>
            <tr>
                <td><%=++i%></td>
                <td ><%=rs.getString("IdBoleta")%></td>
                <td ><%=rs.getString("SerieBoleta")%></td>
                <td ><%=nf.customFormat("000000", rs.getDouble("NumBoleta"))%></td>
                <td ><%=(String)rs.getString("FechaBoleta")%></td>
                <td ><%=rs.getString("Descripcion")%></td>
                <td ><%=rs.getDouble("Cantidad")%></td>
                <td ><%=r.Redondear(rs.getDouble("Parcial"), 2)%></td>
                <td ><%=r.Redondear(rs.getDouble("Total"), 2)%></td>
                <td ><%=rs.getString("Son")%></td>
                <td ><%=rs.getString("Estado")%></td>
            </tr>
            <%
        }conex.close();
            %>
        </table>
    </div>

            <br><br><br><br><br><br><br>
            <br><br><br><br><br><br><br>
            <br><br><br><br><br><br><br>
</body>
</html>
