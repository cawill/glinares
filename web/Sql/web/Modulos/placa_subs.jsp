<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@include file="conexion.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
    </head>
    <body>

<%
    String valor=request.getParameter("valor");
    consulta="select t.placa from tracto t " +
            " inner join cliente c " +
            " on c.idCliente=t.idCliente " +
            " where c.razonSocial=?";
ps=conex.prepareStatement(consulta);
ps.setString(1, valor);
rs=ps.executeQuery();
%>

<select id="placa_subs" onchange="recogerMarNumCapAnoForCS()" name="dieoch_placacamion">
    <option>
        Seleccione Placa SUBS
    </option>
    <%while(rs.next()){%>
    <option value="<%=rs.getString("placa")%>">
    <%=rs.getString("placa")%>
    </option>
    <%}conex.close();%>
</select>


    </body>
</html>
