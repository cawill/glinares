<%@include file="conexion.jsp" %>


<%-- 
    Document   : rampla_list
    Created on : 19/12/2011, 12:15:13 AM
    Author     : Josmarl
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
consulta="select r.idRampla,r.tipo,r.ejes,r.placa,r.nroConstancia," +
        "r.configuracion,r.clase,r.descripcion,r.estado,r.idCliente," +
        "t.razonSocial from ramplas r inner join cliente t " +
        "on r.idCliente=t.idCliente where r.idRampla;";
ps=conex.prepareStatement(consulta);
rs=ps.executeQuery();
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
                    url:"rampla_add_fm.jsp",
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
        <h3 align="center">REPORTE Y ADMINISTRACION DE RAMPLAS</h3>
        
        
        <br>
        <br>
        <br>
        &nbsp;<a href="#" onclick="nuevo();" title="Nuevo Rampla"><img alt="" src="../imagenes/icons/rampla.png" height="70" width="70"/></a>&nbsp;&nbsp;
        </div>
        <br>
        <div align="center">
         <form name="formBus" action="rampla_list_search.jsp" method="get">
             <table id="rounded-corner">
                 <tr id="rounded-buscar">
                     <th colspan="2" class="rounded-company"></th>
                     <th colspan="2" class="rounded-q4"></th>
                </tr>
                <tr>
                    <th width="100">Buscar por : </th>
                    <th width="100">
                        <select name="opcionBusqueda">
                            <option value="1">Nro. de Ejes</option>
                            <option value="2">Placa</option>
                            <option value="3">Tipo</option>
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
        <br>
         <div id="contenedor" style="display:none" ></div>
        <br>
		<%--
        <table id="rounded-corner" align="center">
            
                    <tr>
                        <th colspan="5" class="rounded-company"></th>
                        <th colspan="3" align="center">  
                            LISTA DE RAMPLAS
                        </th>
                        <th colspan="3" class="rounded-q4">
                            
                        </th>
                    </tr>
            <tr>
                <th>Id</th>
                <th>Tipo</th>
                <th>Ejes</th>
                <th>Placa</th>
                <th>Nro</th>
                <th>Config</th>
                <th>Clase</th>
                <th>Descripcion</th>
                <th>Estado</th>
                <th>Razon Social</th>
                <th>Opciones</th>
            </tr>
            
             <tbody>

            <% while(rs.next()){%>
            <tr>
                <td><%=rs.getString("idRampla")%></td>
                <td><%=rs.getString("tipo")%></td>
                <td><%=rs.getString("ejes")%></td>
                <td><%=rs.getString("placa")%></td>
                <td><%=rs.getString("nroConstancia")%></td>
                <td><%=rs.getString("configuracion")%></td>
                <td><%=rs.getString("clase")%></td>
                <td><%=rs.getString("descripcion")%></td>
                <td><%=rs.getString("estado")%></td>
                <td><%=rs.getString("razonSocial")%></td>
                <td>
                    &nbsp;<a href="rampla_save.jsp?accion=eliminar&idRampla=<%=rs.getString("idRampla")%>" onclick="return confirm('¿Esta seguro de ELIMINAR?')" title="Eliminar">
<img src="../imagenes/icons/trash.png" height="18" width="18"  alt=""/>
</a>&nbsp;
&nbsp;<a href="rampla_edit_fm.jsp?accion=actualizar&idRampla=<%=rs.getString("idRampla")%>" title="Editar">
<img src="../imagenes/icons/edit_f2.png" height="16" width="16"alt=""/>
</a>&nbsp;
             </td>
            </tr>


            <%}conex.close();%>
             </tbody>
        </table>
		--%>
             </div>
    </body>
</html>
