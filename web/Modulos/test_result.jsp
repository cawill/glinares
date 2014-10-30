<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
    </head>
    <body>
    <h1>JSP Page</h1>
    
    
<%
String resultado=request.getParameter("1")==null ? " " : request.getParameter("1");
if(resultado.equals("X"))
{
}
%>
    
    </body>
</html>
