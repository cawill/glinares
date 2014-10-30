<script src="../Js/validate/jquery_1.4.js" type="text/javascript"><!--mce:0--><!--mce:0--></script>
<script src="../Js/validate/jquery_validate.js" type="text/javascript"><!--mce:1--><!--mce:1--></script>
<script>
$(function(){
       $('#formInscripcion').validate({
           rules: {
           'nombre': 'required',
           'apellido': 'required',
           'numero_identidad': { required: true, number: true },
           'email': { required: true, email: true },
           'tipo_identidad': 'required',
           'deportes[]': { required: true, minlength: 1 }
           },
       messages: {
           'nombre': 'Debe ingresar el nombre',
           'apellido': 'Debe ingresar el apellido',
           'numero_identidad': { required: 'Debe ingresar el n�mero de documento de identidad', number: 'Debe ingresar un n�mero' },
           'email': { required: 'Debe ingresar un correo electr�nico', email: 'Debe ingresar el correo electr�nico con el formato correcto. Por ejemplo: u@localhost.com' },
           'tipo_identidad': 'Debe ingresar el n�mero de documento',
           'deportes[]': 'Debe seleccionar m�nimo un deporte'
       },
       debug: true,
       /*errorElement: 'div',*/
       //errorContainer: $('#errores'),
       submitHandler: function(form){
           alert('El formulario ha sido validado correctamente!');
       }
    });
});
</script>
<%--
<form id="formInscripcion" method="post">
    <fieldset>
       <legend>Datos Personales</legend>
       <p><label for="nombre">Primer Nombre:</label> <input id="nombre" name="nombre" type="text"></p>
       <p><label for="apellido">Primer Apellido:</label> <input id="apellido" name="apellido" type="text"></p>
       <p><label for="numero_identidad">N�mero Documento Identidad:</label> <input id="numero_identidad" name="numero_identidad" type="text"></p>
       <p><label for="email">Email:</label> <input id="email" name="email" type="text"></p>
       <p><label for="tipo_identidad">Tipo Documento Identidad:</label>
           <select id="tipo_identidad" name="tipo_identidad">
               <option>Tipo de Documento</option>
               <option value="1">Tarjeta Identidad</option>
               <option value="2">C�dula</option>
           </select>
       </p>
    </fieldset>
    <fieldset>
       <legend>Seleccione deportes</legend>
       <p><label for="deporte_1">Baloncesto</label> <input id="deporte_1" name="deportes[]" value="1" type="checkbox"></p>
       <p><label for="deporte_2">Nataci�n</label> <input id="deporte_2" name="deportes[]" value="2" type="checkbox"></p>
       <p><label for="deporte_3">F�tbol</label> <input id="deporte_3" name="deportes[]" value="3" type="checkbox"></p>
       <p><label for="deporte_4">Ciclismo</label> <input id="deporte_4" name="deportes[]" value="4" type="checkbox"></p>
    </fieldset>
    <p><input name="enviar" value="Enviar" type="submit"></p>
</form>--%>

<form action="test_result.jsp" method="post">

    Remolque<input type="radio" name="1" value="X"/>
    Semiremilque<input type="radio" name="1" value="Y"/>
    <input type="submit" name="Enviar"/>
</form>