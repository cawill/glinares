<%-- 
    Document   : moneda
    Created on : 04/03/2012, 08:10:13 PM
    Author     : Josmarl
--%>
<%@include file="conexion.jsp" %>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        String valor=request.getParameter("valor");
        String moneda="";
        if(valor.equals("US$"))
        {
        moneda="DÓLARES AMERICANOS";
        } else if(valor.equals("S/.")){
        moneda="NUEVOS SOLES";
        } else if(valor.equals("")){
        moneda="";
        }
        %>
        <input name="txtMonedaletra" value="<%=moneda%>" type="text" size="20" maxlength="20"/>
    </body>
</html>
