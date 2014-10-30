<%@page import="java.util.ArrayList"%>
<%@page import="com.gl.modelo.*" %>
<%@page import="com.gl.dao.*" %>
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
                <style type="text/css">
<!--
.style1 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 11px;
}
body {
	background-color: #ACD7EE;
}
body,td,th {
	color: #000000;
}
.style33 {
	font-family: Arial, Helvetica, sans-serif;
	color: #333333;
	font-size: 13px;
}
.style38 {color: #FFFFFF}
-->
                </style>
    </head>
    <body>
        
        <div align="center" class="style1">
            <h3 class="style33">FACTURA</h3>
            [&nbsp;<a href="registrarVenta.jsp">REGISTRO DE FACTURAS</a>&nbsp;]
            [&nbsp;<a href="factura_list.jsp">LISTA DE VENTAS</a>&nbsp;]
            <%-- [&nbsp;<a href="verVentas.jsp">VENTASMVC</a>&nbsp;]--%>
            [&nbsp;<a href="detalleFactura_list.jsp">LISTA DE FACTURAS</a>&nbsp;]
        </div>
        <br>
        <div align="center">

            <a href="menu.jsp"><button type="button" class="style1">Menu</button></a> 
            <br><br>
            <table border="0" cellpadding="3" cellspacing="1" class="style1">
                <tr>
                    <td colspan="13" bgcolor="#2676A6"><div align="center" class="style38"><b>Lista de Ventas</b></div></td>
                </tr>
                
                <tr>
                    <td bgcolor="#2676A6"><div align="center" class="style38">#</div></td>
                    <td bgcolor="#2676A6"><div align="center" class="style38">Id</div></td>
                    <td bgcolor="#2676A6"><div align="center" class="style38">Serie</div></td>
                    <td bgcolor="#2676A6"><div align="center" class="style38">N°</div></td>
                    <td bgcolor="#2676A6"><div align="center" class="style38">Fecha</div></td>
                    <td bgcolor="#2676A6"><div align="center" class="style38">Desc.</div></td>
                    <td bgcolor="#2676A6"><div align="center" class="style38">Cantidad</div></td>
                    <td bgcolor="#2676A6"><div align="center" class="style38">Importe</div></td>
                    <td bgcolor="#2676A6"><div align="center" class="style38">Subtotal</div></td>
                    <td bgcolor="#2676A6"><div align="center" class="style38">IGV</div></td>
                    <td bgcolor="#2676A6"><div align="center" class="style38">Total</div></td>
                    <td bgcolor="#2676A6"><div align="center" class="style38">Son</div></td>
                </tr>
                <%
                NumeroFactura nf=new NumeroFactura();
                %>
                <%int i=0;
                            ArrayList<DetalleFactura> lista = FacturaDao.obtenerFacturas();
                            Redondear r=new Redondear();
                            for (DetalleFactura d : lista) {
                %>
                <tr bgcolor="#82C1E8">
                    <td bgcolor="#82C1E8"><%=++i%></td>
                    <td bgcolor="#82C1E8"><%=d.getFactura().getIdFactura()%></td>
                    <td bgcolor="#82C1E8"><%=d.getFactura().getSerieFactura()%></td>
                    <td bgcolor="#82C1E8"><%=nf.customFormat("000000",d.getFactura().getNumFactura())%></td>
                    <td bgcolor="#82C1E8"><%=(String)d.getFactura().getFechaFactura()%></td>
                    <td bgcolor="#82C1E8"><%=d.getDescripcion() %></td>
                    <td bgcolor="#82C1E8"><%=d.getCantidad()%></td>
                    <td bgcolor="#82C1E8"><%=d.getImporte()%></td>
                    <td bgcolor="#82C1E8"><%=d.getFactura().getSubtotal()%></td>
                    <td bgcolor="#82C1E8"><%=r.Redondear(d.getFactura().getIgv(), 2)%></td>
                    <td bgcolor="#82C1E8"><%=r.Redondear(d.getFactura().getTotal(), 2)%></td>
                    <td bgcolor="#82C1E8"><%=d.getFactura().getSon()%></td>
                </tr>
                <%
                            }
                %>
          </table>
        </div>


    </body>
</html>
