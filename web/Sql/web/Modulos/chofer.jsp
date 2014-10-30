<%@include file="conexion.jsp" %>
<%-- 
    Document   : chofer
    Created on : 11/01/2012, 06:43:53 PM
    Author     : Josmarl
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%

consulta="SELECT*from conductor";
ps=conex.prepareStatement(consulta);

rs=ps.executeQuery();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
    </head>
    <body>
        <select id="chofer" onchange="llamarAjaxGETlicencia()" name="idconductor" >
            <option>---Seleccione Chofer</option>
            <%while(rs.next()){%>
            <option value="<%=rs.getString("idconductor")%>">
                <%=rs.getString("nombreconductor")%>
            </option>
            <%}conex.close(); %>
        </select>
    </body>
</html>
