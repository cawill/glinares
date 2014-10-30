<%@include file="conexion.jsp" %>

<%-- 
    Document   : detalleTransportista_add_fm
    Created on : 15/12/2011, 01:21:29 AM
    Author     : Josmarl
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
consulta="select*from cliente where estado='1'";
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
        
        <br>
        <form action="detalleCliente_save.jsp" method="post" >
            <div align="center">
                <table id="rounded-corner-list">
                <tr>
                    <th class="rounded-company" colspan="1"></th>
                    <th class="rounded-q4" colspan="1" style="padding: 7px">
                        &nbsp;&nbsp;
                        FORMULARIO D. CLIENTES
                    </th>
                </tr>
                <tr>
                    <td align="right">Direccion :</td>
                    <td><input type="text" name="direccion" size="50"/></td>
                </tr>
                <tr>
                    <td align="right">Telefono :</td>
                    <td><input type="text" name="telefono"/></td>
                </tr>
                <tr>
                    <td align="right">Email :</td>
                    <td><input type="email" name="email" size="50" /></td>
                </tr>
                <tr>
                    <td align="right">Decripcion :</td>
                    <td><input type="text" name="descrip" size="50"/></td>
                </tr>

                <tr>
                    <td align="right">Razon Social :</td>
                    <td><select name="idCliente">
                            <% while(rs.next()){%>
                            <option label="<%=rs.getString("razonSocial")%>" value="<%=rs.getString("idCliente")%>">
                                <%=rs.getString("razonSocial")%>
                            </option>
                            <%}%>
                        </select></td>
                </tr>
                <tr>
                    <th class="rounded-foot-left" colspan="1"></th>
                    <th class="rounded-foot-right" colspan="1" align="right"><input type="submit"  value="Guardar"/></th>
                </tr>
            </table>
            <input type="hidden" name="accion" value="guardar"/>
        </form>
         </div>
         <%conex.close();%>
    </body>
</html>
