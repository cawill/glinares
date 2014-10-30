<%@include file="conexion.jsp" %>
<%-- 
    Document   : tracto_ref_guia
    Created on : 22/03/2012, 11:01:24 PM
    Author     : Josmarl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
      
String valor=request.getParameter("valor");
    consulta="select c.idcliente,t.placa,t.marca,t.idtracto " +
            "from cliente c " +
            "inner join tracto t " +
            "on c.idcliente=t.idcliente " +
            "where c.idcliente=?";
ps=conex.prepareStatement(consulta);
ps.setString(1, valor);
rs=ps.executeQuery();
%>
    <select name="txtIdTracto" id="trac" onchange="llamarDatosTracto()">
        <option value="">
            Seleccione Tracto
        </option>
        <%while(rs.next()){%>
        <option value="<%=rs.getString("idtracto")%>">
            <%=rs.getString("placa")%>
        </option>
        <%}conex.close();%>
    </select>
    </body>
</html>
