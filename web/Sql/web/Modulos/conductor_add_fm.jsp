<%@include file="conexion.jsp" %>

<%-- 
    Document   : conductor_add_fm
    Created on : 16/12/2011, 12:13:46 PM
    Author     : Josmarl
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
consulta="select*from cliente where estado='1' order by idcliente asc ;";
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
        
        <form action="conductor_save.jsp"  method="post">
            <table id="rounded-corner" align="center">
                <tr>
                    <th class="rounded-company" colspan="1"></th>
                    <th style="padding: 7px" class="rounded-q4" colspan="3">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        REGISTRO DE CONDUCTORES
                    </th>
                </tr>
            <tr>
                
                <td align="right" width="100"> Razon Social :</td>
                <td>

                    <select name="idCliente">
                       
                        <%while(rs.next()){%>
                        <option label="<%=rs.getString("razonSocial")%>" value="<%=rs.getString("idCliente")%>">
                            <%=rs.getString("razonSocial")%>
                        </option>
                        <%}%>
                    </select>
                </td>
                <td align="right"> DNI :</td>
                <td><input type="number" name="dniconductor" value="" size="40" required/></td>
                
            </tr>
            <tr>
                <td align="right"> Licencia :</td>
                <td><input type="text" name="licenciaconductor" value="" size="40" required/></td>
                <td align="right"> Nombres :</td>
                <td><input type="text" name="nombreconductor" value="" size="50" required onChange="javascript:this.value=this.value.toUpperCase();"/></td>
                
            </tr>
            <tr>
                <td align="right"> Apellido Paterno :</td>
                <td><input type="text" name="apellidoPconductor" value="" size="40" onChange="javascript:this.value=this.value.toUpperCase();" /></td>
                <td align="right"> Apellido Materno</td>
                <td><input type="text" name="apellidoMconductor" value="" size="40" onChange="javascript:this.value=this.value.toUpperCase();"/></td>
                
            </tr>
            <tr>
                <td align="right"> Ciudad :</td>
                <td><input type="text" name="ciudadconductor" value="" size="40" onChange="javascript:this.value=this.value.toUpperCase();" /></td>
                <td align="right"> Pais :</td>
                <td><input type="text" name="paisconductor" value="" size="40" onChange="javascript:this.value=this.value.toUpperCase();"/></td>
                
            </tr>
            <tr>
                <td  align="right" colspan="1"> Estado :</td>
                <td colspan="3">
                    <label class="rad">Activo</label>
                    <input type="radio" name="estado" value="1" required checked/>
                    <label class="rad">Inactivo</label>
                    <input type="radio" name="estado" value="0" required/>
                </td>
                
            </tr>
            <tr>
                <th colspan="3" class="rounded-foot-left"></th>
                        <th><button type="submit" title="Guardar"><img alt="" src="../imagenes/icons/listo.png" height="50" width="50"/></button></th>
            </tr>
        </table>
                    <input type="hidden" name="accion" value="guardar">
        </form>
             <br>
            <%conex.close();%>
    </body>
</html>
