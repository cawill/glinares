<%-- 
    Document   : menupanel
    Created on : 09/05/2012, 06:48:04 PM
    Author     : magwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>PANEL DE FACTURA</title>

        <link rel="stylesheet" href="main.css" />
        <!--[if IE 7]><link rel="stylesheet" href="styles/ie7.css" /><![endif]-->    

        <!-- DO NOT USE THESE FILES. they are compiled for fast http access -->
        <!-- if you�re looking for source, download or read documentation -->
        <script src="jquery-1.4.1-and-plugins.min.js" type="text/javascript"></script>
        <script src="main.js" type="text/javascript"></script></head>
    <body>

    <center>

        <div id="site">
            <div id="title">
                <h1>FACTURA</h1>
            </div>
            <!-- this isn�t part of the plugin, just a control for demo -->
            <ul class="splitter">
                <li>
                </li>
            </ul>
            <div class="demo">
                <!-- read the documentation to understand what�s going on here -->
                <ul id="list" class="image-grid">
                    <li data-id="id-1" class="app">
                        <a href="../factura_form.jsp">
                            <img src="add.png" width="100" height="100" alt="" /></a>
                        <strong>CREAR</strong>
                    </li>
                    <li data-id="id-2" class="app">
                        <a href="../detalleFactura_list.jsp">
                            <img src="buscar.png" width="100" height="100" alt="" /></a>
                        <strong>BUSCAR</strong>
                    </li>
                    <li data-id="id-3" class="app">
                        <a href="../factura_estadistica.jsp">
                            <img src="textedit.png" width="100" height="100" alt="" /></a>
                        <strong>ESTADISTICAS</strong>
                    </li>

                    <li data-id="id-4" class="">
                        <a href="../../cliente_add_fm.jsp">
                            <img src="finder.png" width="100" height="100" alt="" /></a>
                        <strong>ADD_CLIENTE</strong>

                    </li>
                   
                </ul>

            </div>


        </div>
    </center>

</body>
</html>
