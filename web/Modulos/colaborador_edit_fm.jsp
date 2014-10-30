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
consulta="select co.idcolab, cl.razonsocial,co.nombreape,co.telf,co.cell,co.cell2,"
        + "co.nextel,co.anexo, co.email, co.email2,co.idCliente  "
        + "from colaborador co "
        + "inner join cliente cl on cl.idCliente=co.idCliente where co.idcolab=?; ";
ps=conex.prepareStatement(consulta);
ps.setString(1, request.getParameter("idcolab"));
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
        <h1 align="center">Edicion de Colaboradores</h1>
        <br>
        <div align="center">
        <form action="colaborador_save.jsp" method="post">
            <table id="rounded-corner-list_1" align="center" >
                <tr>
                    <th class="rounded-company" colspan="1" ></th>
                    <th  style="padding: 7px" colspan="1" class="rounded-q4">FORMULARIO DE PERSONALES</th>
                </tr>
                <%if(rs.next()){%>
				<tr>
                                    <td align="right" width="150"> Razon Social :</td>
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
            <tr>
                <td align="right"> Nombres y Apellidos :</td>
                <td><input type="text" name="nombreape" value="<%=rs.getString("nombreape")%>" size="70" /></td>
            </tr>
            <tr>
                <td align="right"> Telefono :</td>
                <td><input type="text" name="telf" value="<%=rs.getString("telf")%>" /></td>
            </tr>
            <tr>
                <td align="right"> Celular :</td>
                <td><input type="text" name="cell" value="<%=rs.getString("cell")%>" /></td>
            </tr>
            <tr>
                <td align="right"> Celular :</td>
                <td><input type="text" name="cell2" value="<%=rs.getString("cell2")%>" /></td>
            </tr>
            <tr>
                <td align="right"> Nextel :</td>
                <td><input type="text" name="nextel" value="<%=rs.getString("nextel")%>" /></td>
            </tr>
            <tr>
                <td align="right"> Anexo :</td>
                <td><input type="text" name="anexo" value="<%=rs.getString("anexo")%>" /></td>
            </tr>
            <tr>
                <td align="right"> E-mail :</td>
                <td><input type="text" name="email" value="<%=rs.getString("email")%>" size="60"/></td>
            </tr>
            <tr>
                <td align="right"> E-mail :</td>
                <td><input type="text" name="email2" value="<%=rs.getString("email2")%>" size="60" /></td>
            </tr>
            
            <%}%>
            <tr>
                <th class="rounded-foot-left" colspan="1"></th>
                <th class="rounded-foot-right" colspan="1"><input type="submit" value="Guardar" /></th>
            </tr>
        </table>
            </div>
            <input type="hidden" name="accion" value="actualizar"/>
            <input type="hidden" name="idcolab" value="<%=rs.getString("idcolab")%>"/>
   <%conex.close();%>
        </form>
    </body>
</html>
