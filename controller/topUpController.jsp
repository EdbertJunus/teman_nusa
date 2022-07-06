<%@ include file="../database/connect.jsp"%>

<%
    Integer newBalance = Integer.parseInt(request.getParameter("balance"));
    Integer UserId = Integer.parseInt(request.getParameter("id"));


    Connect con = Connect.getConnection(); 
    String query = String.format("UPDATE ms_user SET UserWalletBalance = (%d) WHERE UserId = (%d)", newBalance, UserId);
    con.executeUpdate(query); 
    
    response.sendRedirect("../wallet.jsp");

%>