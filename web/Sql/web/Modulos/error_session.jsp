<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Error de session</title>
        <link  rel="stylesheet" href="../css/ultimate.css" type="text/css" media="all"/>
    </head>
    <body>
        <br>
        <div style="font-size:12px">
            &nbsp;
            <img alt="" src="../imagenes/icons/warning.gif"/>
            &nbsp;<%
                String Error="No puede iniciar session de esa forma";
                out.print("Error fuera de Session : " + Error);
                out.print("&nbsp;<a style='font-size:12px' href='../index.jsp'>Regresar</a>");
             %>
            </div>

    
    </body>
</html>
