<%-- 
    Document   : Reporte
    Created on : 05/02/2012, 05:13:43 PM
    Author     : MAGWI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="net.sf.jasperreports.engine.*" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@include file="demo.jsp" %>
<%@include file="../conexion.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    </head>
    <body>
        <h1>Hello World!</h1>
        

<% 

//Connection conexion; 
//Class.forName("com.mysql.jdbc.Driver").newInstance(); 
//conexion = DriverManager.getConnection("jdbc:mysql://localhost/grupolinares","root","");  
String idc="";
try{
String sql="select*from boleta where idboleta='"+nombre+"';";
ps = conex.prepareStatement(sql);
rs = ps.executeQuery();
while(rs.next()){
idc=rs.getString("idboleta");
}

/*ruta del reporte*/ 
File reportFile = new File(application.getRealPath("Modulos/reportes/RepBoleta.jasper")); 
 
/*enviando parametros */
 
Map parameters = new HashMap(); 
parameters.put("rbol", idc); 
 
/*Enviamos la ruta del reporte, los parámetros y la conexión*/ 
byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath (), parameters, 
conex); 
 
/* en formato PDF*/ 
response.setContentType("application/pdf"); 
response.setContentLength(bytes.length); 
ServletOutputStream ouputStream = response.getOutputStream(); 
ouputStream.write(bytes, 0, bytes.length); 

ouputStream.flush(); 
ouputStream.close(); 
}catch(Exception e){e.printStackTrace();}
%> 
    </body>
</html>

