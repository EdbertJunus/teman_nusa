<%@ include file="../database/connect.jsp"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
    Integer newBalance = Integer.parseInt(request.getParameter("balance"));
    Integer UserId = Integer.parseInt(request.getParameter("id"));

    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
    Date today = new Date();

    Connect con = Connect.getConnection(); 
    String query = String.format("UPDATE ms_user SET UserWalletBalance = (%d) WHERE UserId = (%d)", newBalance, UserId);
    con.executeUpdate(query); 
    
    //Add to Transaction
    query = String.format("INSERT INTO ms_transaction (UserId, TransactionDate, TransactionType) VALUES (%d, '%s', 'Top Up Coin')", UserId, formatter.format(today));
    ResultSet st = con.executeUpdate(query).getGeneratedKeys();
    st.next();
    int TransactionId = st.getInt(1);

    //Add Detail Transaction
    query = String.format("INSERT INTO ms_transaction_detail (TransactionId, TransactionItemName, TransactionItemPrice) VALUES (%d, '%s', %d)", TransactionId,  "Top Up Coin", 100);
    con.executeUpdate(query);
    
    response.sendRedirect("../wallet.jsp");

%>