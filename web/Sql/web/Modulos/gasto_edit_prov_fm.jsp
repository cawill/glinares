<%@include file="conexion.jsp" %>

<%-- 
    Document   : conductor_edit_fm
    Created on : 16/12/2011, 05:02:55 PM
    Author     : Josmarl
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
consulta="SELECT ruc, razonsocial, direccion FROM proveedor WHERE ruc=?; ";
ps=conex.prepareStatement(consulta);
ps.setString(1, request.getParameter("ruc"));
rs=ps.executeQuery();
%>
<%--
consulta="select razonSocial,idCliente from cliente where estado='1';";
ps=conex.prepareStatement(consulta);
ResultSet rst=ps.executeQuery();
--%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
         <link  rel="stylesheet" href="../css/ultimate.css" type="text/css" media="all">
         
    </head>
    <body>
        <h1 align="center">Edicion de proveedor</h1>
        <br>
        <div align="center">
            <form action="gasto_save_prov.jsp" method="post">
            <table id="rounded-corner-list" align="center" width="300">
                <tr>
                    <th class="rounded-company" colspan="1" ></th>
                    <th  style="padding: 7px" colspan="1" class="rounded-q4">FORMULARIO DE proveedor</th>
                </tr>
                <%if(rs.next()){%>
            
                <tr>
                <td align="right"> Ruc :</td>
                <td><input name="ruc" type="text" value="<%=rs.getString("ruc")%>" size="20" maxlength="12" /></td>
            </tr>
            <tr>
                <td align="right"> Razon Social :</td>
                <td><input name="razonsocial" type="text" value="<%=rs.getString("razonsocial")%>" size="70" maxlength="100" /></td>
            </tr>
            
            <tr>
                <td align="right"> direccion :</td>
                <td><input type="text" name="direccion"  value="<%=rs.getString("direccion")%>" /></td>
            </tr>
            
            <%}%>
            <tr>
                <th class="rounded-foot-left" colspan="1"><input type="submit" value="Guardar" /></th>
                <th class="rounded-foot-right" colspan="1"></th>
            </tr>
        </table>
            </div>
            <input type="hidden" name="accion" value="actualizar"/>
            <input type="hidden" name="ruc" value="<%=rs.getString("ruc")%>"/>
   <%conex.close();%>
        </form>
    </body>
</html>
