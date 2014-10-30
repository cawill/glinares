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
<%
consulta="SELECT ruc, razonsocial, direccion FROM proveedor WHERE ruc=?; ";
ps=conex.prepareStatement(consulta);
ps.setString(1, request.getParameter("ruc"));
rs=ps.executeQuery();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
        <link  rel="stylesheet" href="../css/ultimate.css" type="text/css" media="all">
        <script src="../Js/datapicker/jquery.tools.min.js"></script>
        <script>
            $( function () {
                if( !navigator.userAgent.match( /(iPhone|iPod|iPad)/i ) ) {
                    $("#fechacomp").dateinput( { format: 'yyyy-mm-dd' } );
                    $("#form1").validator();
                }
            } );
        </script>
        <link rel="stylesheet" type="text/css" href="../Js/datapicker/skin1.css" />
    </head>
    
    <body>
   <br/>    
   <br/>
        <center>
        <form action="gasto_save.jsp"  method="post" name="form1" id="form1">
            <table id="rounded-corner-list_1" align="center">
                <tr>
                    <th class="rounded-company" colspan="1"></th>
                    <th style="padding: 7px" class="rounded-q4" colspan="3">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        REGISTRO DE GASTOS                    </th>
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
                <%if(rs.next()){%>
              <td align="right"><p>Ruc :</p>
              <p>Razon Social :</p></td>
              <td><p>
                <input name="ruc" type="text" value="<%=rs.getString("ruc")%>" size="20" maxlength="11" />
              </p>
              <p>
                <input name="razonsocial" type="text" value="<%=rs.getString("razonsocial")%>" size="70" maxlength="100" placeholder="Complete Razon Social..." required disabled="disabled"/>
</p></td>
              <td align="right"><p>&nbsp;</p>
              <p>Direccion:</p></td>
              <td><p>&nbsp;
                </p>
                <p>
                  <input name="direccion" type="text" value="<%=rs.getString("direccion")%>" size="40" maxlength="11" disabled="disabled"/>
                </p></td>
              <%}%>
            </tr>
            <tr>
                
                <td align="right">N&ordm; Comprobante: </td>
                <td><p>SERIE - N&ordm;</p>
                  <p>
                    <input name="nrocompro" type="text" value="" size="40" maxlength="12" placeholder="Complete Nro Comprobante..." required/>
                  </p></td>
                <td align="right"><p>&nbsp;</p>
                  <p><br>
			        <br>
                  </p></td>
                <td><p>&nbsp;</p>
                  <p><br>
                    <br>
                  </p></td>
            </tr>
            
            <tr>
                <td align="right">Fecha Compra :</td>
                <td><input type="text" name="fechacomp"  id="fechacomp" value="" size="40" /></td>
                <td align="right">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td align="right"> Cantidad :</td>
                <td><input name="cantidad" type="text" value="0" size="40" maxlength="10" /></td>
                <td align="right"> Descripcion :</td>
                <td><textarea name="descrip" cols="60" rows="3" maxlength="198"></textarea></td>
            </tr>
            <tr>
                <td align="right"> Total :</td>
                <td><input name="total" type="text" value="0" size="40" maxlength="10" /></td>
				<td align="right">&nbsp;</td>
	            <td>&nbsp;</td>
            </tr>
            <tr>
                <th colspan="1" class="rounded-foot-left"></th>
                <th colspan="3" align="right" class="rounded-foot-right"><button type="submit" value="Guardar" ><img alt="" src="../imagenes/icons/listo.png" height="50" width="50"/></button></th>
            </tr>
        </table>
                    <input type="hidden" name="accion" value="guardar">
        </form>
            </center>
             <br>
            <%conex.close();%>
    </body>
</html>
