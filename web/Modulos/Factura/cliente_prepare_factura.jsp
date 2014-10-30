<%-- 
    Document   : cliente_prepare_factura
    Created on : 22/07/2012, 12:40:51 AM
    Author     : José Manuel
--%>
<%@include file="../session_verifica.jsp" %>
<%@include file="../conexion.jsp" %>
<%@page import="com.gl.modelo.DetalleCliente"%>
<%@page import="com.gl.controlador.FacturaController" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            DetalleCliente clientePreparedByFactura = (DetalleCliente) request.getSession().getAttribute("clienteFindSession");
        %>
        <%
            FacturaController c = new FacturaController();
        %>
        <%
            consulta = "SELECT LAST_INSERT_ID(numFactura) +1 "
                    + "AS ProximoIdAInsertar "
                    + "FROM factura "
                    + "ORDER BY numFactura "
                    + "DESC LIMIT 1";
            PreparedStatement psn = conex.prepareStatement(consulta);
            ResultSet rsn = psn.executeQuery();
        %>


    </head>
    <body>
        <br/>
        <br/>
        <br/>
    <center>
        <form action="../../FacturaController">

            <table style="border-radius: 10px; background-color: appworkspace; box-shadow:0px 0px 10px rgba(0,0,0,1);">
                <tr>
                    <th colspan="6">Cliente a Insertar en la Factura</th>
                </tr>
                <tr>

                    <td>Serie Factura</td>
                    <td><input type="text" name="txtSerieFactura" value="001"/>
                    <td>Numero Fac</td>
                    <td>
                        <%if (rsn.next()) {%>
                        <input name="txtNumFactura" type="text" value="<%=c.nf().customFormat("000000", rsn.getInt("ProximoIdAInsertar"))%>">
                        <%} else {%>
                        <input type="text" name="txtNumFactura" value="<%=c.nf().customFormat("000000", 1)%>">
                        <%}%>


                    </td>
                    <td>login</td>
                    <td><input type="text" name="txtLogin" value="<%=session_login%>" readonly/></td>
                </tr>
                <br/>
                <br/>
                <br/>
                <tr>
                    <td>
                        <input type="text" name="txtIdCliente" value="<%=clientePreparedByFactura.getCliente().getIdCliente()%>"/>        
                    </td>
                </tr>
                <tr>
                    <td>Razon Social</td>
                    <td><input type="text" size="40" value="<%=clientePreparedByFactura.getCliente().getRazonSocial()%>"/></td>
                    <td>RUC</td>
                    <td><input type="text" value="<%=clientePreparedByFactura.getCliente().getRuc()%>"/></td>
                </tr>
                <tr>
                    <td>Direccion</td>
                    <td><input type="text" size="40" value="<%=clientePreparedByFactura.getDireccion()%>"/></td>
                </tr>
                <tr>

                    <td colspan="6"><center><input type="submit" value="Continuar -->"/>&nbsp;&nbsp;<input type="reset" value="Cancelar"/></center></td>

                </tr>
            </table>
            <input type="hidden" name="opt" value="3"/>
        </form>
    </center>
</body>
</html>
