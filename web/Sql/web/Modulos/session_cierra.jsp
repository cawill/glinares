<%
/*
 * Esta es otra forma de cerrar la session
                request.getSession().removeAttribute("login");
                request.getSession().invalidate();
                response.sendRedirect("mensaje_session_cierra.jsp");
 */
request.getSession().removeAttribute("login");
response.sendRedirect("mensaje_session_cierra.jsp");
%>
