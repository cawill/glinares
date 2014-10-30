<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@include file="conexion.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%if (request.getParameter("textoDeBusqueda") != null) {
        String orden = request.getParameter("opcionBusqueda");
        
        if (orden.equals("1")) {
            consulta = "select * from pais where ciudad like ? and idpais;";
            ps = conex.prepareStatement(consulta);
            ps.setString(1, "%" + request.getParameter("textoDeBusqueda") + "%");
            rs = ps.executeQuery();

        } else if (orden.equals("2")) {
            consulta = "select * from pais where pais like ? and idpais;";
            ps = conex.prepareStatement(consulta);
            ps.setString(1, "%" + request.getParameter("textoDeBusqueda") + "%");
            rs = ps.executeQuery();

        } else if (orden.equals("3")) {
            consulta = "select * from pais where puerto like ? and idpais;";
            ps = conex.prepareStatement(consulta);
            ps.setString(1, "%" + request.getParameter("textoDeBusqueda") + "%");
            rs = ps.executeQuery();

        }
    }

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
        <script type="text/javascript" src="../Js/jquery.js" ></script>
        <link  rel="stylesheet" href="../css/ultimate.css" type="text/css" media="all">
         <script type="text/javascript">
            nuevo=function()
            {
                var d = "";
                $.ajax
                ({
                    type:"POST",
                    url:"pais_add_fm.jsp",
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
        <h3>REPORTE Y ADMINISTRACION DE DESTINOS</h3>
        <br>
        &nbsp;<a href="#" onclick="nuevo()"><img alt="" src="../imagenes/icons/maps.png" height="55" width="55"/></a>&nbsp;
        </div>
        <br>
        <div align="center">
        <form name="formBus" action="pais_list_search.jsp" method="get">
            <table id="rounded-corner">
                <tr id="rounded-buscar">
                    <th colspan="2" class="rounded-company"></th>
                    <th colspan="2" class="rounded-q4"></th>
                </tr>
                <tr>
                    <th width="80">Buscar por : </th>
                    <th width="80">
                        <select name="opcionBusqueda">
                            <option value="1">Ciudad</option>
                            <option value="2">Pais</option>
                            <option value="3">Puerto</option>
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
            <br>
                <div id="contenedor" style="display:none"></div>
                <br>
                <table id="rounded-corner" align="center">
            
         <tr>
            <th class="rounded-company" colspan="1"></th>
            <th colspan="5" align="center">LISTA DE DESTINOS</th>
            <th class="rounded-q4" colspan="1"></th>
        </tr>
                <tr>
                    <th>Id</th>
                    <th>Ciudad</th>
                    <th>Pais</th>
                    <th>Puerto</th>
                    <th>Cod Pais</th>
                    <th>Cod Depar</th>
                    <th>Opciones</th>
                </tr>
           
            
                <%while(rs.next()){%>
                <tr>
                    <td><%=rs.getString("idpais")%></td>
                    <td><%=rs.getString("ciudad")%></td>
                    <td><%=rs.getString("pais")%></td>
                    <td><%=rs.getString("puerto")%></td>
		    <td><%=rs.getString("cod_pais")%></td>
                    <td><%=rs.getString("cod_depar")%></td>
                    <td>
 &nbsp;<a href="pais_save.jsp?accion=eliminar&idpais=<%=rs.getString("idpais") %>" onclick="return confirm('¿Estas seguro de ELIMINAR?');" title="Eliminar Destino">
 <img src="../imagenes/icons/trash.png" height="18" width="18"  alt=""/>
 </a>&nbsp;
 &nbsp;<a href="pais_edit_fm.jsp?accion=actualizar&idpais=<%=rs.getString("idpais") %>" title="Editar Destino">
<img src="../imagenes/icons/edit_f2.png" height="16" width="16"alt=""/>
 </a>&nbsp;
                    </td>
                </tr>               
           
            <%}conex.close();%>
        </table>
</div>
    </body>
</html>
