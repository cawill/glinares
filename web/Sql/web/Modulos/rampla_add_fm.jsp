<%@include file="conexion.jsp" %>

<%-- 
    Document   : rampla_add_fm
    Created on : 19/12/2011, 12:15:31 AM
    Author     : Josmarl
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%
            consulta = "select*from cliente where estado='1' order by idcliente asc";
            ps = conex.prepareStatement(consulta);
            rs = ps.executeQuery();
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
         <link  rel="stylesheet" href="../css/ultimate.css" type="text/css" media="all">
    </head>
    <body>


        
        &nbsp;
        <form action="rampla_save.jsp" method="post">
            <div align="center">
            <table id="rounded-corner-list_2" align="center">
                <tr>
                    <th width="80" colspan="1"  class="rounded-company"></th>
                    <th colspan="2" align="right">
                        REGISTRO DE RAMPLAS
                    </th>
                    <th width="282" colspan="1" class="rounded-q4"></th>
                </tr>
				<tr>
                    <td align="right">Razon Social :</td>
                    <td width="344">
                        <select name="idCliente">
                            <% while (rs.next()) {%>
                            <option label="<%=rs.getString("razonSocial")%>" value="<%=rs.getString("idCliente")%>">
                                <%=rs.getString("razonSocial")%>
                            </option>
                            <% }%>
                        </select>
                  </td>
                    <td width="74"></td>
                    <td></td>
                    
                </tr>
				<tr>
                    <td align="right">Placa :</td>
                    <td><input name="placa" type="text" value="" size="30" maxlength="10" required/></td>
                     <td align="right">Nro. Constancia :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                     <td><input name="nroConstancia" type="text" value="" size="30" maxlength="20" /></td>
                   
                </tr>
                <tr>
                    <td align="right">Tipo :</td>
                    <td><input name="tipo" type="text" value="..." size="30" maxlength="30" /></td>
                    <td align="right">Ejes :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td><input name="ejes" type="text" value="" size="10" maxlength="10" /></td>
                </tr>
                
                <tr>
                    <td align="right">Configuracion :</td>
                    <td><input name="configuracion" type="text" value="" size="30" maxlength="30" /></td>
                    <td align="right">Clase :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td><input name="clase" type="text" value="" size="30" maxlength="10" /></td>
                </tr>

                <tr>
                    <td align="right">Descripcion :</td>
                    <td><input name="descripcion" type="text" value="" size="50" maxlength="30" /></td>
                     <td align="right">Estado:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                     <td>
                         <label class="rad">Activo</label>
                         <input type="radio" name="estado" value="1"  checked/>
                         <label class="rad">Inactivo</label>
                         <input type="radio" name="estado" value="0" />
                     </td>
                </tr>

                
               
                <tr>
                    <th class="rounded-foot-left" colspan="3"></th>
                    <th class="rounded-foot-right" colspan="1"><button type="submit" title="Guardar"><img alt="" src="../imagenes/icons/listo.png" height="50" width="50"/></button></th>

                </tr>          
            </table>
                        </div>
            <input type="hidden" name="accion" value="guardar"/>
            <%conex.close();%>
        </form>

    </body>
</html>
