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
            consulta = "SELECT* from conductor where estado='1';";
            ps = conex.prepareStatement(consulta);
            rs = ps.executeQuery();
        %>
        
        <select name="txtIdConductor" id="conductor_lic" onclick="llamarLicencia()">
            <option value="">
                Seleccione Chofer
            </option>
            <%while (rs.next()) {%>
            <option value="<%=rs.getString("idconductor")%>">
                <%=rs.getString("nombreconductor")%>&nbsp;
                <%=rs.getString("apellidopconductor")%>&nbsp;
                <%=rs.getString("apellidomconductor")%>
            </option>
            <%}conex.close();%>
        </select>



    </body>
</html>
