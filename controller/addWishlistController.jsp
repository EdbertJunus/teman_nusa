<%@ include file="../database/connect.jsp"%>
<%

    Connect con = Connect.getConnection();
    Integer UserId = (Integer) session.getAttribute("UserId");
    Integer FavoritedUserId = Integer.parseInt(request.getParameter("FavoritedUserId"));

    String query = String.format("SELECT * from ms_wishlist WHERE UserId = (%d) AND FavoritedUserId = (%d)", UserId, FavoritedUserId);
    ResultSet rs = con.executeQuery(query);

    if(!rs.isBeforeFirst()){
        query = String.format("INSERT INTO ms_wishlist (UserId, FavoritedUserId) VALUES (%d, %d)", UserId, FavoritedUserId);
        con.executeUpdate(query); 
    }else{
        query = String.format("DELETE FROM ms_wishlist WHERE UserId = (%d) AND FavoritedUserId = (%d)", UserId, FavoritedUserId);
        con.executeUpdate(query); 
    }
 
    

    response.sendRedirect("../user-detail.jsp?userId="+FavoritedUserId+"");

%>