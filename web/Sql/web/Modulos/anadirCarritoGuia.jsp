<%@page import="java.util.ArrayList"%>
<%@page import="com.gl.modelo.*" %>
<%@page import="com.gl.dao.*" %>
<%@page import="java.util.*" %>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title></title>
         <link  rel="stylesheet" href="../css/ultimate.css" type="text/css" media="all">


<script src="../Js/validate/jquery_1.4.js" type="text/javascript"></script>
<script src="../Js/validate/jquery_validate.js" type="text/javascript"></script>
<script type="text/javascript">
$(function(){
       $('#formInscripcion').validate({
           rules: {

           'txtCantidad': { required: false, number: true },
           'txtPesoTotal': { required: false, number: true }

           },
       messages: {

           'txtCantidad': { required: 'Debe ingresar la cantidad', number: 'Debe ingresar un número' },
           'txtPesoTotal': { required: 'Debe ingresar el peso', number: 'Debe ingresar un número' }

       },
       debug: false


    });
});
</script>


</head>
    <body>

        <div align="center">

            <form method="post" action="Controlador" id="formInscripcion">

                <input type="hidden" name="accion" value="AnadirCarritoGuia" />
                <table width="307" border="0" align="center" id="rounded-corner-list">
                    <tr>
                        <th colspan="1" class="rounded-company"></th>
                        <th colspan="1" class="rounded-q4">DESCRIPCION GUIA DE REMISION</th>
                    </tr>
                    <tr>
                        <td align="right">Codigo</td>
                        <td><input type="text" name="txtCodigo" size="10" value=""/></td>
                    </tr>
                    <tr>
                        <td width="74" align="right">Descripcion</td>
                        <td width="110">
                          <textarea name="txtDescripcion" cols="50" rows="2" id="txtDescripcion" onChange="javascript:this.value=this.value.toUpperCase();" required></textarea>
                        </td>
                    </tr>
                    <tr>

                        <td width="54" align="right">Cantidad</td>
                        <td width="55"><input name="txtCantidad" id="txtCantidad" type="text"  size="10" maxlength="10"/></td>
                    </tr>
                    <tr>
                        <td align="right">Unidad Medida</td>
                        <td><input type="text" name="txtUnidMedida" size="10"/></td>
                    </tr>
                    <tr>
                        <td align="right">Peso</td>
                        <td colspan="3"><input name="txtPesoTotal" size="10" id="txtPesoTotal" type="text"  value="" /></td>
                    </tr>

                    <tr>
                        <th colspan="1" class="rounded-foot-left"></th>
                        <th colspan="1" class="rounded-foot-right"><input name="btnAnadir" type="submit"  value="Añadir" /></th>
                    </tr>
                </table>

        </form>
         </div><br>
    </body>
</html>
