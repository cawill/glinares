<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@include file="conexion.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String valor = request.getParameter("valor");
            consulta = "select c.idcliente,t.placa,t.marca,t.idtracto "
                    + "from cliente c "
                    + "inner join tracto t "
                    + "on c.idcliente=t.idcliente "
                    + "where c.idcliente=?";
            ps = conex.prepareStatement(consulta);
            ps.setString(1, valor);
            rs = ps.executeQuery();
        %>

        <div id="rtrac">
            <select name="txtIdTracto" id="trac" onchange="llamarDatosTracto()">
                <option value="">
                    Seleccione Tracto
                </option>
                <%while (rs.next()) {%>
                <option value="<%=rs.getString("idtracto")%>">
                    <%=rs.getString("placa")%>
                </option>
                <%}
            conex.close();%>
            </select>
        </div>                           
        <div>
            <a href="tracto_list.jsp" target="../" title="Busca Tractos(Puedes buscar y actualizar los campos de los Tractos que te convenga)">
                <img alt="" src="../imagenes/icons/search.png" height="25" width="25">
            </a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="tracto_add_fm.jsp" target="../" title="Insertar Tractos(Redirecciona directamente a un formulario que te permitira ingresar un nuevo Tracto)">
                <img alt="" src="../imagenes/icons/add.png" height="25" width="25">
            </a>&nbsp;
            <button id="rtra" value="<%=valor%>" title="Refrescar(Luego de haber actualizado o ingresado un nuevo Tracto, presione este boton para asegurarse que los cambios se han realizado en la Guia de Remisión)" onclick="llamarRefreshTractoGuia()" type="button" style="background-color: #60c8f2;border: 0px;">
                <img alt="" src="../imagenes/icons/refresh.png" height="25" width="25">
            </button>                                    
        </div>

    </body>
</html>
