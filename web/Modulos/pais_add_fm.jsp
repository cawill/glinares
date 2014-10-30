<%-- 
    Document   : pais_add_fm
    Created on : 13/12/2011, 08:38:51 PM
    Author     : josmarl
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
         <link  rel="stylesheet" href="../css/ultimate.css" type="text/css" media="all">
    </head>
    <body>
        <div align="center">
       <form action="pais_save.jsp" method="post">
           
           
           <br>
           <table id="rounded-corner-list">
            <tr>
                <th colspan="1" class="rounded-company"></th>
                <th colspan="1" class="rounded-q4">
                    REGISTRO DE DESTINOS
                </th>
            </tr>
            <tr>
                <td align="right">Ciudad :</td>
                <td><input type="text" name="ciudad" size="30" required maxlength="45"></td>
            </tr>
            <tr>
                <td align="right">Pais :</td>
                <td><input type="text" name="pais" size="30" required maxlength="45"></td>
            </tr>
            <tr>
                <td align="right">Puerto : </td>
                <td><input type="text" name="puerto" size="30" maxlength="50"></td>
            </tr>
			<tr>
                <td align="right">Cod Pais : </td>
                <td><input type="text" name="cod_pais" size="30" maxlength="6" required></td>
            </tr>
			<tr>
                <td align="right">Cod Depar : </td>
                <td><input type="text" name="cod_depar" size="30" maxlength="6"></td>
            </tr>

            <tr>
                <th class="rounded-foot-left" colspan="1"></th>
                <th class="rounded-foot-right" colspan="1" align="right"><input type="submit" value="Guardar"></th>
            </tr>
        </table>
        <input type="hidden" name="accion" value="guardar">
        </form>
            </div>
    </body>
</html>
