<%@include file="conexion.jsp" %>
<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%-- 
    Document   : transportista_edit_fm
    Created on : 14/12/2011, 11:43:22 PM
    Author     : Josmarl
--%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
consulta="select idCliente,ruc,razonSocial,codigocli,pais,departamento,estado,tipo from cliente where idCliente=?;";
ps=conex.prepareStatement(consulta);
ps.setString(1, request.getParameter("idCliente"));
rs=ps.executeQuery();
%>
<%
consulta="select*from detalleCliente where idCliente=?";
PreparedStatement psd=conex.prepareStatement(consulta);
psd.setString(1, request.getParameter("idCliente"));
ResultSet rsd=psd.executeQuery();
%>
<%
String estado=request.getParameter("estado")== null ? "":request.getParameter("estado");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>JSP Page</title>
      <link  rel="stylesheet" href="../css/ultimate.css" type="text/css" media="all">
    </head>
    <body>
        <h1 align="center">EDICION DE CLIENTES</h1>
        <br>
        <form action="cliente_save.jsp" method="post">
            <div align="center">
            <table id="rounded-corner-list_1" align="center">
                <tr>
                    <th class="rounded-company">&nbsp;</th>
                    <th class="rounded-q4" style="padding: 7px"></th>
                </tr>
                <%if(rs.next()){%>
                <tr>
                    <td align="right" width="150">RUC :</td>
                    <td><input type="text" name="ruc" value="<%=rs.getString("ruc")%>"/></td>
                </tr>
            
            <tbody>
                <tr>
                    <td align="right" >Razon Social:</td>
                  <td><input type="text" name="razonSocial" size="70" maxlength="70" required value="<%=rs.getString("razonSocial")%>"></td>
                </tr>
                <tr>
                    <td align="right" >Pais :</td>
                    <td><input name="pais" type="text" value="<%=rs.getString("pais")%>" size="30" maxlength="20"/></td>
                </tr>
                <tr>
                    <td align="right" >Departamento :</td>
                    <td><input name="departamento" type="text" value="<%=rs.getString("departamento")%>" size="30" maxlength="30"/></td>
                </tr>
                <%if(rsd.next()){%>
				<tr>
                        <td align="right" >Direccion :</td>
                        <td><input type="text" name="direccion" size="62" maxlength="65" value="<%=rsd.getString("direccion")%>"/></td>
                 </tr>
                 <tr>
                    <td align="right" >Codigo:</td>
                    <td><input name="codigocli" type="text" value="<%=rs.getString("codigocli")%>" size="10" maxlength="10"/></td>
                </tr>
                 <tr>
                    <td align="right" >Teléfono :</td>
                    <td><input name="telefono" type="text" value="<%=rsd.getString("telefono")%>" size="20" maxlength="15"/></td>
                </tr>
                 <tr>
                    <td align="right" >Email :</td>
                    <td><input type="email" name="email" value="<%=rsd.getString("email")%>" size="50" maxlength="50"/></td>
                </tr>
                 <tr>
                    <td align="right" >Descripcion :</td>
                    <td>
                        <textarea name="descrip" cols="40" rows="2" maxlength="70"><%=rsd.getString("descrip")%></textarea>                    </td>
                </tr>
                <%}%>
                <tr>
                        <td align="right" >Estado</td>
                        <td>
                            <label class="rad">Activo</label>
                            <input  type="radio" value="1" name="estado" required checked />
                            <label class="rad">Inactivo</label>
                            <input  type="radio" value="0" name="estado" required/>                        </td>
                    </tr>
                <tr>
                    <td align="right" >Tipo :</td>
                    <td><input name="tipo" type="text" value="<%=rs.getString("tipo")%>" size="50" maxlength="50"/></td>
                </tr>          
                <tr>
                    <th class="rounded-foot-left"></th>
                    <th><button type="submit" title="Actualizar"><img alt="" src="../imagenes/icons/listo.png" height="50" width="50"/></button></th>
                </tr>

                <%}%>
            </tbody>
        </table>
            </div>
            <input type="hidden" name="accion" value="actualizar"/>
            <input  type="hidden" name="idCliente"value="<%=rs.getString("idCliente")%>"/>
        </form>
        <%conex.close();%>
    </body>
</html>
