<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="conexion.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
    if (request.getParameter("textoDeBusqueda") != null) {
        String orden = request.getParameter("opcionBusqueda");

        if (orden.equals("1")) {
            consulta = "select c.idconductor,c.dniconductor,c.licenciaconductor," +
                    "c.nombreconductor,c.apellidopconductor," +
                    "c.apellidomconductor,c.ciudadconductor,c.paisconductor," +
                    "t.razonSocial from conductor c " +
                    "inner join cliente t on c.idCliente=t.idCliente " +
                    "where c.nombreconductor like ? and c.idconductor";
            ps = conex.prepareStatement(consulta);
            ps.setString(1, "%"+request.getParameter("textoDeBusqueda")+"%");
            rs = ps.executeQuery();

        } else if(orden.equals("2")){
            consulta = "select c.idconductor,c.dniconductor,c.licenciaconductor," +
                    "c.nombreconductor,c.apellidopconductor," +
                    "c.apellidomconductor,c.ciudadconductor,c.paisconductor," +
                    "t.razonSocial from conductor c " +
                    "inner join cliente t on c.idCliente=t.idCliente " +
                    "where concat(c.apellidopconductor,' ',c.apellidomconductor)" +
                    " like ? and c.idconductor";
            ps = conex.prepareStatement(consulta);
            ps.setString(1, "%"+request.getParameter("textoDeBusqueda")+"%");
            rs = ps.executeQuery();

        } else if(orden.equals("3")){
             consulta = "select c.idconductor,c.dniconductor,c.licenciaconductor," +
                    "c.nombreconductor,c.apellidopconductor," +
                    "c.apellidomconductor,c.ciudadconductor,c.paisconductor," +
                    "t.razonSocial from conductor c " +
                    "inner join cliente t on c.idCliente=t.idCliente " +
                    "where c.dniconductor like ? and c.idconductor";
            ps = conex.prepareStatement(consulta);
            ps.setString(1, "%"+request.getParameter("textoDeBusqueda")+"%");
            rs = ps.executeQuery();

        } else if(orden.equals("4")){

                    consulta = "select c.idconductor,c.dniconductor,c.licenciaconductor," +
                    "c.nombreconductor,c.apellidopconductor," +
                    "c.apellidomconductor,c.ciudadconductor,c.paisconductor," +
                    "t.razonSocial from conductor c " +
                    "inner join cliente t on c.idCliente=t.idCliente " +
                    "where c.licenciaconductor like ? and c.idconductor";
            ps = conex.prepareStatement(consulta);
            ps.setString(1, "%"+request.getParameter("textoDeBusqueda")+"%");
            rs = ps.executeQuery();

        } else if(orden.equals("5")){

                    consulta = "select c.idconductor,c.dniconductor,c.licenciaconductor," +
                    "c.nombreconductor,c.apellidopconductor," +
                    "c.apellidomconductor,c.ciudadconductor,c.paisconductor," +
                    "t.razonSocial from conductor c " +
                    "inner join cliente t on c.idCliente=t.idCliente " +
                    "where t.razonSocial like ? and c.idconductor";
            ps = conex.prepareStatement(consulta);
            ps.setString(1, "%"+request.getParameter("textoDeBusqueda")+"%");
            rs = ps.executeQuery();

        }


    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link  rel="stylesheet" href="../css/ultimate.css" type="text/css" media="all">
         <script type="text/javascript" src="../Js/jquery.js" ></script>
          <script type="text/javascript">
            nuevo=function()
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
        <h3>REPORTE Y ADMINISTRACION DE CONDUCTORES</h3>

    
        <br>
        <br>
        <br>
        &nbsp;<a href="#" onclick="nuevo();" title="Nuevo Conductor"><img alt="" src="../imagenes/icons/driver_icon.png" height="55" width="55"/></a>&nbsp;&nbsp;
        </div>
        <br><br>
 <div align="center">
         <form name="formBus" action="conductor_list_search.jsp" method="get">
             <table id="rounded-corner">
                 <tr id="rounded-buscar">
                     <th colspan="2" class="rounded-company"></th>
                     <th colspan="2" class="rounded-q4"></th>
                 </tr>
                <tr>
                    <th width="100">Buscar por : &nbsp;&nbsp;</th>
                    <th width="100">
                        <select name="opcionBusqueda">
                            <option value="1">Nombres</option>
                            <option value="2">Apellidos</option>
                            <option value="3">DNI</option>
                            <option value="4">Licencia</option>
                            <option value="5">Razon Social</option>
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

                    <th colspan="5" class="rounded-company"></th>
                    <th colspan="3" align="left">LISTA DE CONDUCTORES</th>
                    <th colspan="5" class="rounded-q4"></th>
                </tr>
                <tr>
                <th>Id Conductor</th>
                <th>DNI</th>
                <th>Licencia</th>
                <th>Nombres</th>
                <th>Apellido Pat</th>
                <th>Apellido Mat</th>
                <th>Ciudad</th>
                <th>Pais</th>
                <th>Razon Social</th>
                <th>Opciones</th>
                </tr>
            </thead>
            <% while(rs.next()){%>
            <tr>
                <td><%=rs.getString("idconductor")%></td>
                <td><%=rs.getString("dniconductor")%></td>
                <td><%=rs.getString("licenciaconductor")%></td>
                <td><%=rs.getString("nombreconductor")%></td>
                <td><%=rs.getString("apellidopconductor")%></td>
                <td><%=rs.getString("apellidomconductor")%></td>
                <td><%=rs.getString("ciudadconductor")%></td>
                <td><%=rs.getString("paisconductor")%></td>
                <td><%=rs.getString("razonSocial")%></td>
                <td>
                      &nbsp;<a href="conductor_save.jsp?accion=eliminar&idConductor=<%=rs.getString("idConductor") %>" onclick="return confirm('¿Estas seguro de ELIMINAR?');" title="Eliminar Conductor">
                      <img src="../imagenes/icons/trash.png" height="18" width="18"  alt=""/>
                      </a>&nbsp;
                     &nbsp;<a href="conductor_edit_fm.jsp?accion=actualizar&idConductor=<%=rs.getString("idConductor") %>" title="Editar Conductor">
                     <img src="../imagenes/icons/edit_f2.png" height="16" width="16"alt=""/>
                     </a>&nbsp;

                </td>
            </tr>
            <%}conex.close();%>
        </table>
        </div>
    </body>
</html>
