<%-- 
    Document   : descripcion_igv
    Created on : 11/02/2013, 08:09:47 PM
    Author     : josmarl
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
String valor = request.getParameter("valor"); 
String descpIgv;
if(valor.equals("0.18")||valor.equals("0.19")){
     descpIgv="Detraccion";
}else {
     descpIgv="Exonerado";
}   
%>

<select name="descripcionigv">
    <option>
        <%=descpIgv%>
    </option>
</select>
    </body>
</html>
