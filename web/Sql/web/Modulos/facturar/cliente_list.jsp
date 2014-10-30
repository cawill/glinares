<%-- 
    Document   : transportista_list
    Created on : 14/12/2011, 11:33:51 PM
    Author     : Josmarl
--%>
<%@include file="../conexion.jsp" %>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%
    consulta = "select * from cliente where ruc <> '---' order by 2";
    ps = conex.prepareStatement(consulta);
    rs = ps.executeQuery();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
        <script type="text/javascript" src="../Js/jquery.js" ></script>
        <%-- <link  rel="stylesheet" href="../../css/ultimate.css" type="text/css" media="all"> --%>
        <link href="recursos/css/tabla.css" media="screen" rel="stylesheet" type="text/css" />
        <script type="text/javascript">
        </script>
    </head>
    <body OnLoad="document.formBus.textoDeBusqueda.focus();">
        <div align="center">
        </div>
        <div align="center">
            <form name="formBus" action="cliente_list_search.jsp" method="get">
                <table id="rounded-corner">
                    <thead>
                    <center><th>CLIENTES</th></center>
                    </thead>
                    <tr>
                        <th width="100">Buscar por : </th>
                        <th width="100">
                            <select name="opcionBusqueda">
                                <option value="1">Razon Social</option>
                                <option value="2">Ruc</option>
                                <option value="3">Pais</option>
                                <option value="4">Tipo</option>
                            </select>                        </td>
                        <th width="45"><input type="text" name="textoDeBusqueda" size="40"/></th>
                        <th><button type="submit" title="Buscar"><img alt="" src="../../imagenes/icons/buscar.png" height="30" width="30"/></button>
                            &nbsp;&nbsp;
                            <a href="../cliente_add_fm.jsp" title="Nuevo Cliente"> <img alt="" src="../../imagenes/icons/file_add.png" height="35" width="35"/></a>&nbsp;</span></th>
                    </tr>
                </table>
            </form>
            <div id="contenedor" style="display:none" ></div>
            <table align="center" id="rounded-corner">
                <tr>
                    <th colspan="3" class="rounded-company"></th>
                    <th colspan="3">LISTA DE CLIENTES</th>
                    <th colspan="3" class="rounded-q4"></th>
                </tr>
                <tr>
                    <th width="200">Razon Social</th>
                    <th>RUC</th>
                    <th>Codigo</th>
                    <th width="60">Pais</th>
                    <th width="70">Departamento</th>
                    <th>Tipo</th>
                    <th>Estado</th>
                    <th>Opciones</th>
                </tr>
                <tbody>
                    <% while (rs.next()) {%>
                    <tr>
                        
                        <td><%=rs.getString("razonSocial")%></td>
                        <td><%=rs.getString("ruc")%></td>
                        <td><%=rs.getString("codigocli")%></td>
                        <td><%=rs.getString("pais")%></td>
                        <td><%=rs.getString("departamento")%></td>
                        <td><%=rs.getString("tipo")%></td>
                        <td align="center">
                            <%
                                if (rs.getString("estado").equals("1")) {
                            %>
                            <a href="cliente_list_opc.jsp?accion=desactivar&idCliente=<%=rs.getString("idCliente")%>" title="Desactivar Cliente">
                                <img alt="" src="../../imagenes/icons/tick.png">
                            </a>
                            <%
                            } else {
                            %>
                            <a href="cliente_list_opc.jsp?accion=activar&idCliente=<%=rs.getString("idCliente")%>" title="Activar Cliente">
                                <img alt="" src="../../imagenes/icons/publish_x.png">
                            </a>
                            <%}%>
                        </td>
                        <td><%--
                            &nbsp;<a href="cliente_save.jsp?accion=eliminar&idCliente=<%=rs.getString("idCliente")%>"onclick="return confirm('¿Estas seguro de ELIMINAR?');" title="Eliminar Cliente">
                                <img src="../../imagenes/icons/trash.png" height="18" width="18"  alt=""/>
    </a>&nbsp; --%>
                            &nbsp;<a href="cliente_edit_fm.jsp?accion=actualizar&idCliente=<%=rs.getString("idCliente")%>" title="Editar Cliente">
                                <img src="../../imagenes/icons/edit_f2.png" height="16" width="16"alt=""/>
                            </a>&nbsp;
                            <a href="factura_form.jsp?ruc=<%=rs.getString("ruc")%>" title="Facturar">
                                <img src="../../imagenes/icons/nuevo.gif" alt=""/>
                            </a>
                        </td>
                    </tr>
                    <%}conex.close();%>
                </tbody>
            </table>
        </div>
<%conex.close();%>
    </body>
</html>
