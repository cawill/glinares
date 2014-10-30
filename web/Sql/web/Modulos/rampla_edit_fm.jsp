<%@include file="conexion.jsp" %>

<%-- 
    Document   : rampla_edit_fm
    Created on : 19/12/2011, 12:15:41 AM
    Author     : Josmarl
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
consulta="select r.idRampla,r.tipo,r.ejes,r.placa,r.nroConstancia," +
        "r.configuracion,r.clase,r.descripcion,r.estado,r.idCliente," +
        "t.razonSocial from ramplas r inner join cliente t " +
        "on r.idCliente=t.idCliente where idRampla=?;";
ps=conex.prepareStatement(consulta);
ps.setString(1, request.getParameter("idRampla"));
rs=ps.executeQuery();
%>
<%
consulta="select razonSocial,idCliente from cliente where estado='1'";
ps=conex.prepareStatement(consulta);
ResultSet rst=ps.executeQuery();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
        <link  rel="stylesheet" href="../css/ultimate.css" type="text/css" media="all">
    </head>
    <body>
        <div align="center"><h1>Edicion de Ramplas</h1></div>
        &nbsp;
        <form action="rampla_save.jsp" method="post">
            <div align="center">
            <table id="rounded-corner-list_1" align="center">
                <tr>
                    <th class="rounded-company" colspan="1"></th>
                    <th colspan="2" align="right" style="padding: 7px">FORMULARIO DE RAMPLAS</th>
                    <th class="rounded-q4" colspan="1"></th>
                </tr>
                <% if(rs.next()){  %>
				<tr>
                        <td align="right">Razon Social :</td>
                        <td colspan="3">
                            <select name="idCliente">
                                
                                <option label="<%=rs.getString("razonSocial")%>" value="<%=rs.getString("idCliente")%>">
                                    <%=rs.getString("razonSocial")%>
                                </option>
                                <%while(rst.next()){%>
                                <option  label="<%=rst.getString("razonSocial")%>" value="<%=rst.getString("idCliente")%>">
                                    <%=rst.getString("razonSocial")%>
                                </option>
                                 <%}%>
                                
                            </select>
                        </td>
 
                    </tr>
                    <tr>
                        <td align="right">Tipo :</td>
                        <td><input type="text" name="tipo" value="<%=rs.getString("tipo")%>" /></td>
                        <td align="right">Ejes :</td>
                        <td><input type="text" name="ejes" value="<%=rs.getString("ejes")%>" /></td>
                    </tr>
                    <tr>
                        <td align="right">Placa :</td>
                        <td><input type="text" name="placa" value="<%=rs.getString("placa")%>" /></td>
                        <td align="right">Nro :</td>
                        <td><input type="text" name="nroConstancia" value="<%=rs.getString("nroConstancia")%>" /></td>
                    </tr>
                    <tr>
                        <td align="right">Configuracion :</td>
                        <td><input type="text" name="configuracion" value="<%=rs.getString("configuracion")%>" /></td>
                        <td align="right">Clase :</td>
                        <td><input type="text" name="clase" value="<%=rs.getString("clase")%>" /></td>
                    </tr>
                    <tr>
                        <td align="right">Descripcion :</td>
                        <td><input type="text" name="descripcion" value="<%=rs.getString("descripcion")%>" /></td>
                        <td align="right">Estado</td>
                        <td><input type="text" name="estado" value="<%=rs.getString("estado")%>" /></td>
                    </tr>
                    
                    <tr>
                        <th class="rounded-foot-left" colspan="3"></th>
					<th><button type="submit" title="Guardar"><img alt="" src="../imagenes/icons/listo.png" height="50" width="50"/></button></th>
                        
                    </tr>
                    <%}%>
            </table>
            </div>
            <input  type="hidden" name="accion" value="actualizar"/>
            <input  type="hidden" name="idRampla" value="<%=rs.getString("idRampla")%>"/>
<%conex.close();%>
        </form>
    </body>
</html>
