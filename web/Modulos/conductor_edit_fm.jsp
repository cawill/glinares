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
consulta="select c.estado,c.idConductor,c.dniconductor,c.licenciaconductor,c.nombreconductor,c.apellidopconductor," +
        "c.apellidomconductor,c.ciudadconductor,c.paisconductor,c.idCliente,t.razonSocial " +
        "from conductor c inner join cliente t " +
        "on c.idCliente=t.idCliente where idconductor=?;";
ps=conex.prepareStatement(consulta);
ps.setString(1, request.getParameter("idConductor"));
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
        <h1 align="center">Edicion de Conductores</h1>
        <br>
        <div align="center">
        <form action="conductor_save.jsp" method="post">
            <table id="rounded-corner-list_1" align="center" width="300">
                <tr>
                    <th class="rounded-company" colspan="1" ></th>
                    <th  style="padding: 7px" colspan="1" class="rounded-q4">FORMULARIO DE CONDUCTORES</th>
                </tr>
                <%if(rs.next()){%>
                <tr>
                  <td align="right">Razon Social :</td>
                  <td><select name="idCliente">
                    <option label="<%=rs.getString("razonSocial")%>" value="<%=rs.getString("idCliente")%>"> <%=rs.getString("razonSocial")%> </option>
                    <%while(rst.next()){%>
                    <option  label="<%=rst.getString("razonSocial")%>" value="<%=rst.getString("idCliente")%>"> <%=rst.getString("razonSocial")%> </option>
                    <%}%>
                  </select></td>
                </tr>
              <tr>
                <td align="right"> DNI :</td>
                <td><input type="text" name="dniconductor" value="<%=rs.getString("dniconductor")%>" /></td>
            </tr>
            <tr>
                <td align="right"> Licencia :</td>
                <td><input type="text" name="licenciaconductor" value="<%=rs.getString("licenciaconductor")%>" /></td>
            </tr>
            <tr>
                <td align="right"> Nombres :</td>
                <td><input type="text" name="nombreconductor" value="<%=rs.getString("nombreconductor")%>" /></td>
            </tr>
            <tr>
                <td align="right"> Apellido Paterno :</td>
                <td><input type="text" name="apellidoPconductor" value="<%=rs.getString("apellidopconductor")%>" /></td>
            </tr>
            <tr>
                <td align="right"> Apellido Materno</td>
                <td><input type="text" name="apellidoMconductor" value="<%=rs.getString("apellidomconductor")%>" /></td>
            </tr>
            <tr>
                <td align="right"> Ciudad :</td>
                <td><input type="text" name="ciudadconductor" value="<%=rs.getString("ciudadconductor")%>" /></td>
            </tr>
            <tr>
                <td align="right"> Pais :</td>
                <td><input type="text" name="paisconductor" value="<%=rs.getString("paisconductor")%>" /></td>
            </tr>
            <tr>
                <td align="right"> Estado:</td>
                <td><input type="text" name="estado" value="<%=rs.getString("estado")%>" /></td>
            </tr>
            
            <%}%>
            <tr>
                        <th></th>
                <th class="rounded-foot-right" colspan="1"><button type="submit" title="Guardar"><img alt="" src="../imagenes/icons/listo.png" height="50" width="50"/></button></th>
            </tr>
        </table>
            </div>
            <input type="hidden" name="accion" value="actualizar"/>
            <input type="hidden" name="idConductor" value="<%=rs.getString("idConductor")%>"/>
   <%conex.close();%>
        </form>
    </body>
</html>
