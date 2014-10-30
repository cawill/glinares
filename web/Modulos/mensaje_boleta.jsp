<%@include file="conexion.jsp" %>
<%@include file="session_verifica.jsp" %>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%
            consulta = "SELECT LAST_INSERT_ID(idboleta) " +
                    "AS ProximoIdAInsertar " +
                    "FROM boleta where login=?" +
                    "ORDER BY numboleta " +
                    "DESC LIMIT 1";
            ps = conex.prepareStatement(consulta);
            ps.setString(1, session_login);
            rs = ps.executeQuery();

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
        <link  rel="stylesheet" href="../css/ultimate.css" type="text/css" media="all">

    </head>
    <body class="style1">

        <div align="center" >
            <h3 class="style33">BOLETA DE VENTA</h3>
            [&nbsp;<a href="registrarVentaBoleta.jsp">REGISTRO DE BOLETAS</a>&nbsp;]
            [&nbsp;<a href="boleta_list.jsp">LISTA DE VENTAS</a>&nbsp;]
            [&nbsp;<a href="detalleBoleta_list.jsp">BUSQUEDA DE BOLETAS</a>&nbsp;]
        </div>

        <span class="style1"><br >
        </span>
        <div align="center">
            <span class="style1">
                <a href="registrarVentaBoleta.jsp">
                    <button type="submit" class="style1">Nueva Venta</button>
                </a>
            </span>
            <h4 class="style1">
            <%= request.getParameter("men")%>
            <%while(rs.next()){%>
            <input type="text" value="<%=rs.getString("ProximoIdAInsertar")%>"/>
            <a href="boleta_save_update.jsp?accion=update&ProximoIdAInsertar=<%=rs.getString("ProximoIdAInsertar")%>">
                Haga Click para continuar...
            </a>
                <%}%>
            </h4>

            <span class="style1">
                <%
                try {
                } catch (Exception e) {
                    e.printStackTrace();
                }conex.close();
                %>
            </span>
        </div>

        <br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br>
    </body>
</html>
