<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@include file="conexion.jsp" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
consulta="select*from impuestoGeneralVentas";
ps=conex.prepareStatement(consulta);
rs=ps.executeQuery();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
          <link  rel="stylesheet" href="../css/ultimate.css" type="text/css" media="all">
    </head>
    <body>
        
        
    
    <div align="center">

        <form action="igv_save.jsp">
            <table id="rounded-corner-list">
        <tr>
            <th class="rounded-company">Id</th>
      
            <th style="padding: 7px"><b>Valor</b></th>
           
            <th class="rounded-q4"><b>Activar</b></th>
        </tr>
        <%while(rs.next()){%>
        <tr>
        <td><%=rs.getString("idIgv")%></td>
        <td>
            <select name="txtigv">
                <option value="0.00">Seleccione IGV</option>
                <option value="0.19">19%</option>
                <option value="0.18">18%</option>
                <option value="0.00">Exonerado(0%)</option>
            </select>
        </td>
        
        <td> <button type="submit" onclick="return confirm('¿Está seguro de activar este IGV?')"  >Activar</button></td>
        </tr>
        <tr>
            <th colspan="1" class="rounded-foot-left"></th>
            <th colspan="1" align="center" >
                IGV Activo: &nbsp;<input size="12" type="text" value="<%=rs.getString("nombreIgv")%>"/>
            </th>
            <th colspan="1" class="rounded-foot-right"></th>
        </tr>
        <%}conex.close();%>
        
    </table>
        </form>
        </div><br>
    </body>
</html>
