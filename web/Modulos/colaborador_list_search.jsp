<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="conexion.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
    if (request.getParameter("textoDeBusqueda") != null) {
        String orden = request.getParameter("opcionBusqueda");

        if (orden.equals("1")) {
            consulta = "SELECT co.idcolab, cl.razonsocial,co.nombreape, co.telf,co.cell,co.cell2, co.nextel,co.anexo, co.email, co.email2 "
                    + "FROM colaborador co "
                    + "INNER JOIN cliente cl ON cl.idCliente=co.idCliente "
                    + "WHERE co.nombreape LIKE ? and co.idcolab";
            ps = conex.prepareStatement(consulta);
            ps.setString(1, "%" + request.getParameter("textoDeBusqueda") + "%");
            rs = ps.executeQuery();

        } else if(orden.equals("2")){
            consulta = "SELECT co.idcolab, cl.razonsocial,co.nombreape, co.telf,co.cell,co.cell2, co.nextel,co.anexo, co.email, co.email2 "
                    + "FROM colaborador co "
                    + "INNER JOIN cliente cl ON cl.idCliente=co.idCliente "
                    + "WHERE CONCAT(co.email,' ',co.email2) LIKE ? and co.idcolab ";
            ps = conex.prepareStatement(consulta);
            ps.setString(1, "%" + request.getParameter("textoDeBusqueda") + "%");
            rs = ps.executeQuery();

        } else if(orden.equals("3")){
             consulta = "SELECT co.idcolab, cl.razonsocial,co.nombreape, co.telf,co.cell,co.cell2, co.nextel,co.anexo, co.email, co.email2 "
                     + "FROM colaborador co "
                     + "INNER JOIN cliente cl ON cl.idCliente=co.idCliente "
                     + "WHERE CONCAT(co.telf,' ',co.cell,' ',co.cell2,' ',co.nextel) LIKE ? and co.idcolab ";
            ps = conex.prepareStatement(consulta);
            ps.setString(1, "%" + request.getParameter("textoDeBusqueda") + "%");
            rs = ps.executeQuery();

        } else if(orden.equals("4")){

                    consulta = "SELECT co.idcolab, cl.razonsocial,co.nombreape, co.telf,co.cell,co.cell2, co.nextel,co.anexo, co.email, co.email2 "
                            + "FROM colaborador co "
                            + "INNER JOIN cliente cl ON cl.idCliente=co.idCliente "
                            + "WHERE cl.razonsocial LIKE ?  ";
            ps = conex.prepareStatement(consulta);
            ps.setString(1, "%" + request.getParameter("textoDeBusqueda") + "%");
            rs = ps.executeQuery();

        } 

    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                 <link href="facturar/recursos/css/tabla.css" media="screen" rel="stylesheet" type="text/css" />
        <link href="facturar/recursos/css/layout.css" media="screen" rel="stylesheet" type="text/css" />

         <script type="text/javascript" src="../Js/jquery.js" ></script>
          <script type="text/javascript">
            nuevo=function()
            {
                var d = "";
                $.ajax
                ({
                    type:"POST",
                    url:"colaborador_add_fm.jsp",
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
        <h3>REPORTE </h3>

        
        <br>
        <br>
        <br>
        &nbsp;<a href="#" onclick="nuevo()" title="Nuevo Colaborador"><img alt="" src="../imagenes/icons/F62C8D949.png" height="55" width="55"/></a>&nbsp;
        </div>
        <br><br>
 <div align="center">
         <form name="formBus" action="colaborador_list_search.jsp" method="get">
             <table id="rounded-corner">
                 <tr id="rounded-buscar">
                     <th colspan="2" class="rounded-company"></th>
                     <th colspan="2" class="rounded-q4"></th>
                 </tr>
                <tr>
                    <th width="100">Buscar por : &nbsp;&nbsp;</th>
                    <th width="100">
                        <select name="opcionBusqueda">
                            <option value="1">Nombres y Apellido</option>
                            <option value="2">E-mail</option>
                            <option value="3">Telef, Cell, Nextel</option>
                            <option value="4">Razon Social</option>
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
<div id="contenedor" style="display:none"></div>
<table id="rounded-corner" align="center" border="0">
            <thead>
                <tr>
                    
                    <th class="rounded-q4" colspan="10" align="center">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        LISTA DE PERSONALES</th>
                </tr>
                <tr>
                <th>Razon social</th>
                <th>Nombre y Apellidos</th>
                <th>Telefono</th>
                <th>Celular 1</th>
                <th>Celular 2</th>
                <th>Nextel</th>
                <th>Enexo</th>
                <th>E-mail 1</th>
                <th>E-mail 2</th>
                <th>Opciones</th>
                </tr>
            </thead>
            <% while(rs.next()){%>
            <tr>
                <td><%=rs.getString("razonSocial")%></td>
                <td><%=rs.getString("nombreape")%></td>
                <td><%=rs.getString("telf")%></td>
                <td><%=rs.getString("cell")%></td>
                <td><%=rs.getString("cell2")%></td>
                <td><%=rs.getString("nextel")%></td>
                <td><%=rs.getString("anexo")%></td>
                <td><a href="MAILTO:<%=rs.getString("email")%>"><%=rs.getString("email")%></a></td>
                <td><a href="MAILTO:<%=rs.getString("email2")%>"><%=rs.getString("email2")%></a></td>
                <td>
                      &nbsp;<a href="colaborador_save.jsp?accion=eliminar&idcolab=<%=rs.getString("idcolab") %>" onclick="return confirm('¿Estas seguro de ELIMINAR?');" title="Eliminar Personal">
                      <img src="../imagenes/icons/trash.png" height="18" width="18"  alt=""/>
                      </a>&nbsp;
                     &nbsp;<a href="colaborador_edit_fm.jsp?accion=actualizar&idcolab=<%=rs.getString("idcolab") %>" title="Editar Personal">
                     <img src="../imagenes/icons/edit_f2.png" height="16" width="16"alt=""/>
                     </a>&nbsp;

                </td>
            </tr>
            <%}conex.close();%>
        </table>
        </div>
    </body>
</html>
