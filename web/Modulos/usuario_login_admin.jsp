<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@include file="conexion.jsp" %>

<html>
    <head>
        <link href="../css/ultimate.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <%
            String login = request.getParameter("login");
            String password = request.getParameter("password");

            consulta = "select * from usuario where login=? and password=? "; //cadena de consulta
            ps = conex.prepareStatement(consulta);
            ps.setString(1, login);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if (rs.next()) {
                if (rs.getString("cargo").equals("Gerente General") || rs.getString("cargo").equals("admin") && rs.getString("estado").equals("1")) {
                    response.sendRedirect("usuario_list.jsp");
                } else {

                    out.print(
                            " <br>&nbsp;&nbsp;&nbsp;<img src='../imagenes/icons/warning.gif' alt=''> "
                            + "&nbsp;&nbsp;&nbsp;"
                            + "Usted no tiene los suficientes privilegios para ingresar a esta pagina<br>"
                            + "&nbsp;&nbsp;&nbsp;&nbsp;"
                            + "&nbsp;&nbsp;&nbsp;&nbsp;"
                            + "&nbsp;&nbsp;&nbsp;&nbsp;"
                            + "Por favor, contacte con el administrador para obtener los privilegios."
                            + "&nbsp;<a href='usuario_form.jsp'>Regresar</a>"
                            );

                }
            } else {
                out.print(
                        " <br>&nbsp;&nbsp;&nbsp;<img src='../imagenes/icons/warning.gif' alt=''> "
                        + "&nbsp;&nbsp;&nbsp;"
                        + "Usted no tiene los suficientes privilegios para ingresar a esta pagina<br>"
                        + "&nbsp;&nbsp;&nbsp;&nbsp;"
                        + "&nbsp;&nbsp;&nbsp;&nbsp;"
                        + "&nbsp;&nbsp;&nbsp;&nbsp;"
                        + "Por favor, contacte con el administrador para obtener los privilegios."
                        + "&nbsp;<a href='usuario_form.jsp'>Regresar</a>");//si no encuentra resultados reenvia al formulario validate_login

            }
            //cerramos la conexion
            conex.close();
        %>

    </body>
</html>