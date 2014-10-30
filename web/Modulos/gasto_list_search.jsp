    <%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="conexion.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
    if (request.getParameter("textoDeBusqueda") != null) {
        String orden = request.getParameter("opcionBusqueda");

        if (orden.equals("1")) {
            consulta = "SELECT ruc,  razonsocial, direccion FROM proveedor WHERE ruc LIKE ? ";
            ps = conex.prepareStatement(consulta);
            ps.setString(1, "%" + request.getParameter("textoDeBusqueda") + "%");
            rs = ps.executeQuery();

        } else if(orden.equals("2")){
            consulta = "SELECT ruc,  razonsocial, direccion FROM proveedor WHERE razonsocial LIKE ? ";
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
         <link  rel="stylesheet" href="../css/ultimate.css" type="text/css" media="all">
         <script type="text/javascript" src="../Js/jquery.js" ></script>
          <script type="text/javascript">
            nuevo=function()
            {
                var d = "";
                $.ajax
                ({
                    type:"POST",
                    url:"gasto_add_prov_fm.jsp",
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
        
        </div>
        <br>
 <div align="center">
         <form name="formBus" action="gasto_list_search.jsp" method="get">
             <table id="rounded-corner">
                 <tr id="rounded-buscar">
                     <th colspan="2" class="rounded-company"></th>
                     <th colspan="2" class="rounded-q4"></th>
                 </tr>
                <tr>
                    <th width="100">Buscar : &nbsp;&nbsp;</th>
                    <th width="100">
                        <select name="opcionBusqueda">
                            <option value="1">Ruc</option>
                            <option value="2">Razon Social</option>
                        </select>
                    </th>
                    <th width="45"><input type="text" name="textoDeBusqueda" size="40"/></th>
                    <th><button type="submit" title="Buscar"><img alt="" src="../imagenes/icons/buscar.png" height="30" width="30"/></button>
                    <a href="#" onclick="nuevo();" title="Nuevo Proveedor"> &nbsp; &nbsp; &nbsp;[&nbsp;&nbsp;ADD PROVEEDOR&nbsp;&nbsp;]&nbsp;&nbsp;</a>
                    </th>
                </tr>
                <tr id="rounded-buscar">
                    <th class="rounded-foot-left" colspan="2"></th>
                    <th class="rounded-foot-right" colspan="2"></th>
                </tr>
            </table>
        </form>
        <br><br>
<div id="contenedor" style="display:none"></div>
<table id="rounded-corner" align="center">
            <thead>
                <tr>
                    <th class="rounded-company" colspan="1"></th>
                    <th align="center" colspan="2">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        LISTA DE GASTOS</th>
                    <th class="rounded-q4" colspan="1"></th>
                </tr>
                <tr>
                <th>Ruc</th>
                <th>Razon Social</th>
                <th>Direccion</th>
                <th>Opciones</th>
                </tr>
            </thead>
            <% while(rs.next()){%>
            <tr>
                <td><%=rs.getString("ruc")%></td>
                <td><%=rs.getString("razonsocial")%></td>
                <td><%=rs.getString("direccion")%></td>
                <td>
                 
                    &nbsp;<a href="gasto_save_prov.jsp?accion=eliminar&ruc=<%=rs.getString("ruc") %>" onclick="return confirm('¿Estas seguro de ELIMINAR?');" title="Eliminar Proveedor">
                      <img src="../imagenes/icons/trash.png" height="18" width="18"  alt=""/>
                      </a>&nbsp;
                      &nbsp;<a href="gasto_edit_prov_fm.jsp?accion=actualizar&ruc=<%=rs.getString("ruc") %>" title="Editar proveedor">
                     <img src="../imagenes/icons/edit_f2.png" height="16" width="16"alt=""/>
                     </a>&nbsp;
                     &nbsp;<a href="gasto_add_fm.jsp?accion=actualizar&ruc=<%=rs.getString("ruc") %>" title="Editar proveedor">
                         <img src="../imagenes/icons/carrito.png" height="50" width="50"alt=""/></a>&nbsp;
                 

                </td>
            </tr>
            <%}conex.close();%>
        </table>
        </div>
    </body>
</html>
