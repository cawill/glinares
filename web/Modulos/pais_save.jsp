<%@include file="conexion.jsp" %>
<%-- 
    Document   : pais_save
    Created on : 20/02/2012, 12:00:03 PM
    Author     : Josmarl
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
    </head>
    <body>
        <%
String orden=request.getParameter("accion");

String idPais=request.getParameter("idpais");
String ciudad=request.getParameter("ciudad");
String pais=request.getParameter("pais");
String puerto=request.getParameter("puerto");
String cod_pais=request.getParameter("cod_pais");
String cod_depar=request.getParameter("cod_depar");


if(orden.equals("guardar") && (ciudad.length()>0) ){
    consulta="INSERT INTO pais(ciudad, pais, puerto, cod_pais, cod_depar) VALUES (?, ?, ?, ? ,?);";
    ps=conex.prepareStatement(consulta);
    ps.setString(1, ciudad);
    ps.setString(2, pais);
    ps.setString(3, puerto);
	ps.setString(4, cod_pais);
	ps.setString(5, cod_depar);

    if(ps.executeUpdate()==1){
        response.sendRedirect("pais_list.jsp");
    }else{
        out.print("No es posible guardar contacto");
    }
}else if(orden.equals("actualizar") && (idPais.length()>0 && puerto.length()>0) ){
    consulta="UPDATE pais SET ciudad=?, pais=?, puerto=?, cod_pais=?, cod_depar=? WHERE idpais=? ;";
    ps=conex.prepareStatement(consulta);
    ps.setString(1, ciudad);
    ps.setString(2, pais);
    ps.setString(3, puerto);
	ps.setString(4, cod_pais);
	ps.setString(5, cod_depar);
    ps.setString(6, idPais);
    if(ps.executeUpdate()==1){
        response.sendRedirect("pais_list.jsp");
    }else{
        out.print("No es posible actualizar contacto");
    }
}else if(orden.equals("eliminar") && (idPais.length()>0) ){
    consulta="DELETE FROM pais WHERE idpais=? ;";
    ps=conex.prepareStatement(consulta);
    ps.setString(1, idPais);
    if(ps.executeUpdate()==1){
        response.sendRedirect("pais_list.jsp");
    }else{
        out.print("No es posible eliminar contacto");
    }
}else{
    out.print("Accion invalida...");
}

conex.close();
%>
    </body>
</html>
