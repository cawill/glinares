<%@include file="../conexion.jsp" %>

<%-- 
    Document   : cliente_list
    Created on : 13/12/2011, 11:41:15 AM
    Author     : Josmarl
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
consulta="SELECT crt.idcrt, crt.numero_2, cli.razonsocial, clic.razonsocial as destinatario, crt.fechaporteador_23 "
        + "from crt crt "
        + "inner join cliente cli on cli.idcliente=crt.idcliente "
        + "inner join cliente clic on clic.idcliente=crt.destinatario_4 "
        + "order by crt.idcrt;"; //cadena de consulta
ps=conex.prepareStatement(consulta);
rs=ps.executeQuery();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
         <link  rel="stylesheet" href="../../css/ultimate.css" type="text/css" media="all">
    </head>
    <body>
        
        <div align="center">
        <h1>REPORTE Y ADMINISTRACION DE CRTs</h1>
        &nbsp;<a href="crt_add_fm.jsp"><img alt="" src="../../imagenes/icons/Office.png" height="55" width="55"/></a>&nbsp;
        
        
        
        </div><br>
        <div align="center">
        <table id="rounded-corner" align="center">
            <tr>
                <th colspan="2" class="rounded-company"></th>
                <th colspan="1" align="center">LISTA DE CRTS</th>
                <th colspan="4" class="rounded-q4"></th>
            </tr>
                <tr>
                    
                    <th>Nº CRT</th>
                    <th>REMITENTE</th>
                    <th>DESTINATARIO</th>
                    <th>FECHA</th>
                    
                    <th>Opciones</th>
                </tr>
                <%  while(rs.next()){%>
                <tr>
                    
                    <td><%=rs.getString("numero_2")%></td>
                    <td><%=rs.getString("razonsocial")%></td>
                    <td><%=rs.getString("destinatario")%></td>
                    <td><%=rs.getString("fechaporteador_23")%></td>
                    
                    
                    
                    <td>
                     &nbsp;<a href="crt_save.jsp?accion=eliminar&idcrt=<%=rs.getString("idcrt") %>" onclick="return confirm('¿Estas seguro de ELIMINAR?');" title="Eliminar CRT">
                         <img alt="" src="../../imagenes/icons/trash.png"/>
                     </a>&nbsp;
                     &nbsp;<a href="crt_edit_fm.jsp?idcrt=<%=rs.getString("idcrt") %>" title="Editar CRT">
                         <img alt="" src="../../imagenes/icons/edit_f2.png" height="16" width="16"/>
                     </a>&nbsp;
                    &nbsp;<a target="../" href="../reportes/reporte_crt.jsp?repcrt=<%=rs.getString("idcrt")%>" 
						title="Imprimir" onclick="return confirm('Imprimir')"><img alt="" src="../../imagenes/icons/print.gif"/>
						</a>
                    </td>
                </tr>
                <%}%>

        </table>
</div>
    </body>
</html>
