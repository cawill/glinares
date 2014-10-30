<%@include file="conexion.jsp" %>
<%-- 
    Document   : tracto_add_fm
    Created on : 19/12/2011, 12:40:37 PM
    Author     : Josmarl
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
consulta="select*from cliente where estado='1' order by idcliente desc;";
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
        <br>
        <div align="center">
        
        
        <form action="tracto_save.jsp" method="post">
            <table id="rounded-corner-list_2">
                <tr>
                    <th width="86" colspan="1" class="rounded-company"></th>
                    <th  align="center" style="padding: 7px" class="rounded-q4" colspan="3">
                        REGISTRO DE TRACTOS                    
                    </th>
                </tr>
                <tr>
                  <td align="right">Razon Social :</td>
                  <td width="339"><select name="idCliente">
                    <% while(rs.next()){ %>
                    <option label="<%=rs.getString("razonSocial")%>" value="<%=rs.getString("idCliente")%>"> <%=rs.getString("razonSocial")%> </option>
                    <%}%>
                  </select></td>
                  <td width="76" align="right">Estado :</td>
                 		 <td width="279"><label class="rad">Activo</label>
                        <input type="radio" name="estado" value="1" required checked/>
                        <label class="rad">Inactivo</label>
                  <input type="radio" name="estado" value="0" required/> </td>
                </tr>
                <tr>
                    <td align="right">Placa :</td>
                    <td><input name="placa" type="text" maxlength="10"   required/></td>
                    <td align="right">Marca :</td>
                    <td><input name="marca" type="text" maxlength="20"  /></td>
                </tr>
                <tr>
                    <td align="right">Ejes :</td>
                    <td><input name="ejes" type="text" maxlength="10"   /></td>
                    <td align="right">Modelo :</td>
                    <td><input name="modelo" type="text" maxlength="15"  /></td>
                </tr>
                <tr>
                    <td align="right">Capacidad :</td>
                    <td><input name="capacidad" type="text" maxlength="15" /></td>
                    <td align="right">Año :</td>
                    <td><input name="anio" type="text" maxlength="5"  /></td>
                </tr>
                <tr>
                    <td align="right">Nro Constancia:</td>
                    <td><input name="nroConstancia" type="text" maxlength="15"  /></td>
                    <td align="right">Configuracion :</td>
                    <td><input name="configuracion" type="text" maxlength="15"  /></td>
                </tr>
                <tr>
                    <td align="right">Color :</td>
                    <td><input name="color" type="text" maxlength="10" /></td>
                    <td align="right">Chasis :</td>
                    <td><input name="chasis" type="text" maxlength="15"  /></td>
                </tr>
                
                <tr>
                    <th class="rounded-foot-left" colspan="3"></th>
                    <th class="rounded-foot-right" colspan="1">
                            <button type="submit" title="Guardar"><img alt="" src="../imagenes/icons/listo.png" height="50" width="50"/></button>
                     </th>
                </tr>
            </table>
                        <input type="hidden" name="accion" value="guardar" />
                        <%conex.close();%>
        </form>
                        </div>
    </body>
</html>
