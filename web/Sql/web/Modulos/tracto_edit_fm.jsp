<%@include file="conexion.jsp" %>

<%-- 
    Document   : tracto_edit_fm
    Created on : 19/12/2011, 12:40:47 PM
    Author     : Josmarl
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
consulta="select tr.idTracto,tr.placa,tr.marca,tr.ejes,tr.modelo," +
        "tr.capacidad,tr.anio,tr.nroConstancia,tr.configuracion,tr.color," +
        "tr.chasis,tr.estado,tr.idCliente," +
        "t.razonSocial from tracto tr inner join cliente t " +
        "on tr.idCliente=t.idCliente where tr.idTracto=?;";
ps=conex.prepareStatement(consulta);
ps.setString(1, request.getParameter("idTracto"));
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
        <div align="center">
        <h1>Edicion de Tractos</h1>
        <br>
        <form action="tracto_save.jsp" method="post">
            <table id="rounded-corner-list_2">
                <thead>
                    <tr>
                        <th class="rounded-company" colspan="1">
                            
                        </th>
                        <th align="center"  style="padding: 7px" colspan="3" class="rounded-q4">
                            FORMULARIO DE TRACTOS
                        </th>
                    </tr>
                <% if(rs.next()){ %>
                <tr>
                    <td align="right">Placa :</td>
                    <td><input type="text" name="placa" value="<%=rs.getString("placa")%>" /></td>
                    <td align="right">Marca :</td>
                    <td><input type="text" name="marca" value="<%=rs.getString("marca")%>" /></td>
                </tr>
                <tr>
                    <td align="right">Ejes :</td>
                    <td><input type="text" name="ejes" value="<%=rs.getString("ejes")%>" /></td>
                    <td align="right">Modelo :</td>
                    <td><input type="text" name="modelo"  value="<%=rs.getString("modelo")%>"/></td>
                </tr>
                <tr>
                    <td align="right">Capacidad :</td>
                    <td><input type="text" name="capacidad" value="<%=rs.getString("capacidad")%>"/></td>
                    <td align="right">Año :</td>
                    <td><input type="text" name="anio" value="<%=rs.getString("anio")%>"/></td>
                </tr>
                <tr>
                    <td align="right">Nro :</td>
                    <td><input type="text" name="nroConstancia" value="<%=rs.getString("nroConstancia")%>"/></td>
                    <td align="right">Configuracion :</td>
                    <td><input type="text" name="configuracion"  value="<%=rs.getString("configuracion")%>"/></td>
                </tr>
                <tr>
                    <td align="right">Color :</td>
                    <td><input type="text" name="color" value="<%=rs.getString("color")%>"/></td>
                    <td align="right">Chasis :</td>
                    <td><input type="text" name="chasis" value="<%=rs.getString("chasis")%>"/></td>
                </tr>
                <tr>
                    <td align="right">Estado :</td>
                    <td><input type="text" name="estado" value="<%=rs.getString("estado")%>" /></td>
                    <td align="right">Razon Social :</td>
                    <td>
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
                <%}%>
                <tr>
                    <th colspan="3" class="rounded-foot-left"></th>
                        <th><button type="submit" title="Guardar"><img alt="" src="../imagenes/icons/listo.png" height="50" width="50"/></button></th>
                </tr>
</thead>
            </table>
            <input type="hidden" name="accion" value="actualizar"/>
            <input type="hidden" name="idTracto" value="<%=rs.getString("idTracto")%>"/>
       <%conex.close();%>
        </form>
        </div>
    </body>
</html>
