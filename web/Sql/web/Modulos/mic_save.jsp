<%@include file="conexion.jsp" %>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<%
    String orden = request.getParameter("accion");

    String idmic = request.getParameter("idmic");

    String uno_nombre = request.getParameter("uno_nombre");
    String uno_direccion = request.getParameter("uno_direccion");
    String uno_descripcion = request.getParameter("uno_descripcion");
    String uno_codigoaduana = request.getParameter("uno_codigoaduana");
    String dos_rol = request.getParameter("dos_rol");
    String tres_transito_si = request.getParameter("tres_transito_si") == null ? "" : request.getParameter("tres_transito_si");
    String tres_transito_no = request.getParameter("tres_transito_no") == null ? "" : request.getParameter("tres_transito_no");
    String cuat_nro = request.getParameter("cuat_nro");
    String cinc_hoja = request.getParameter("cinc_hoja");
    String seis_fechaemision = request.getParameter("seis_fechaemision");
    String siet_aduanaciudad = request.getParameter("siet_aduanaciudad") == null ? "" : request.getParameter("siet_aduanaciudad");
    String siet_codigo = request.getParameter("siet_codigo") == null ? "" : request.getParameter("siet_codigo");
    String ocho_destino = request.getParameter("ocho_destino") == null ? "" : request.getParameter("ocho_destino");
    String ocho_codigo = request.getParameter("ocho_codigo") == null ? "" : request.getParameter("ocho_codigo");
    String idcliente = request.getParameter("idcliente") == null ? "" : request.getParameter("idcliente");
    String nueve_direccion = request.getParameter("nueve_direccion") == null ? "" : request.getParameter("nueve_direccion");
    String die_rolcontribuyente = request.getParameter("die_rolcontribuyente") == null ? "" : request.getParameter("die_rolcontribuyente");
    String idtracto = request.getParameter("idtracto") == null ? "" : request.getParameter("idtracto");
    String doce_marca = request.getParameter("doce_marca") == null ? "" : request.getParameter("doce_marca");
    String doce_num = request.getParameter("doce_num") == null ? "" : request.getParameter("doce_num");
    String trece_cap = request.getParameter("trece_cap") == null ? "" : request.getParameter("trece_cap");
    String cator_anio = request.getParameter("cator_anio") == null ? "" : request.getParameter("cator_anio");
    String diesei_camion = request.getParameter("diesei_camion") == null ? "" : request.getParameter("diesei_camion");
    String diesei_direccion = request.getParameter("diesei_direccion") == null ? "" : request.getParameter("diesei_direccion");
    String diesiet_rolcontri = request.getParameter("diesiet_rolcontri") == null ? "" : request.getParameter("diesiet_rolcontri");
    String dieoch_placacamion = request.getParameter("dieoch_placacamion") == null ? "" : request.getParameter("dieoch_placacamion");
    String dienue_marca = request.getParameter("dienue_marca") == null ? "" : request.getParameter("dienue_marca");
    String dienue_numero = request.getParameter("dienue_numero") == null ? "" : request.getParameter("dienue_numero");
    String veint_capacidad = request.getParameter("veint_capacidad") == null ? "" : request.getParameter("veint_capacidad");
    String veinuno_anio = request.getParameter("veinuno_anio") == null ? "" : request.getParameter("veinuno_anio");
    String veitre_nrocartaporte = request.getParameter("veintres_crt");
    String veicua_aduanadestino = request.getParameter("veicua_aduanadestino") == null ? "" : request.getParameter("veicua_aduanadestino");
    String veicua_codigoadu = request.getParameter("veicua_codigoadu") == null ? "" : request.getParameter("veicua_codigoadu");
    String veincin_moneda = request.getParameter("veincin_moneda");
    String veinsei_origenmerca = request.getParameter("veinsei_origenmerca") == null ? "" : request.getParameter("veinsei_origenmerca");
    String veinsei_codmerca = request.getParameter("veinsei_codmerca") == null ? "" : request.getParameter("veinsei_codmerca");
    String veinsie_valor = request.getParameter("veinsie_valor");
    String veinoch_flete = request.getParameter("veinoch_flete");
    String veinnue_seguro = request.getParameter("veinnue_seguro");
    String trein_tipobulto = request.getParameter("trein_tipobulto");
    String trein_numero = request.getParameter("trein_numero") == null ? "" : request.getParameter("trein_numero");
    String treinun_cantidad = request.getParameter("treinun_cantidad");
    String treindos_peso = request.getParameter("treindos_peso");
    String treintres_remitente = request.getParameter("treintres_remitente");
    String treintres_direccion = request.getParameter("treintres_direccion") == null ? "" : request.getParameter("treintres_direccion");
    String treintres_pais = request.getParameter("treintres_pais") == null ? "" : request.getParameter("treintres_pais");
    String treincua_destinatario = request.getParameter("treincua_destinatario");
    String treincua_direccion = request.getParameter("treincua_direccion") == null ? "" : request.getParameter("treincua_direccion");
    String treincua_pais = request.getParameter("treincua_pais") == null ? "" : request.getParameter("treincua_pais");
    String treincin_consignatario = request.getParameter("treincin_consignatario");
    String treincin_direccion = request.getParameter("treincin_direccion") == null ? "" : request.getParameter("treincin_direccion");
    String treincin_pais = request.getParameter("treincin_pais") == null ? "" : request.getParameter("treincin_pais");
    String treinsei_documento = request.getParameter("treinsei_documento");
    String treinsei_fecha = request.getParameter("treinsei_fecha");
    String treinsei_factura = request.getParameter("treinsei_factura");
    String treinsei_codigo = request.getParameter("treinsei_codigo");
    String treinsie_numprecinto = request.getParameter("treinsie_numprecinto");
    String treinocho_descripcion = request.getParameter("treinocho_descripcion");
    String cuaren_nrodata = request.getParameter("cuaren_nrodata");
    String idconductor = request.getParameter("idconductor") == null ? "" : request.getParameter("idconductor");
    String idrampla = request.getParameter("idrampla");
    String veindos_rampla = request.getParameter("veindos_rampla");
    String nueve_codigo = request.getParameter("nueve_codigo");
    String diesei_codigo = request.getParameter("diesei_codigo");
    String treinnuev_fecha = request.getParameter("treinnuev_fecha");
    String quince_re = request.getParameter("quince_re") == null ? "" : request.getParameter("quince_re");
    String quince_se = request.getParameter("quince_se") == null ? "" : request.getParameter("quince_se");
    String veindos_re = request.getParameter("veindos_re") == null ? "" : request.getParameter("veindos_re");
    String veindos_se = request.getParameter("veindos_se") == null ? "" : request.getParameter("veindos_se");
    String treinsei_texto = request.getParameter("treinsei_texto") == null ? "" : request.getParameter("treinsei_texto");

    if (orden.equals("guardar")) {
        consulta = "insert into mic(uno_nombre,uno_direccion,"
                + "uno_descripcion,uno_codigoaduana,dos_rol,"
                + "tres_transito_si,tres_transito_no,cuat_nro,cinc_hoja,seis_fechaemision,"
                + "siet_aduanaciudad,siet_codigo,ocho_destino,ocho_codigo,idcliente,"
                + "nueve_direccion,die_rolcontribuyente,idtracto,doce_marca,"
                + "doce_num,trece_cap,cator_anio,diesei_camion,diesei_direccion,"
                + "diesiet_rolcontri,dieoch_placacamion,dienue_marca,dienue_numero,"
                + "veint_capacidad,veinuno_anio,veintres_crt,veicua_aduanadestino,"
                + "veicua_codigoadu,veincin_moneda,veinsei_origenmerca,veinsei_codmerca,"
                + "veinsie_valor,veinoch_flete,veinnue_seguro,trein_tipobulto,"
                + "trein_numero,treinun_cantidad,treindos_peso,treintres_remitente,"
                + "treintres_direccion,treintres_pais,treincua_destinatario,"
                + "treincua_direccion,treincua_pais,treincin_consignatario,"
                + "treincin_direccion,treincin_pais,treinsei_documento,treinsei_fecha,"
                + "treinsei_factura,treinsei_codigo,treinsie_numprecinto,treinocho_descripcion,"
                + "cuaren_nrodata,idconductor,idrampla,veindos_rampla,nueve_codigo,"
                + "diesei_codigo,treinnuev_fecha,quince_re,quince_se,veindos_re,veindos_se,"
                + "treinsei_texto,estado) "
                + "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,"
                + "?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,"
                + "?,?,?,?,'ACTIVO');";

        ps = conex.prepareStatement(consulta);
        ps.setString(1, uno_nombre);
        ps.setString(2, uno_direccion);
        ps.setString(3, uno_descripcion);
        ps.setString(4, uno_codigoaduana);
        ps.setString(5, dos_rol);
        ps.setString(6, tres_transito_si);
        ps.setString(7, tres_transito_no);
        ps.setString(8, cuat_nro);
        ps.setString(9, cinc_hoja);
        ps.setString(10, seis_fechaemision);
        ps.setString(11, siet_aduanaciudad);
        ps.setString(12, siet_codigo);
        ps.setString(13, ocho_destino);
        ps.setString(14, ocho_codigo);
        ps.setString(15, idcliente);
        ps.setString(16, nueve_direccion);
        ps.setString(17, die_rolcontribuyente);
        ps.setString(18, idtracto);
        ps.setString(19, doce_marca);
        ps.setString(20, doce_num);
        ps.setString(21, trece_cap);
        ps.setString(22, cator_anio);
        ps.setString(23, diesei_camion);
        ps.setString(24, diesei_direccion);
        ps.setString(25, diesiet_rolcontri);
        ps.setString(26, dieoch_placacamion);
        ps.setString(27, dienue_marca);
        ps.setString(28, dienue_numero);
        ps.setString(29, veint_capacidad);
        ps.setString(30, veinuno_anio);
        ps.setString(31, veitre_nrocartaporte);
        ps.setString(32, veicua_aduanadestino);
        ps.setString(33, veicua_codigoadu);
        ps.setString(34, veincin_moneda);
        ps.setString(35, veinsei_origenmerca);
        ps.setString(36, veinsei_codmerca);
        ps.setString(37, veinsie_valor);
        ps.setString(38, veinoch_flete);
        ps.setString(39, veinnue_seguro);
        ps.setString(40, trein_tipobulto);
        ps.setString(41, trein_numero);
        ps.setString(42, treinun_cantidad);
        ps.setString(43, treindos_peso);
        ps.setString(44, treintres_remitente);
        ps.setString(45, treintres_direccion);
        ps.setString(46, treintres_pais);
        ps.setString(47, treincua_destinatario);
        ps.setString(48, treincua_direccion);
        ps.setString(49, treincua_pais);
        ps.setString(50, treincin_consignatario);
        ps.setString(51, treincin_direccion);
        ps.setString(52, treincin_pais);
        ps.setString(53, treinsei_documento);
        ps.setString(54, treinsei_fecha);
        ps.setString(55, treinsei_factura);
        ps.setString(56, treinsei_codigo);
        ps.setString(57, treinsie_numprecinto);
        ps.setString(58, treinocho_descripcion);
        ps.setString(59, cuaren_nrodata);
        ps.setString(60, idconductor);
        ps.setString(61, idrampla);
        ps.setString(62, veindos_rampla);
        ps.setString(63, nueve_codigo);
        ps.setString(64, diesei_codigo);
        ps.setString(65, treinnuev_fecha);
        ps.setString(66, quince_re);
        ps.setString(67, quince_se);
        ps.setString(68, veindos_re);
        ps.setString(69, veindos_se);
        ps.setString(70, treinsei_texto);
        if (ps.executeUpdate() == 1) {
            response.sendRedirect("mic_list.jsp");
        } else {
            out.println("No es posible guardar...");
        }
    } else if (orden.equals("actualizar")) {

        consulta = "update mic set uno_nombre=?,uno_direccion=?, "
                + "uno_descripcion=?,uno_codigoaduana=?,dos_rol=?, "
                + "tres_transito_si=?,tres_transito_no=?,cuat_nro=?,cinc_hoja=?,seis_fechaemision=?, "
                + "siet_aduanaciudad=?,siet_codigo=?,ocho_destino=?,ocho_codigo=?,idcliente=?, "
                + "nueve_direccion=?,die_rolcontribuyente=?,idtracto=?,doce_marca=?, "
                + "doce_num=?,trece_cap=?,cator_anio=?,diesei_camion=?,diesei_direccion=?, "
                + "diesiet_rolcontri=?,dieoch_placacamion=?,dienue_marca=?,dienue_numero=?, "
                + "veint_capacidad=?,veinuno_anio=?,veintres_crt=?,veicua_aduanadestino=?, "
                + "veicua_codigoadu=?,veincin_moneda=?,veinsei_origenmerca=?,veinsei_codmerca=?, "
                + "veinsie_valor=?,veinoch_flete=?,veinnue_seguro=?,trein_tipobulto=?, "
                + "trein_numero=?,treinun_cantidad=?,treindos_peso=?,treintres_remitente=?, "
                + "treintres_direccion=?,treintres_pais=?,treincua_destinatario=?, "
                + "treincua_direccion=?,treincua_pais=?,treincin_consignatario=?, "
                + "treincin_direccion=?,treincin_pais=?,treinsei_documento=?,treinsei_fecha=?, "
                + "treinsei_factura=?,treinsei_codigo=?,treinsie_numprecinto=?,treinocho_descripcion=?, "
                + "cuaren_nrodata=?,idconductor=?,idrampla=?,veindos_rampla=?,nueve_codigo=?, "
                + "diesei_codigo=?,treinnuev_fecha=?,quince_re=?,quince_se=?,veindos_re=?,veindos_se=?, "
                + "treinsei_texto=? where idmic=?";

        ps = conex.prepareStatement(consulta);

        ps.setString(1, uno_nombre);
        ps.setString(2, uno_direccion);
        ps.setString(3, uno_descripcion);
        ps.setString(4, uno_codigoaduana);
        ps.setString(5, dos_rol);
        ps.setString(6, tres_transito_si);
        ps.setString(7, tres_transito_no);
        ps.setString(8, cuat_nro);
        ps.setString(9, cinc_hoja);
        ps.setString(10, seis_fechaemision);
        ps.setString(11, siet_aduanaciudad);
        ps.setString(12, siet_codigo);
        ps.setString(13, ocho_destino);
        ps.setString(14, ocho_codigo);
        ps.setString(15, idcliente);
        ps.setString(16, nueve_direccion);
        ps.setString(17, die_rolcontribuyente);
        ps.setString(18, idtracto);
        ps.setString(19, doce_marca);
        ps.setString(20, doce_num);
        ps.setString(21, trece_cap);
        ps.setString(22, cator_anio);
        ps.setString(23, diesei_camion);
        ps.setString(24, diesei_direccion);
        ps.setString(25, diesiet_rolcontri);
        ps.setString(26, dieoch_placacamion);
        ps.setString(27, dienue_marca);
        ps.setString(28, dienue_numero);
        ps.setString(29, veint_capacidad);
        ps.setString(30, veinuno_anio);
        ps.setString(31, veitre_nrocartaporte);
        ps.setString(32, veicua_aduanadestino);
        ps.setString(33, veicua_codigoadu);
        ps.setString(34, veincin_moneda);
        ps.setString(35, veinsei_origenmerca);
        ps.setString(36, veinsei_codmerca);
        ps.setString(37, veinsie_valor);
        ps.setString(38, veinoch_flete);
        ps.setString(39, veinnue_seguro);
        ps.setString(40, trein_tipobulto);
        ps.setString(41, trein_numero);
        ps.setString(42, treinun_cantidad);
        ps.setString(43, treindos_peso);
        ps.setString(44, treintres_remitente);
        ps.setString(45, treintres_direccion);
        ps.setString(46, treintres_pais);
        ps.setString(47, treincua_destinatario);
        ps.setString(48, treincua_direccion);
        ps.setString(49, treincua_pais);
        ps.setString(50, treincin_consignatario);
        ps.setString(51, treincin_direccion);
        ps.setString(52, treincin_pais);
        ps.setString(53, treinsei_documento);
        ps.setString(54, treinsei_fecha);
        ps.setString(55, treinsei_factura);
        ps.setString(56, treinsei_codigo);
        ps.setString(57, treinsie_numprecinto);
        ps.setString(58, treinocho_descripcion);
        ps.setString(59, cuaren_nrodata);
        ps.setString(60, idconductor);
        ps.setString(61, idrampla);
        ps.setString(62, veindos_rampla);
        ps.setString(63, nueve_codigo);
        ps.setString(64, diesei_codigo);
        ps.setString(65, treinnuev_fecha);
        ps.setString(66, quince_re);
        ps.setString(67, quince_se);
        ps.setString(68, veindos_re);
        ps.setString(69, veindos_se);
        ps.setString(70, treinsei_texto);
        ps.setString(71, idmic);

        if (ps.executeUpdate() == 1) {
            response.sendRedirect("mic_list.jsp");
        }
    } else if (orden.equals("eliminar")) {
        consulta = "delete from mic where idmic=?";
        ps = conex.prepareStatement(consulta);
        ps.setString(1, idmic);
        if (ps.executeUpdate() == 1) {
            response.sendRedirect("mic_list.jsp");
        } else {
            out.print("No es posible eliminar");
        }
    } else {
        out.print("Accion invalida");
    }


    conex.close();
%>