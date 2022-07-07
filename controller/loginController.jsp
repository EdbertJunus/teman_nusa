<%@ page import="java.util.*" %>
<%@ include file="../database/connect.jsp" %>

<%
    String UserEmail = request.getParameter("email");
    String UserPassword = request.getParameter("password");

    Connect con = Connect.getConnection();
    String query = String.format("SELECT * FROM ms_user WHERE UserEmail = ('%s')", UserEmail);
    ResultSet rs = con.executeQuery(query);
    
    if(UserEmail.length() == 0){
        response.sendRedirect("../login.jsp?err=Email must be filled");
        return;
    }else if(!rs.next()){
        response.sendRedirect("../login.jsp?err=Email is not registered");
        return;
    }

    if(UserPassword.length() == 0){
        response.sendRedirect("../login.jsp?err=Password must be filled");
        return;
    }else if(UserPassword.length() < 8){
        response.sendRedirect("../login.jsp?err=Password must contain minimal 8 characters");
        return;
    }else if(!UserPassword.matches("(?=.*[0-9])(?=.*[a-zA-Z])([a-zA-Z0-9]+)")){
        response.sendRedirect("../login.jsp?err=Password must contain numbers and alphabeths");
        return;
    }else if(!UserPassword.equals(rs.getString("UserPassword"))){
        response.sendRedirect("../login.jsp?err=Password is not correct");
        return;
    }

    //Create Session
    session.setAttribute("UserId", rs.getInt("UserId"));
    response.sendRedirect("../index.jsp");

%>

