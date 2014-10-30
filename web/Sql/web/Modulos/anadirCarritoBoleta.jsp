<%@page import="java.util.ArrayList"%>
<%@page import="com.gl.modelo.*" %>
<%@page import="com.gl.dao.*" %>
<%@page import="java.util.*" %>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%-- Obtenemos el id o el codigo del producto que deseamos añadir al carrito --%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title></title>
         <link  rel="stylesheet" href="../css/ultimate.css" type="text/css" media="all">


<script src="../Js/validate/jquery_1.4.js" type="text/javascript"><!--mce:0--><!--mce:0--></script>
<script src="../Js/validate/jquery_validate.js" type="text/javascript"><!--mce:1--><!--mce:1--></script>
<script>
$(function(){
       $('#formInscripcion').validate({
           rules: {

           'txtCantidad': { number: true },
           'txtPrecioUnit': { required: false, number: true }

           },
       messages: {

           'txtCantidad': { number: 'Debe ingresar un número' },
           'txtPrecioUnit': { required: 'Debe ingresar el precio', number: 'Debe ingresar un número' }

       },
       debug: false


    });
});
</script>

</head>
    <body>

        <div align="center">

            <form method="post" action="Controlador" id="formInscripcion">

                <input type="hidden" name="accion" value="AnadirCarritoBoleta" />
                <table width="307" border="0" align="center" id="rounded-corner-list">
                    <tr>
                        <th colspan="1" class="rounded-company"></th>
                        <th colspan="1" style="padding: 7px" class="rounded-q4">DESCRIPCION BOLETA DE VENTA</th>
                    </tr>
                    <tr>
                        <td width="74" align="right">Descripcion</td>
                        <td width="110">
                          <textarea name="txtDescripcion" cols="70" rows="2" class="style5" id="txtDescripcion" onChange="javascript:this.value=this.value.toUpperCase();" required></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" width="54">Cantidad</td>
                        <td width="55"><input name="txtCantidad" type="text" id="txtCantidad"class="style5" size="10" maxlength="10"  /></td>
                    </tr>
                    <tr>
                        <td align="right">Precio</td>
                        <td><input name="txtPrecioUnit" id="txtPrecioUnit"type="text" size="10" class="style5" /></td>
                    </tr>

                    <tr>
                        <th colspan="1" class="rounded-foot-left"></th>
                        <th colspan="1" class="rounded-foot-right"><input name="btnAnadir" type="submit" class="style3" value="Añadir" /></th>
                    </tr>
                </table>

        </form>
         </div><br>
    </body>
</html>
