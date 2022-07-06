<%
    session.removeAttribute("UserId");
    response.sendRedirect("../index.jsp");

%>