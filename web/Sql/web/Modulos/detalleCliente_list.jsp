
<%@include file="conexion.jsp" %>

<%-- 
    Document   : detalleTransportista_list
    Created on : 15/12/2011, 12:41:43 AM
    Author     : Josmarl
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
consulta="select d.idDetalleCliente,t.razonSocial,t.ruc, d.direccion," +
        "d.telefono,d.email,d.descrip from detalleCliente d " +
        "inner join cliente t on d.idCliente=t.idCliente where idDetalleCliente";
ps=conex.prepareStatement(consulta);
rs=ps.executeQuery();
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
        <link  rel="stylesheet" href="../css/ultimate.css" type="text/css" media="all">
    </head>
    <body>
        <div align="center">
        <h3>REPORTE Y ADMINISTRACION DE DETALLE DE CLIENTES</h3>
                <div align="center">
        [&nbsp;<a href="conductor_list.jsp">CONDUCTORES</a>&nbsp;]
        [&nbsp;<a href="rampla_list.jsp">RAMPLAS</a>&nbsp;]
        [&nbsp;<a href="tracto_list.jsp">TRACTOS</a>&nbsp;]
        [&nbsp;<a href="cliente_list.jsp">CLIENTES</a>&nbsp;]
        [&nbsp;<a href="detalleCliente_list.jsp">DETALLE CLIENTE</a>&nbsp;]
        </div><br>
        <br>
        &nbsp;<a href="cliente_list.jsp"><img alt="" src="../imagenes/icons/Atras.gif"></a>&nbsp;
          <br>
          <br><br><br><br>
          <table id="rounded-corner">
            
            <tr>
                <th class="rounded-company" colspan="4"></th>
                <th colspan="1" align="center">LISTA DETALLE DE CLIENTES</th>
                <th class="rounded-q4" colspan="3"></th>
            </tr>
            <tr>
                <th>Id </th>
                <th>Razon Social</th>
                <th>RUC</th>
                <th>Telefono</th>
                <th>Direccion</th>
                <th>Email</th>
                <th>Descrip</th>
                <th>Opciones</th>
            </tr>
            
            <%while(rs.next()){%>
            <tr>
                <td><%=rs.getString("idDetalleCliente")%></td>
                <td><%=rs.getString("razonSocial")%></td>
                <td><%=rs.getString("ruc")%></td>
                <td><%=rs.getString("telefono")%></td>
                <td><%=rs.getString("direccion")%></td>
                <td><%=rs.getString("email")%></td>
                <td><%=rs.getString("descrip")%></td>
                <td>

&nbsp;<a href="detalleCliente_save.jsp?accion=eliminar&idDetalleCliente=<%=rs.getString("idDetalleCliente")%>" onclick="return confirm('¿Esta seguro de ELIMINAR?')" title="Eliminar Detalle">
    <img alt="" src="../imagenes/icons/trash.png"/>
</a>&nbsp;
&nbsp;<a href="detalleCliente_edit_fm.jsp?accion=actualizar&idDetalleCliente=<%=rs.getString("idDetalleCliente")%>" title="Editar">
    <img src="../imagenes/icons/edit_f2.png" height="16" width="16"alt=""/>
</a>&nbsp;
                </td>
            </tr>
            <%}conex.close();%>
        </table>
        </div>
    </body>
</html>
