<%@include file="conexion.jsp" %>
<%-- 
    Document   : usuario_list
    Created on : 29/02/2012, 10:17:45 PM
    Author     : Josmarl
--%>

<%
    if (request.getParameter("textoDeBusqueda") != null) {
        String orden = request.getParameter("opcionBusqueda");

        if (orden.equals("1")) {
            consulta = "select * from usuario where nombres like ? ;";
            ps = conex.prepareStatement(consulta);
            ps.setString(1, "%" + request.getParameter("textoDeBusqueda") + "%");
            rs = ps.executeQuery();
        } else if (orden.equals("2")) {
            consulta = "select * from usuario where dni like ? ;";
            ps = conex.prepareStatement(consulta);
            ps.setString(1, "%" + request.getParameter("textoDeBusqueda") + "%");
            rs = ps.executeQuery();
        } else if (orden.equals("3")) {
            consulta = "select * from usuario where login like ? ;";
            ps = conex.prepareStatement(consulta);
            ps.setString(1, "%" + request.getParameter("textoDeBusqueda") + "%");
            rs = ps.executeQuery();
        } else if (orden.equals("4")) {
            consulta = "select * from usuario where email like ? ;";
            ps = conex.prepareStatement(consulta);
            ps.setString(1, "%" + request.getParameter("textoDeBusqueda") + "%");
            rs = ps.executeQuery();
        } else if (orden.equals("5")) {
            consulta = "select * from usuario where celular like ? ;";
            ps = conex.prepareStatement(consulta);
            ps.setString(1, "%" + request.getParameter("textoDeBusqueda") + "%");
            rs = ps.executeQuery();
        } 


    }

%>

<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>


<html>
    <head>
        <link  rel="stylesheet" href="../css/ultimate.css" type="text/css" media="all"/>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>Administracion de Usuarios</title>
        <script type="text/javascript" src="../Js/jquery.js" ></script>
        <script type="text/javascript">
            nuevo=function()
            {
                var d = "";
                $.ajax
                ({
                    type:"POST",
                    url:"usuario_add_fm.jsp",
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
            <h3>REPORTE Y ADMINISTRACION DE USUARIOS</h3>
            <br/> 
            &nbsp;<a href="#" onClick="nuevo()" title="Nuevo Usuario"><img alt="" src="../imagenes/icons/usuario.png" width="50" height="50"/></a>&nbsp;      
            <br/> 
            <br/>
            <form action="usuario_list_search.jsp" method="get">
                <table id="rounded-corner">
                    <tr id="rounded-buscar">
                        <th colspan="2" class="rounded-company"></th>
                        <th colspan="2" class="rounded-q4"></th>
                    </tr>
                    <tr>
                        <th width="100">Buscar por : </th>
                        <th width="100">
                            <select name="opcionBusqueda">
                                <option value="1">Nombres y Apellidos</option>
                                <option value="2">DNI</option>
                                <option value="3">Login</option>
                                <option value="4">E-mail</option>
                                <option value="5">Nro. de Celular</option>
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
            <div id="contenedor" style="display:none"></div>
            <br/><br/>
            <table id="rounded-corner">
                <tr>
                    <th colspan="3" class="rounded-company"></th>
                    <th colspan="2" align="right">LISTA DE USUARIOS</th>
                    <th colspan="4" class="rounded-q4"></th>
                </tr>
                <tr>
                    <th>Login</th>
                    <th>Nombres y Ap.</th>
                    <th>DNI</th>
                    <th>Direccion</th>
                    <th>Celular</th>
                    <th>Email</th>
                    <th>Cargo</th>
                    <th>Estado</th>
                    <th>Opciones</th>
                </tr>
                <%while (rs.next()) {%>
                <tr>
                    <td><%=rs.getString("login")%></td>
                    <td><%=rs.getString("nombres")%></td>
                    <td><%=rs.getString("dni")%></td>
                    <td><%=rs.getString("direccion")%></td>
                    <td><%=rs.getString("celular")%></td>
                    <td><%=rs.getString("email")%></td>
                    <td><%=rs.getString("cargo")%></td>
                    <td>
                        <%
                            if (rs.getString("estado").equals("1")) {
                        %>
                        <a href="usuario_list_opc.jsp?accion=desactivar&login=<%=rs.getString("login")%>" title="Desactivar Usuario">
                            <img alt="" src="../imagenes/icons/tick.png"/>
                        </a>
                        <%
                        } else {
                        %>
                        <a href="usuario_list_opc.jsp?accion=activar&login=<%=rs.getString("login")%>" title="Activar Usuario">
                            <img alt="" src="../imagenes/icons/publish_x.png"/>
                        </a>
                        <%}%>
                    </td>
                    <td>
                        &nbsp;<a title="Eliminar" href="usuario_save.jsp?accion=eliminar&login=<%=rs.getString("login")%>" onClick="return confirm('¿Está seguro de ELIMINAR?')">
                            <img alt="" src="../imagenes/icons/trash.png"/>
                        </a>&nbsp;
                        &nbsp;<a title="Editar" href="usuario_edit_fm.jsp?accion=editar&login=<%=rs.getString("login")%>">
                            <img alt="" src="../imagenes/icons/edit_f2.png"/>
                        </a>&nbsp;
                    </td>
                </tr>
                <%}%>
            </table>
        </div>

    </body>
</html>
