<%@include file="session_verifica.jsp" %>
<%@include file="conexion.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
        <title>Bienvenido</title>
        <link href="../Modulos/facturar/recursos/css/tabla.css" media="screen" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
            consulta = "select password from usuario where login=?";
            ps = conex.prepareStatement(consulta);
            ps.setString(1, session_login);
            rs = ps.executeQuery();
        %>
        <center>
            <table>
                <tr>
                    <th>LOGIN</th>
                </tr>
                <%while (rs.next()) {%>  
                <tr>
                    <td>
                        <form id="form1" name="form1" method="post" action="usuario_login_admin.jsp">
                            <table>
                                <tr>
                                    <th>Usuario</th>
                                    <td><input name="login" type="text" value="<%=session_login%>" /></td>
                                </tr>
                                <tr>
                                    <th>Password</th>
                                    <td><input type="password" name="password"  value="<%=rs.getString("password")%>" style="margin-top:5px;" /></td>
                                </tr>
                                <tr>
                                    <td colspan="2"><input type="submit" name="button" id="button" value="Ingresar" /></td>
                                </tr>
                            </table>
                        </form>    
                    </td>
                </tr>
                <%}%>
            </table>
        </center>
    </body>
</html>