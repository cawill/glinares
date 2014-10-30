<%-- 
    Document   : demo
    Created on : 08/02/2012, 11:12:12 PM
    Author     : MAGWI
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
    String nombre=request.getParameter("nombre")== null ? "":request.getParameter("nombre");
    String stylo="display:normal";
    %>
    
    <%
    String repfac=request.getParameter("repfac")== null ? "":request.getParameter("repfac");
    String stylo2="display:normal";
    %>
    <%
    String repguia=request.getParameter("repguia")== null ? "":request.getParameter("repguia");
    String stylo3="display:normal";
    %>
    <%
    String repcrt=request.getParameter("repcrt")== null ? "":request.getParameter("repcrt");
    String stylo4="display:normal";
    %>
    <%
    String repmic=request.getParameter("repmic")== null ? "":request.getParameter("repmic");
    String stylo5="display:normal";
    %>
        <h1>...parametro de reportes</h1>
        
    </body>
</html>
