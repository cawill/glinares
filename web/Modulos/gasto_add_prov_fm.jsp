<%@page import="utils.FechaSistema"%>
<%@include file="conexion.jsp" %>

<%-- 
    Document   : conductor_add_fm
    Created on : 16/12/2011, 12:13:46 PM
    Author     : Josmarl
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%--
consulta="select*from gastos where estado='1';";
ps=conex.prepareStatement(consulta);
rs=ps.executeQuery();
--%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
        <link  rel="stylesheet" href="../css/ultimate.css" type="text/css" media="all">
        
    </head>
    <body alink="center">
        
    
        
        <form action="gasto_save_prov.jsp"  method="post" name="form1" id="form1">
            <table id="rounded-corner-list_1" align="center">
                <tr>
                    <th class="rounded-company" colspan="1"></th>
                    <th class="rounded-q4" style="padding: 7px" colspan="1">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         FORMULARIO DE PROVEEDORES     
                    </th>
                    
                </tr>
            <%-- <tr>
                
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
                <td align="right"> NOMBRE Y APELLIDO :</td>
                <td><input type="text" name="nombreape" value="" size="40" /></td>
                
            </tr> 
            --%>
            <tr>
                <td align="right">Ruc :</td>
                <td><input name="ruc" type="text" value="" size="20" maxlength="11" placeholder="Ruc..." required/></td>
            </tr>
            <tr>
                <td align="right">Razon Social :</td>  
                <td><input name="razonsocial" type="text" size="50" maxlength="100" placeholder="Complete Razon Social..." required onChange="javascript:this.value=this.value.toUpperCase();" /></td>
            </tr>
            <tr>
                <td align="right">Direccion :</td>  
                <td><input name="direccion" type="text" value="" size="70" maxlength="80" onChange="javascript:this.value=this.value.toUpperCase();"/></td>
            </tr>
            <tr>
                <th colspan="1" class="rounded-foot-left"></th>
                <th colspan="3" align="right" class="rounded-foot-right"><button type="submit" value="Guardar"> <img alt="" src="../imagenes/icons/listo.png" height="50" width="50"/></button></th>
            </tr>
        </table>
                    <input type="hidden" name="accion" value="guardar">
        </form>
             <br>
            <%conex.close();%>
    </body>
</html>
