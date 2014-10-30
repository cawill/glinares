<%@include file="conexion.jsp" %>
<%-- 
    Document   : mic_list
    Created on : 16/01/2012, 10:28:00 AM
    Author     : Josmarl
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%

    consulta = "select*from mic";
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
        <div align="center">
            <h3>REPORTE Y ADMINISTRACION DE MICs</h3>
            <br>
            <a href="mic_add_fm.jsp" title="Nuevo">
                <img alt="" src="../imagenes/icons/Office.png" height="55" width="55"/>
            </a>
            <br>
        </div>
        <br>
        <div align="center">
            <form name="formBus" action="mic_list_search.jsp" method="get">
                <table id="rounded-corner">
                    <tr id="rounded-buscar">
                        <th class="rounded-company" colspan="2"></th>
                        <th class="rounded-q4" colspan="2"></th>
                    </tr>
                    <tr>
                        <th width="100">Buscar por :</th>
                        <th width="100">
                            <select name="opcionBusqueda">
                                <option value="1">Fecha de Emision</option>
                            </select>
                        </th>
                        <th width="45"><input type="text" name="textoDeBusqueda" size="40"/></th>
                        <th><button type="submit" title="Buscar"><img alt="" src="../imagenes/icons/buscar.png" height="30" width="30"/></button></th>
                    </tr>
                    <tr id="rounded-buscar">
                        <th class="rounded-foot-left" colspan="2"></th>
                        <th class="rounded-foot-right" colspan="2"></th>
                    </tr>
                </table>
            </form>
            <br><br>
            <table align="center" id="rounded-corner">
                <tr>
                    <th colspan="3" class="rounded-company"></th>
                    <th colspan="3" align="center">
                        LISTA DE MICS
                    </th>
                    <th colspan="4" class="rounded-q4"></th>
                </tr>
                <tr>
                    <th>Id</th>
                    <th>Razon Social Camion Original</th>
                    <th>Direccion</th>
                    <th>Cod. Aduana</th>
                    <th>Rol</th>
                    <th>Fecha Emision.</th>
                    <th>Aduana-Ciudad-P</th>
                    <th>Aduana-Ciudad-D</th>
                    <th>Estado</th>
                    <th>Opciones</th>
                </tr>
                <%while (rs.next()) {%>
                <tr>
                    <td><%=rs.getString("idmic")%></td>
                    <td>
                        <%
                            consulta = "select razonSocial from cliente where idCliente=?";
                            PreparedStatement psc = conex.prepareStatement(consulta);
                            psc.setString(1, rs.getString("idCliente"));
                            ResultSet rsc = psc.executeQuery();
                            while (rsc.next()) {
                                out.print(rsc.getString("razonSocial"));
                            }
                        %>
                    </td>
                    <td>
                        <%
                            consulta = "select direccion from detalleCliente where idCliente=? ";
                            PreparedStatement psd = conex.prepareStatement(consulta);
                            psd.setString(1, rs.getString("idCliente"));
                            ResultSet rsd = psd.executeQuery();
                            while (rsd.next()) {
                                out.print(rsd.getString("direccion"));
                            }
                        %>
                    </td>
                    <td><%=rs.getString("uno_codigoaduana")%></td>
                    <td><%=rs.getString("die_rolcontribuyente")%></td>
                    <td><%=rs.getString("seis_fechaemision")%></td>
                    <td><%=rs.getString("siet_aduanaciudad")%></td>
                    <td><%=rs.getString("ocho_destino")%></td>
                    <td align="center">
                        <%
                            if (rs.getString("estado").equals("ACTIVO")) {
                        %>
                        <a href="mic_save_opc.jsp?accion=anular&idMic=<%=rs.getString("idMic")%>" title="Anular">
                            <img alt='' src='../imagenes/icons/tick.png'>
                        </a>
                        <%
                        } else {
                        %>
                        <a href="mic_save_opc.jsp?accion=activar&idMic=<%=rs.getString("idMic")%>" title="Activar">
                            <img alt='' src='../imagenes/icons/publish_x.png'>
                        </a>
                        <%
                            }
                        %>
                    </td>

                    <td align="center" width="80">
                        <a href="mic_edit_fm.jsp?idMic=<%=rs.getString("idMic")%>" title="Editar">
                            <img alt="" src="../imagenes/icons/edit_f2.png" height="16" width="16"/>
                        </a>&nbsp;
                        <a target="../" href="reportes/reporte_mic.jsp?repmic=<%=rs.getString("idmic")%> " 
                           title="Imprimir" onclick="return confirm('Imprimir')"> <img alt="" src="../imagenes/icons/print.gif"/>
                        </a>&nbsp;
                        <a href="mic_save.jsp?accion=eliminar&idmic=<%=rs.getString("idmic")%>" title="Eliminar" onclick="return confirm('¿Esta seguro de ELIMINAR?') ">
                            <img alt="" src="../imagenes/icons/trash.png" height="16" width="16"/>
                        </a>

                    </td>
                </tr>
                <%}
                    conex.close();%>
            </table>
        </div>
    </body>
</html>
