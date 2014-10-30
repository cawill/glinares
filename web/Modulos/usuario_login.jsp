<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@include file="conexion.jsp" %>
<%
String login=request.getParameter("login");
String password=request.getParameter("password");

consulta="select * from usuario where login=? and password=? and estado='1'"; //cadena de consulta
ps=conex.prepareStatement(consulta);
ps.setString(1, login);
ps.setString(2, password);
rs=ps.executeQuery();
if(rs.next()){
    request.getSession().setAttribute("login", login);//guarda su login en la session
    response.sendRedirect("../indexFrame.jsp");
}else{
    response.sendRedirect("../index.jsp");//si no encuentra resultados reenvia al formulario validate_login
    
}
//cerramos la conexion
conex.close();
%>