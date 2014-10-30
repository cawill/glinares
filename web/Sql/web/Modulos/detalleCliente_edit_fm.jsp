
<%@include file="conexion.jsp" %>

<%-- 
    Document   : detalleTransportista_edit_fm
    Created on : 15/12/2011, 01:51:09 AM
    Author     : Josmarl
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
consulta="SELECT d.idDetalleCliente,d.direccion,d.telefono,d.email," +
        "d.descrip,d.idCliente,t.razonSocial " +
        "FROM detalleCliente d INNER JOIN cliente t " +
        "ON d.idCliente=t.idCliente WHERE d.idDetalleCliente=?;";
ps=conex.prepareStatement(consulta);
ps.setString(1, request.getParameter("idDetalleCliente"));
rs=ps.executeQuery();
%>
<%
consulta="select razonSocial,idCliente from cliente where estado='1';";
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
        <h1>Edicion de Detalle de Clientes</h1>
        <br>
        <form action="detalleCliente_save.jsp" method="post">
            <div align="center">
                <table id="rounded-corner-list">
                <tr>
                    <th class="rounded-company" colspan="1"></th>
                    <th  class="rounded-q4" style="padding: 7px" colspan="1">
                        &nbsp;
                        FORMULARIO D. CLIENTES
                    </th>
                </tr>
                <%if(rs.next()){%>
                <tr>
                    <td align="right">Direccion :</td>
                    <td><input type="text" name="direccion" value="<%=rs.getString("direccion")%>"/></td>
                </tr>
                <tr>
                    <td align="right">Telefono :</td>
                    <td><input type="text" name="telefono" value="<%=rs.getString("telefono")%>"/></td>
                </tr>
                <tr>
                    <td align="right">Email :</td>
                    <td><input type="text" name="email" value="<%=rs.getString("email")%>"/></td>
                </tr>
                <tr>
                    <td align="right">Descripcion :</td>
                    <td><input type="text" name="descrip" value="<%=rs.getString("descrip")%>"/></td>
                </tr>

                <tr>
                    <td align="right">Razon Social</td>
                    <td>
                        <select name="idCliente">
                            
                            <option label="<%=rs.getString("razonSocial")%>"value="<%=rs.getString("idCliente")%>">
                                <%=rs.getString("razonSocial")%>
                            </option>
                            <%while(rst.next()){%>
                            <option  label="<%=rst.getString("razonSocial")%>"value="<%=rst.getString("idCliente")%>">
                            <%=rst.getString("razonSocial")%>
                            </option>
                          <%}%>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th class="rounded-foot-left" colspan="1"></th>
                    <th align="right" class="rounded-foot-right" colspan="1">
                        <input type="submit" name="Actualizar" value="Actualizar"/>
                    </th>
                </tr>
                <%}%>
                
            </table>
            </div>
            <input type="hidden" name="accion" value="actualizar"/>
            <input type="hidden" name="idDetalleCliente" value="<%=rs.getString("idDetalleCliente")%>"/>
        <%conex.close();%>
        </form>
        </div>
    </body>
</html>
