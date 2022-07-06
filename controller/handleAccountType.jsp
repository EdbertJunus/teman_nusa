<%@ include file="../database/connect.jsp"%>

<%
    String type = request.getParameter("type");
    Integer newBalance = Integer.parseInt(request.getParameter("price"));
    String newType = "Public";
    Integer UserId = Integer.parseInt(request.getParameter("id"));

    if(type.equals("Public")){
        newType = "Private";
    }

    Connect con = Connect.getConnection(); 
    String query = String.format("UPDATE ms_user SET UserWalletBalance = (%d), UserAccountType = ('%s') WHERE UserId = (%d)", newBalance, newType, UserId);
    con.executeUpdate(query); 
    
    response.sendRedirect("../setting.jsp");

%>