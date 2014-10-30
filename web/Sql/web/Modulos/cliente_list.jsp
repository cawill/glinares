<%@include file="conexion.jsp" %>

<%-- 
    Document   : transportista_list
    Created on : 14/12/2011, 11:33:51 PM
    Author     : Josmarl
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%
    consulta = "select * from cliente where idCliente";
    ps = conex.prepareStatement(consulta);
    rs = ps.executeQuery();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
        <script type="text/javascript" src="../Js/jquery.js" ></script>
        <link href="facturar/recursos/css/tabla.css" media="screen" rel="stylesheet" type="text/css" />
        <link href="facturar/recursos/css/layout.css" media="screen" rel="stylesheet" type="text/css" />
        <script type="text/javascript">
            nuevoTracto=function()
            {
                var d = "";
                $.ajax
                ({
                    type:"POST",
                    url:"tracto_add_fm.jsp",
                    data:d,
                    success:function(msj)
                    {
                        $('#contenedor').html(msj);
                        $('#contenedor').toggle("normal");
                    }
                });

            }

            nuevo=function()
            {
                var d = "";
                $.ajax
                ({
                    type:"POST",
                    url:"cliente_add_fm.jsp",
                    data:d,
                    success:function(msj)
                    {
                        $('#contenedor').html(msj);
                        $('#contenedor').toggle("normal");
                    }
                });

            }
            rampla=function()
            {
                var d = "";
                $.ajax
                ({
                    type:"POST",
                    url:"rampla_add_fm.jsp",
                    data:d,
                    success:function(msj)
                    {
                        $('#contenedor').html(msj);
                        $('#contenedor').toggle("normal");
                    }
                });

            }
            conductor=function()
            {
                var d = "";
                $.ajax
                ({
                    type:"POST",
                    url:"conductor_add_fm.jsp",
                    data:d,
                    success:function(msj)
                    {
                        $('#contenedor').html(msj);
                        $('#contenedor').toggle("normal");
                    }
                });

            }
        </script>

    </head>
    <body>

    <div align="center">
            <h3>REPORTE Y ADMINISTRACION DE CLIENTES</h3>

    </div>
        <br><br>
        <div align="center">
            <form name="formBus" action="cliente_list_search.jsp" method="get">
                <table id="rounded-corner">
                    <tr id="rounded-buscar">
                        <th colspan="2" class="rounded-company"></th>
                        <th colspan="2" class="rounded-q4"></th>
                    </tr>
                    <tr>
                        <th width="100">Buscar por : </th>
                        <th width="100">
                            <select name="opcionBusqueda">
                                <option value="1">RUC</option>
                                <option value="2">Razon Social</option>
                                <option value="3">Pais</option>
                                <option value="4">Tipo</option>
                            </select>                        </th>
                        <th width="45"><input type="text" name="textoDeBusqueda" size="40"/></th>
                      <th><button type="submit" title="Buscar"><img alt="" src="../imagenes/icons/buscar.png" height="30" width="30"/></button>
                        <span style="margin-top: 4px">&nbsp;
                            <a href="#" onClick="nuevo();" title="Nuevo Cliente"> <img alt="" src="../imagenes/icons/boss-icon.png" height="50" width="65"/></a>&nbsp;</span></th>
                    </tr>
                    <tr id="rounded-buscar">
                        <th colspan="2" class="rounded-foot-left"></th>
                        <th colspan="2" class="rounded-foot-right"></th>
                    </tr>
                </table>
            </form>
            <br>
            <div id="contenedor" style="display:none" ></div>
            <div id="contenedorDetalle" style="display:none" ></div>
            <br>
          
            <table align="center" id="rounded-corner">
           
               <tr>
                   <th colspan="3" class="rounded-company"></th>
                   <th colspan="3">LISTA DE CLIENTES</th>
                   <th colspan="3" class="rounded-q4"></th>
               </tr>
               <tr>

                    <th>Id</th>
                    <th>RUC</th>
                    <th width="200">Razon Social</th>
                    <th>Codigo</th>
                    <th width="60">Pais</th>
                    <th width="70">Departamento</th>
                    <th>Tipo</th>
                    <th>Estado</th>
                    <th>Opciones</th>
                </tr>
            
            <tbody>
                <% while(rs.next()){%>
                <tr><td><%=rs.getString("idCliente")%></td>
                    <td><%=rs.getString("ruc")%></td>
                    <td><%=rs.getString("razonSocial")%></td>
                    <td><%=rs.getString("codigocli")%></td>
                    <td><%=rs.getString("pais")%></td>
                    <td><%=rs.getString("departamento")%></td>
                    <td><%=rs.getString("tipo")%></td>
                    <td align="center">
                    <%
                    if(rs.getString("estado").equals("1")){
                    %>
                    <a href="cliente_list_opc.jsp?accion=desactivar&idCliente=<%=rs.getString("idCliente")%>" title="Desactivar Cliente">
                        <img alt="" src="../imagenes/icons/tick.png">
                    </a>
                    <%
                    }else{
                    %>
                    <a href="cliente_list_opc.jsp?accion=activar&idCliente=<%=rs.getString("idCliente")%>" title="Activar Cliente">
                        <img alt="" src="../imagenes/icons/publish_x.png">
                    </a>
                    <%}%>
                    </td>
                    <td>
                        &nbsp;<a href="cliente_save.jsp?accion=eliminar&idCliente=<%=rs.getString("idCliente")%>"onclick="return confirm('¿Estas seguro de ELIMINAR?');" title="Eliminar Cliente">
                            <img src="../imagenes/icons/trash.png" height="18" width="18"  alt=""/>
                        </a>&nbsp;
                        &nbsp;<a href="cliente_edit_fm.jsp?accion=actualizar&idCliente=<%=rs.getString("idCliente")%>" title="Editar Cliente">
                            <img src="../imagenes/icons/edit_f2.png" height="16" width="16"alt=""/>
                        </a>&nbsp;
                        &nbsp;<a href="cliente_edit_fm.jsp?accion=actualizar&idCliente=<%=rs.getString("idCliente")%>" title="Ver Cliente">
                            <img src="../imagenes/icons/view.gif" alt=""/>
                        </a>&nbsp;
                    </td>
                </tr>
                <%}conex.close();%>
            </tbody>
    </table>
           
        </div>
        <br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br>
    </body>
</html>
