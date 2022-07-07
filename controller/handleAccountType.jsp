<%@ include file="../database/connect.jsp"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
    String type = request.getParameter("type");
    Integer newBalance = Integer.parseInt(request.getParameter("price"));
    String newType = "Public";
    Integer UserId = Integer.parseInt(request.getParameter("id"));

    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
    Date today = new Date();
    Integer changePrice = 5;

    if(type.equals("Public")){
        newType = "Private";
        changePrice = 50;
    }

    Connect con = Connect.getConnection(); 
    String query = String.format("UPDATE ms_user SET UserWalletBalance = (%d), UserAccountType = ('%s') WHERE UserId = (%d)", newBalance, newType, UserId);
    con.executeUpdate(query); 

    //Add to Transaction
    query = String.format("INSERT INTO ms_transaction (UserId, TransactionDate, TransactionType) VALUES (%d, '%s', 'Change Account Visibility')", UserId, formatter.format(today));
    ResultSet st = con.executeUpdate(query).getGeneratedKeys();
    st.next();
    int TransactionId = st.getInt(1);

    //Add Detail Transaction
    query = String.format("INSERT INTO ms_transaction_detail (TransactionId, TransactionItemName, TransactionItemPrice) VALUES (%d, '%s', %d)", TransactionId,  newType, changePrice);
    con.executeUpdate(query);
    
    response.sendRedirect("../setting.jsp");

%>