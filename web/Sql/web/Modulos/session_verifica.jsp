<%
            String session_login = null;
            if (request.getSession().getAttribute("login") != null) {

                session_login = (String) request.getSession().getAttribute("login");
                
            } else {
                
            response.sendRedirect("Modulos/error_session.jsp");

            }
%>