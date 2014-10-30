<%@include file="conexion.jsp" %>

<%-- 
    Document   : tracto_list
    Created on : 19/12/2011, 12:40:18 PM
    Author     : Josmarl
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
consulta="select tr.idTracto,tr.placa,tr.marca,tr.ejes,tr.modelo," +
        "tr.capacidad,tr.anio,tr.nroConstancia,tr.configuracion,tr.color," +
        "tr.chasis,tr.estado,tr.idCliente," +
        "t.razonSocial from tracto tr inner join cliente t " +
        "on tr.idCliente=t.idCliente where tr.idTracto;";
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
                    url:"tracto_add_fm.jsp",
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
        <h3>REPORTE Y ADMINISTRACION DE TRACTOS</h3>
       
        
        <br>
        <br><br>
             &nbsp;<a href="#" onclick="nuevo();" title="Nuevo Tracto"><img alt="" src="../imagenes/icons/tracto.png" height="70" width="75"/></a>&nbsp;&nbsp;
        </div>
        <br>
        <div align="center">
              <form name="formBus" action="tracto_list_search.jsp" method="get">
                  
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
                                <option value="3">Capacidad de Arrastre</option>
                                <option value="4">Razon Social</option>
                            </select>
                        </th>
                        <th width="40"><input type="text" name="textoDeBusqueda" size="40"/></th>
                        <th ><button type="submit" title="Buscar"><img alt="" src="../imagenes/icons/buscar.png" height="30" width="30"/></button></th>
                    </tr>

                    <tr id="rounded-buscar">
                        <th colspan="2" class="rounded-foot-left"></th>
                        <th colspan="2" class="rounded-foot-right"></th>
                    </tr>
                </table>
            </form>
            <br>
        <div id="contenedor" style="display:none" ></div><br>
		<%--
        <table align="center" id="rounded-corner">
            <thead>
           <tr>
                <th class="rounded-company" colspan="7"></th>
                <th colspan="2">LISTA DE TRACTOS</th>
                <th class="rounded-q4" colspan="5"></th>
            </tr>
            <tr>
                <th>Id</th>
                <th>Placa</th>
                <th>Marca</th>
                <th>Ejes</th>
                <th>Modelo</th>
                <th>Capacidad</th>
                <th>Año</th>
                <th>Nro</th>
                <th>Configuracion</th>
                <th>Color</th>
                <th>Chasis</th>
                <th>Estado</th>
                <th>Razon Social</th>
                <th>Opciones</th>
            </tr>
            </thead>
               <% while(rs.next()){ %>
            <tr>
                <td><%=rs.getString("idTracto")%></td>
                <td><%=rs.getString("placa")%></td>
                <td><%=rs.getString("marca")%></td>
                <td><%=rs.getString("ejes")%></td>
                <td><%=rs.getString("modelo")%></td>
                <td><%=rs.getString("capacidad")%></td>
                <td><%=rs.getString("anio")%></td>
                <td><%=rs.getString("nroConstancia")%></td>
                <td><%=rs.getString("configuracion")%></td>
                <td><%=rs.getString("color")%></td>
                <td><%=rs.getString("chasis")%></td>
                <td><%=rs.getString("estado")%></td>
                <td><%=rs.getString("razonSocial")%></td>
                <td>
&nbsp;<a href="tracto_save.jsp?accion=eliminar&idTracto=<%=rs.getString("idTracto")%>" onclick="return confirm('¿Esta seguro de ELIMINAR?')">
<img src="../imagenes/icons/trash.png" height="18" width="18" alt=""/>
</a>&nbsp;
&nbsp;<a href="tracto_edit_fm.jsp?accion=actualizar&idTracto=<%=rs.getString("idTracto")%>">
<img src="../imagenes/icons/edit_f2.png"  height="16" width="16" alt=""/>
</a>&nbsp;

                </td>
            </tr>
            <% } conex.close();%>
        </table>
		--%>
    </div>
    </body>
</html>
