<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@page import="utils.*"%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
String valor=request.getParameter("valor");
String fechaCancelLetras="";
FechaSistema fecha=new FechaSistema();
if(valor.equals("CANCELADO")){
     fechaCancelLetras="Tacna, " + fecha.diaEnNumeros() + " de " + fecha.mesEnLetras() + " del " + fecha.anioEnNumeros(fecha.fecha());
}
if(valor.equals("POR CANCELAR")){
     fechaCancelLetras="Tacna, " + "__" + " " +" de " + " " + "_________________" + " " + " del " + " " + "____" ;
}
if(valor.equals("ANULADO")){
     fechaCancelLetras="Tacna, " + fecha.diaEnNumeros() + " de " + fecha.mesEnLetras() + " del " + fecha.anioEnNumeros(fecha.fecha());
}
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
    </head>
    <body>
    
        <input type="text" value="<%=fechaCancelLetras%>" size="62" name="txtFechaCancelLetras"/>
    
    </body>
</html>
