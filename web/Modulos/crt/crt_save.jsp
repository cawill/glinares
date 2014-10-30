<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@include file="../conexion.jsp"%>
<%
String orden=request.getParameter("accion");


String idcrt=request.getParameter("idcrt");
String idcliente=request.getParameter("idcliente");
String numero_2=request.getParameter("numero_2");
String detalle_transportista=request.getParameter("detalle_transportista");
String destinatario_4=request.getParameter("destinatario_4");
String consignatario_6=request.getParameter("consignatario_6");
String notificar_9=request.getParameter("notificar_9");
String idpais=request.getParameter("idpais");
String lugarporteador_7=request.getParameter("lugarporteador_7");
String lugarentrega_8=request.getParameter("lugarentrega_8");
String fechaemision_5=request.getParameter("fechaemision_5");
String porteadorsucesivo_10=request.getParameter("porteadorsucesivo_10");
String detallebultos_11=request.getParameter("detallebultos_11");
String pesobruto_12=request.getParameter("pesobruto_12");
String volumen_13=request.getParameter("volumen_13");
String valor_14=request.getParameter("valor_14");
String moneda_14=request.getParameter("moneda_14");
String gastos_15=request.getParameter("gastos_15");
String remitente_15a=request.getParameter("remitente_15a");
String remitente_15b=request.getParameter("remitente_15b");
String montoremitente_15a=request.getParameter("montoremitente_15a");
String montoremitente_15b=request.getParameter("montoremitente_15b");
String totalremitente_15=request.getParameter("totalremitente_15");
String moneda_15a=request.getParameter("moneda_15a");
String destinatario_15a=request.getParameter("destinatario_15a");
String destinatario_15b=request.getParameter("destinatario_15b");
String monto_15a=request.getParameter("monto_15a");
String monto_15b=request.getParameter("monto_15b");
String totalmonto_15=request.getParameter("totalmonto_15");
String moneda_15b=request.getParameter("moneda_15b");
String valormercancia_16=request.getParameter("valormercancia_16");
String anexos_17=request.getParameter("anexos_17");
String instruccionesaduana_18=request.getParameter("instruccionesaduana_18");
String montofleteextern_19=request.getParameter("montofleteextern_19");
String montorembolso_20=request.getParameter("montorembolso_20");
String nombrefirmaremitente_21=request.getParameter("nombrefirmaremitente_21");
String fecha_21=request.getParameter("fecha_21");
String declaraciones_22=request.getParameter("declaraciones_22");
String nombreporteador_23=request.getParameter("nombreporteador_23");
String fechaporteador_23=request.getParameter("fechaporteador_23");
String nombrefirmadestin_24=request.getParameter("nombrefirmadestin_24");
String fechadestin_24=request.getParameter("fechadestin_24");
String fechaport_7=request.getParameter("fechaport_7");



if(orden.equals("guardar") && (idcliente.length()>0) ){
    consulta="INSERT INTO crt(idcliente,numero_2,detalle_transportista,destinatario_4,consignatario_6,"
            + "notificar_9,idpais,lugarporteador_7,lugarentrega_8,fechaemision_5,porteadorsucesivo_10,"
            + "detallebultos_11,pesobruto_12,volumen_13,valor_14,moneda_14,gastos_15,remitente_15a,remitente_15b,"
            + "montoremitente_15a,montoremitente_15b,totalremitente_15,moneda_15a,destinatario_15a,destinatario_15b,"
            + "monto_15a,monto_15b,totalmonto_15,moneda_15b,valormercancia_16,anexos_17,instruccionesaduana_18,"
            + "montofleteextern_19,montorembolso_20,nombrefirmaremitente_21,fecha_21,declaraciones_22,"
            + "nombreporteador_23,fechaporteador_23,nombrefirmadestin_24,fechadestin_24,fechaport_7)"
            + " VALUES (?, ?, ?, ?, ?,?, ?, ?, ?, ?,?, ?, ?, ?, ?,?, ?, ?, ?, ?,?,"
            + " ?, ?, ?, ?,?, ?, ?, ?, ?,?, ?, ?, ?, ?,?, ?, ?, ?, ?,?,?);";
    ps=conex.prepareStatement(consulta);
    
    //ps.setString(1, idcrt);
    ps.setString(1, idcliente);
    ps.setString(2, numero_2);
    ps.setString(3, detalle_transportista);
    ps.setString(4, destinatario_4);
    ps.setString(5, consignatario_6);
    ps.setString(6, notificar_9);
    ps.setString(7, idpais);
    ps.setString(8, lugarporteador_7);
    ps.setString(9, lugarentrega_8);
ps.setString(10, fechaemision_5);
ps.setString(11, porteadorsucesivo_10);
ps.setString(12, detallebultos_11);
ps.setString(13, pesobruto_12);
ps.setString(14, volumen_13);
ps.setString(15, valor_14);
ps.setString(16, moneda_14);
ps.setString(17, gastos_15);
ps.setString(18, remitente_15a);
ps.setString(19, remitente_15b);
    ps.setString(20, montoremitente_15a);
    ps.setString(21, montoremitente_15b);
    ps.setString(22, totalremitente_15);
    ps.setString(23, moneda_15a);
    ps.setString(24, destinatario_15a);
    ps.setString(25, destinatario_15b);
    ps.setString(26, monto_15a);
    ps.setString(27, monto_15b);
    ps.setString(28, totalmonto_15);
    ps.setString(29, moneda_15b);
ps.setString(30, valormercancia_16);
ps.setString(31, anexos_17);
ps.setString(32, instruccionesaduana_18);
ps.setString(33, montofleteextern_19);
ps.setString(34, montorembolso_20);
ps.setString(35, nombrefirmaremitente_21);
ps.setString(36, fecha_21);
ps.setString(37, declaraciones_22);
ps.setString(38, nombreporteador_23);
ps.setString(39, fechaporteador_23);
    ps.setString(40, nombrefirmadestin_24);
    ps.setString(41, fechadestin_24);
    ps.setString(42, fechaport_7);

    if(ps.executeUpdate()==1){
        response.sendRedirect("crt_list.jsp");
    }else{
        out.print("No es posible guardar crt");
    }
}else if(orden.equals("actualizar") ){
    consulta="UPDATE crt SET numero_2=?,detalle_transportista=?, "
            + "fechaemision_5=?,porteadorsucesivo_10=?, "
            + "detallebultos_11=?,pesobruto_12=?,volumen_13=?,valor_14=?,moneda_14=?,gastos_15=?,remitente_15a=?,"
            + "remitente_15b=?,montoremitente_15a=?,montoremitente_15b=?,totalremitente_15=?,moneda_15a=?,"
            + "destinatario_15a=?,destinatario_15b=?,monto_15a=?,monto_15b=?,totalmonto_15=?,moneda_15b=?,"
            + "valormercancia_16=?,anexos_17=?,instruccionesaduana_18=?,montofleteextern_19=?,montorembolso_20=?,"
            + "nombrefirmaremitente_21=?,fecha_21=?,declaraciones_22=?,nombreporteador_23=?,fechaporteador_23=?,"
            + "nombrefirmadestin_24=?,fechadestin_24=?, fechaport_7=? "
            + "WHERE idcrt=?";
    ps=conex.prepareStatement(consulta);
    ps.setString(1, numero_2);
    ps.setString(2, detalle_transportista);
  ps.setString(3, fechaemision_5);
ps.setString(4, porteadorsucesivo_10);
ps.setString(5, detallebultos_11);
ps.setString(6, pesobruto_12);
ps.setString(7, volumen_13);
ps.setString(8, valor_14);
ps.setString(9, moneda_14);
ps.setString(10, gastos_15);
ps.setString(11, remitente_15a);
ps.setString(12, remitente_15b);
    ps.setString(13, montoremitente_15a);
    ps.setString(14, montoremitente_15b);
    ps.setString(15, totalremitente_15);
    ps.setString(16, moneda_15a);
    ps.setString(17, destinatario_15a);
    ps.setString(18, destinatario_15b);
    ps.setString(19, monto_15a);
    ps.setString(20, monto_15b);
    ps.setString(21, totalmonto_15);
    ps.setString(22, moneda_15b);
ps.setString(23, valormercancia_16);
ps.setString(24, anexos_17);
ps.setString(25, instruccionesaduana_18);
ps.setString(26, montofleteextern_19);
ps.setString(27, montorembolso_20);
ps.setString(28, nombrefirmaremitente_21);
ps.setString(29, fecha_21);
ps.setString(30, declaraciones_22);
ps.setString(31, nombreporteador_23);
ps.setString(32, fechaporteador_23);
    ps.setString(33, nombrefirmadestin_24);
    ps.setString(34, fechadestin_24);
    ps.setString(35, fechaport_7);
    
    ps.setString(36, idcrt);

    if(ps.executeUpdate()==1){
        response.sendRedirect("crt_list.jsp");
    }else{
        out.print("No es posible actualizar crt");
    }
}else if(orden.equals("eliminar") && (idcrt.length()>0) ){
    consulta="DELETE FROM crt WHERE idcrt=? ;";
    ps=conex.prepareStatement(consulta);
    ps.setString(1, idcrt);
    if(ps.executeUpdate()==1){
        response.sendRedirect("crt_list.jsp");
    }else{
        out.print("No es posible eliminar crt");
    }
}else{
    out.print("Accion invalida...");
}
%>