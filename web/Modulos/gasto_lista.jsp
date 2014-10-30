<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@include file="conexion.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
        consulta = "SELECT idgasto, nrocompro, fechacomp ,descrip ,total"
                + " FROM gastos WHERE idgasto ";
        ps = conex.prepareStatement(consulta);
        rs = ps.executeQuery();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
            <br/>
            <br/>
        <h3>BUSCAR COMPROBANTES</h3>
<%--        &nbsp;<a href="#" onclick="nuevo();" title="Nuevo Tracto"><img alt="" src="../imagenes/icons/gastos.png" height="55" width="55"/></a>&nbsp;&nbsp; --%>
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
                    <th><button type="submit" title="Buscar"><img alt="" src="../imagenes/icons/buscar.png" height="30" width="30"/></button>
					&nbsp; &nbsp; &nbsp;
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
<%-- <table id="rounded-corner" align="center">
            <thead>
                <tr>
                    <th class="rounded-company" colspan="4"></th>
                    <th class="rounded-q4" colspan="6">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        LISTA DE PERSONALES</th>
                </tr>
                <tr>
                <th>Nº Comprobante</th>
                <th>Razon Social</th>
                <th>Ruc</th>
                <th>Fecha Compra</th>
                <th>Cantidad</th>
                <th>Descripcion</th>
                <th>Total</th>
                <th>Opciones</th>
                </tr>
            </thead>
            <% while(rs.next()){%>
            <tr>
                <td><%=rs.getString("nrocompro")%></td>
                <td><%=rs.getString("razonsocial")%></td>
                <td><%=rs.getString("ruc")%></td>
                <td><%=rs.getString("fechacomp")%></td>
                <td><%=rs.getString("cantidad")%></td>
                <td><%=rs.getString("descrip")%></td>
                <td><%=rs.getString("total")%></td>
                
                
                <td>
                      &nbsp;<a href="gasto_save.jsp?accion=eliminar&idgasto=<%=rs.getString("idgasto") %>" onclick="return confirm('¿Estas seguro de ELIMINAR?');" title="Eliminar Gasto">
                      <img src="../imagenes/icons/trash.png" height="18" width="18"  alt=""/>
                      </a>&nbsp;
                     &nbsp;<a href="gasto_edit_fm.jsp?accion=actualizar&idgasto=<%=rs.getString("idgasto") %>" title="Editar Personal">
                     <img src="../imagenes/icons/edit_f2.png" height="16" width="16"alt=""/>
                     </a>&nbsp;

                </td>
            </tr>
            <%}conex.close();%>
        </table>
--%>
        </div>
    </body>
</html>