<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="conexion.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
    if (request.getParameter("textoDeBusqueda") != null) {
        String orden = request.getParameter("opcionBusqueda");

        if (orden.equals("1")) {
            consulta = "SELECT g.idgasto,  g.nrocompro, p.ruc, p.razonsocial, g.fechacomp, g.total, g.descrip "
                    + "FROM gastos g inner join proveedor p on p.ruc=g.ruc "
                    + "WHERE g.descrip LIKE ? ";
            ps = conex.prepareStatement(consulta);
            ps.setString(1, "%" + request.getParameter("textoDeBusqueda") + "%");
            rs = ps.executeQuery();

        } else if(orden.equals("2")){
            consulta = "SELECT g.idgasto,  g.nrocompro, p.ruc, p.razonsocial, g.fechacomp, g.total, g.descrip "
                    + "FROM gastos g inner join proveedor p on p.ruc=g.ruc "
                    + "WHERE g.nrocompro LIKE ? ";
            ps = conex.prepareStatement(consulta);
            ps.setString(1, "%" + request.getParameter("textoDeBusqueda") + "%");
            rs = ps.executeQuery();

        } else if(orden.equals("3")){
             consulta = "SELECT g.idgasto,  g.nrocompro, p.ruc, p.razonsocial, g.fechacomp, g.total, g.descrip "
                    + "FROM gastos g inner join proveedor p on p.ruc=g.ruc "
                    + "WHERE g.fechacomp LIKE ? ";
            ps = conex.prepareStatement(consulta);
            ps.setString(1, "%" + request.getParameter("textoDeBusqueda") + "%");
            rs = ps.executeQuery();

        } else if(orden.equals("4")){

                    consulta = "SELECT g.idgasto,  g.nrocompro, p.ruc, p.razonsocial, g.fechacomp, g.total, g.descrip "
                    + "FROM gastos g inner join proveedor p on p.ruc=g.ruc "
                    + "WHERE p.razonsocial LIKE ? ";
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
                    url:"gasto_add_fm.jsp",
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
        <h3>BUSCAR COMPROBANTES - GASTOS </h3>

        
        <br>
        <br>
        <br>
<%--        &nbsp;<a href="#" onclick="nuevo()" title="Nuevo Gasto"><img alt="" src="../imagenes/icons/nuevo.gif"/></a>&nbsp; --%>
        </div>
        <br>
 <div align="center">
         <form name="formBus" action="gasto_lista_search.jsp" method="get">
             <table id="rounded-corner">
                 <tr id="rounded-buscar">
                     <th colspan="2" class="rounded-company"></th>
                     <th colspan="2" class="rounded-q4"></th>
                 </tr>
                <tr>
                    <th width="100">Buscar por : &nbsp;&nbsp;</th>
                    <th width="100">
                        <select name="opcionBusqueda">
                            <option value="1">Descripcion</option>
                            <option value="2">Nº Comprobante</option>
                            <option value="3">Fecha Compra</option>
                            <option value="4">Razon Social</option>
                        </select>
                    </th>
                    <th width="45"><input type="text" name="textoDeBusqueda" size="40"/></th>
                    <th><button type="submit" title="Buscar"><img alt="" src="../imagenes/icons/buscar.png" height="30" width="30"/></button> &nbsp; &nbsp; &nbsp;
                        <a href="gasto_list.jsp" title="Añadir Gastos">[&nbsp;&nbsp;AGREGAR COMPROBANTE&nbsp;&nbsp;]&nbsp;&nbsp;</a>
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
<table id="rounded-corner" align="center" border="0">
            <thead>
                <tr>
                    <th class="rounded-company" colspan="6" align="center"><span class="rounded-q4"> LISTA DE GASTOS</span></th>
                    
                </tr>
                <tr>
                <th>Nº COMPROBANTES</th>
                <th>RUC</th>
                <th>RAZON SOCIAL</th>
                <th>FECHA COMPRA</th>
                <th>DETALLE</th>
                <th>TOTAL S/.</th>
                                </tr>
            </thead>
            <% while(rs.next()){%>
            <tr>
                <td><%=rs.getString("nrocompro")%></td>
                <td><%=rs.getString("ruc")%></td>
                <td><%=rs.getString("razonsocial")%></td>
                <td><%=rs.getString("fechacomp")%></td>
                <td><%=rs.getString("descrip")%></td>
                <td><%=rs.getString("total")%></td>
               
			    <%--  <td>
                    
                     &nbsp;<a href="gasto_edit_fm.jsp?accion=actualizar&idgasto=<%=rs.getString("idgasto") %>" title="Editar Personal">
                     <img src="../imagenes/icons/edit_f2.png" height="16" width="16"alt=""/>
                     </a>&nbsp;
                                </td>  --%>   
            </tr>
            <%}conex.close();%>
        </table>
    </div>
    </body>
</html>
