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
<script type="text/javascript">
$(function(){
       $('#formInscripcion').validate({
           rules: {

           'txtCantidad': {  number: true },
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
       
                <input type="hidden" name="accion" value="AnadirCarrito" />
                <table align="center" id="rounded-corner-list">
                
                    <tr align="center">
                        <th class="rounded-company" colspan="1"></th>
                        <th class="rounded-q4" colspan="1" align="left">DESCRIPCION DE FACTURA</th>
                    </tr>

                    <tr>
                        <td width="74">Descripcion</td>
                        <td width="110">     
                          <textarea name="txtDescripcion" cols="70" rows="2" maxlength="60" id="txtDescripcion" onChange="javascript:this.value=this.value.toUpperCase();" required></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td width="54">Cantidad</td>
                        <td width="55"><input name="txtCantidad" id="txtCantidad" type="text"  size="20" maxlength="10" /></td>
                    </tr>
                    <tr>
                        <td>Precio</td>
                        <td colspan="3"><input name="txtPrecioUnit"  size="20" type="text" value="" /></td>
                    </tr>

                    <tr>
                        <th class="rounded-foot-left" colspan="1"></th>
                        <th class="rounded-foot-right" colspan="1">
                            <button type="submit"><img alt="" src="../imagenes/icons/Add.gif" height="16" width="16" title="Añadir"/></button>
                        </th>
                    </tr>
                   
                </table>
           
        </form>
         </div><br>
    </body>
</html>
