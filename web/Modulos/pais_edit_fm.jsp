<%@include file="conexion.jsp"%>
<%--
    Document   : contacto_nuevo
    Created on : 07-oct-2010, 15:01:57
    Author     : josmarl
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
try{
consulta="SELECT * from pais where idpais=?"; //cadena de consulta
ps=conex.prepareStatement(consulta);
ps.setString(1, request.getParameter("idpais"));
rs=ps.executeQuery();
}catch(Exception e){
e.printStackTrace();
}
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Editar Destinos</title>
        <link  rel="stylesheet" href="../css/ultimate.css" type="text/css" media="all">
    </head>
    <body>
        <div align="center">
            <h1>Edicion de Destinos</h1>
            <br>
        <form action="pais_save.jsp" method="post">
            <table id="rounded-corner-list">
            <tr>
                <th colspan="1" class="rounded-company"></th>
                <th colspan="1" class="rounded-q4">FORM. DE DESTINOS</th>
            </tr>
            <% if(rs.next()){ %>
            <tr>
                <td align="right">Ciudad :</td>
                <td><input type="text" name="ciudad" value="<%=rs.getString("ciudad") %>"></td>
            </tr>
            <tr>
                <td align="right">Pais :</td>
                <td><input type="text" name="pais" value="<%=rs.getString("pais") %>"></td>
            </tr>
            <tr>
                <td align="right">Puerto :</td>
                <td><input type="text" name="puerto" value="<%=rs.getString("puerto") %>"></td>
            </tr>
            <tr>
                <td align="right">Codigo Pais:</td>
                <td><input type="text" name="cod_pais" value="<%=rs.getString("cod_pais") %>"></td>
            </tr>
            <tr>
                <td align="right">Codigo Ciudad :</td>
                <td><input type="text" name="cod_depar" value="<%=rs.getString("cod_depar") %>"></td>
            </tr>
            <th colspan="1" class="rounded-foot-left"></th>
            <th colspan="1" class="rounded-foot-right" align="right"><input type="submit" value="Actualizar"></th>
            </tr>
            <% } %>
        </table>
        <input type="hidden" name="accion" value="actualizar">
        <input type="hidden" name="idpais" value="<%=rs.getString("idpais") %>">
        <%conex.close();%>
        </form>
        </div>
    </body>
</html>
