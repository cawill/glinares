<%@include file="conexion.jsp" %>
<%@include file="session_verifica.jsp" %>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
                <%
                 consulta = "SELECT LAST_INSERT_ID(idFactura)" +
                "AS ProximoIdAInsertar " +
                "FROM factura WHERE login=?" +
                "ORDER BY numFactura " +
                "DESC LIMIT 1";
                 ps=conex.prepareStatement(consulta);
                 ps.setString(1, session_login);
                 rs=ps.executeQuery();
                %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
                <link  rel="stylesheet" href="../css/ultimate.css" type="text/css" media="all">

    </head>
    <body class="style1">
        
        <div align="center" >
            <h3 class="style33">FACTURA</h3>
            [&nbsp;<a href="registrarVenta.jsp">REGISTRO DE FACTURAS</a>&nbsp;]
            [&nbsp;<a href="factura_list.jsp">LISTA DE VENTAS</a>&nbsp;]
            <%-- [&nbsp;<a href="verVentas.jsp">VENTASMVC</a>&nbsp;]--%>
            [&nbsp;<a href="detalleFactura_list.jsp">BUSQUEDA FACTURAS</a>&nbsp;]
        </div>
        
        <span class="style1"><br >
        </span>
        <div align="center">
            <span class="style1"><a href="registrarVenta.jsp">
            <button type="submit" class="style1">Nueva Venta</button>
            </a>
            </span>
            <h4 class="style1">
                <%= request.getParameter("men")%>
                <%while(rs.next()){%>
                <input type="text" value="<%=rs.getString("ProximoIdAInsertar")%>"/>
                <a href="factura_save_update.jsp?accion=update&ProximoIdAInsertar=<%=rs.getString("ProximoIdAInsertar")%>">
                    Haga Click para continuar...
                </a>
                <%}conex.close(); %>
            </h4>

        </div>
    </body>
</html>
