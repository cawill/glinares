<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@include file="conexion.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
String valor=request.getParameter("valor");
consulta="select r.placa,r.idrampla " +
        "from ramplas r " +
        "inner join cliente c " +
        "on c.idCliente=r.idCliente where c.idCliente; " ;
 //       "where c.idCliente=?";
ps=conex.prepareStatement(consulta);
//ps.setString(1, valor);
rs=ps.executeQuery();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
    </head>
    <body>
        
        <select name="idrampla">
            <option value="">
                Seleccione Rampla
            </option>
            <%while(rs.next()){%>
            <option value="<%=rs.getString("idrampla")%>">
                <%=rs.getString("placa")%>
            </option>
            <%}%>
            <option value="9">
                XXXX
            </option>
        </select>
    <%conex.close();%>
    </body>
</html>
