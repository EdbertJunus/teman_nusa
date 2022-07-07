<%@ include file="../database/connect.jsp"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
    Integer avatarPrice = Integer.parseInt(request.getParameter("avatarPrice"));
    Integer oldBalance = Integer.parseInt(request.getParameter("wallet"));
    Integer UserId = Integer.parseInt(request.getParameter("userId"));
    Integer AvatarId = Integer.parseInt(request.getParameter("avatarId"));
    String avatarURL = request.getParameter("avatarURL");

    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
    Date today = new Date();

    Integer newBalance = oldBalance - avatarPrice;
    Connect con = Connect.getConnection(); 
    //Change Balance
    String query = String.format("UPDATE ms_user SET UserWalletBalance = (%d) WHERE UserId = (%d)", newBalance, UserId);
    con.executeUpdate(query); 

    //Add to Avatar Collection
    query = String.format("INSERT INTO ms_user_avatar_collection (UserId, AvatarId) VALUES (%d, %d)", UserId, AvatarId);
    con.executeUpdate(query);

    //Add to Transaction
    query = String.format("INSERT INTO ms_transaction (UserId, TransactionDate, TransactionType) VALUES (%d, '%s', 'Avatar')", UserId, formatter.format(today));
    ResultSet st = con.executeUpdate(query).getGeneratedKeys();
    st.next();
    int TransactionId = st.getInt(1);

    //Add Detail Transaction
    query = String.format("INSERT INTO ms_transaction_detail (TransactionId, TransactionItemName, TransactionImageURL, TransactionItemPrice) VALUES (%d, '%s', '%s', %d)", TransactionId, Integer.toString(AvatarId), avatarURL, avatarPrice);
    con.executeUpdate(query);

    response.sendRedirect("../avatar-detail.jsp?avatarId="+AvatarId+"");

%>