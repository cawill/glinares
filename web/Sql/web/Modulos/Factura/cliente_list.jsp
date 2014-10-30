<%-- 
    Document   : cliente_list
    Created on : 21/07/2012, 11:51:25 PM
    Author     : José Manuel
--%>

<%@page import="com.gl.modelo.Cliente"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            List<Cliente> listaClientesJsp = (List<Cliente>) request.getSession().getAttribute("listaClientesSession");
        %>
    <center>
        <table>
            <tr>
                <th colspan="4">Lista de Clientes</th>
            </tr>
            <tr>
                <th>Id</th>
                <th>Razon Social</th>
                <th>RUC</th>
                <th>Elegir</th>
            </tr>
            <%for (Cliente clienteTo : listaClientesJsp) {%>
            <tr>
                <td><%=clienteTo.getIdCliente()%></td>
                <td><%=clienteTo.getRazonSocial()%></td>
                <td><%=clienteTo.getRuc()%></td>
                <td>
                    <a href="../../FacturaController?opt=2&txtIdCliente=<%=clienteTo.getIdCliente()%>">Add Factura</a>
                </td>

            </tr>
            <%}%>            
        </table>
    </center>

</body>
</html>
