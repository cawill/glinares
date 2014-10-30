
<%@include file="Modulos/session_verifica.jsp"%>
<%@include file="Modulos/conexion.jsp"%>
<%-- @taglib prefix="a" uri="http://jmaki/v1.0/jsp" --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="Modulos/facturar/recursos/css/layout.css" />
        <link href="Modulos/facturar/recursos/css/denth.css" media="screen" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="menu_files/css3menu1/style.css" type="text/css" /><style>._css3m{display:none}</style>
        <link rel="stylesheet" href="jmaki-standard.css" type="text/css"></link>
        <title>Page Title</title>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
        <link  rel="stylesheet" href="css/ind.css" type="text/css" media="all"/>
        <link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />
        
        <script type="text/javascript" src="Js/topmenu/jquery.min.js"></script>
        <script type="text/javascript" src="Js/topmenu/ddsmoothmenu.js"></script>
        <script type="text/javascript">

            ddsmoothmenu.init({
                mainmenuid: "templatemo_menu", //menu DIV id
                orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
                classname: 'ddsmoothmenu', //class added to menu's outer DIV
                //customtheme: ["#1c5a80", "#18374a"],
                contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
            })

        </script>

        <script type="text/javascript" src="Js/indexframe/jquery-1.3.1.js"></script>
        <script type="text/javascript" src="Js/indexframe/jquery.corner.js"></script>
        <script type="text/javascript">
            // test auto-ready logic - call corner before DOM is ready
            $('#ejemplo1').corner();


        </script>

        <style type="text/css">
        </style>
        <style type="text/css">
            #Layer1 {
                position:absolute;
                left:39px;
                top:16px;
                width:191px;
                height:5px;
                z-index:3;
            }
        </style>
    </head>
   
    <body class="cuerpo">

        <div id="divuser">
            <%
                consulta = "select CONCAT(nombres) AS user from usuario where login=?";
                ps = conex.prepareStatement(consulta);
                ps.setString(1, session_login);
                rs = ps.executeQuery();
                while (rs.next()) {
            %>
            <div align="left">Bienvenido Sr(a) : &nbsp;<%=rs.getString("user")%></div>
            <%}%>
        </div>
            
        <div id="outerBorder">


            <div id="ejemplo1" class="oval" >

            </div> <!-- header -->
            <div id="main" align="center">
<ul id="css3menu1" class="topmenu">
    <li class="topfirst"><a class="pressed" href="menupanel/menupanel.jsp" target="con" style="height:14px;line-height:14px;">Home</a></li>
	<li class="topmenu"><a href="#" style="height:14px;line-height:14px;"><span>Administrar</span></a>
	<ul>
		<li><a href="Modulos/cliente_list.jsp" target="con">Clientes</a></li>
		<li><a href="Modulos/colaborador_list.jsp" target="con"><span>Colaboradores</span></a>
		<ul>
			<li><a href="Modulos/colaborador_add_fm.jsp" target="con">Add Colaborador</a></li>
		</ul></li>
		<li><a href="Modulos/tracto_list.jsp" target="con">Tracto</a></li>
		<li><a href="Modulos/rampla_list.jsp" target="con">Rampla</a></li>
		<li><a href="Modulos/conductor_list.jsp" target="con">Conductor</a></li>
                <li><a href="Modulos/pais_list.jsp" target="con">Destinos</a></li>
		<li><a href="Modulos/gasto_list.jsp" target="con"><span>Gastos</span></a>
		<ul>
			<li><a href="Modulos/gasto_lista.jsp" target="con">Reporte</a></li>
		</ul></li>
                <li><a href="Modulos/usuario_form.jsp" target="con">Usuarios</a></li>
	</ul></li>
        <li class="topmenu"><a href="" style="height:14px;line-height:14px;"><span>Crt</span></a>
	<ul>
            <li><a href="Modulos/crt/crt_add_fm.jsp" target="con">Crear CRT</a></li>
            <li><a href="Modulos/crt/crt_list.jsp" target="con">Reportar CRT</a></li>
	</ul></li>
	<li class="topmenu"><a href="#" style="height:14px;line-height:14px;"><span>Mic</span></a>
	<ul>
            <li><a href="Modulos/mic_add_fm.jsp" target="con">Crear MIC</a></li>
            <li><a href="Modulos/mic_list.jsp" target="con">Reportar MIC</a></li>
	</ul></li>
        <li class="topmenu"><a href="#" style="height:14px;line-height:14px;"><span>Guia de Remision</span></a>
	<ul>
		<li><a href="Modulos/registrarVentaGuia.jsp" target="con">Crear GUIA</a></li>
                <li><a href="Modulos/detalleGuia_list.jsp" target="con">Reportar GUIA</a></li>
	</ul></li>
	<li class="topmenu"><a href="#" style="height:14px;line-height:14px;"><span>Facturacion</span></a>
	<ul>
            <%-- 
		<li><a href="#"><span>Factura</span></a>
		<ul>
                    <li><a href="Modulos/registrarVenta.jsp" target="con">Crear Factura</a></li>
                    <li><a href="Modulos/detalleFactura_list.jsp" target="con">Buscar Factura</a></li>
                    <li><a href="Modulos/factura_estadistica.jsp" target="con">Estadistica</a></li>
		</ul></li>
		<li>
                    <a href="#"><span>Boleta</span></a>
		<ul>
                    <li><a href="Modulos/registrarVentaBoleta.jsp" target="con">Crear Boleta</a></li>
                    <li><a href="Modulos/detalleBoleta_list.jsp" target="con">Buscar Boleta</a></li>
                    <li><a href="Modulos/boleta_estadistica.jsp" target="con">Estadistica</a></li>
		</ul>
                </li>
            --%>
            <li><a href="Modulos/facturar/menupanel/menupanel.jsp" target="con">FACTURAR</a></li>
            <li><a href="working.jsp" target="con">BOLETA</a></li>
	</ul></li>
	<li class="toplast"><a href="Modulos/session_cierra.jsp" style="height:14px;line-height:14px;" onclick="return confirm('¿Desea cerrar session?')">Salir</a></li>
</ul>
                
                <div id="content" align="center">
                    <iframe name="con" frameborder="0" height="800" width="1275" src="menupanel/menupanel.jsp">
                        
                        <%--  <jsp:forward page="home.jsp"></jsp:forward> --%>

                    </iframe> 
                </div> <!-- content -->
            </div> <!-- main -->
        </div> <!-- outerborder -->

    </body>
</html>
