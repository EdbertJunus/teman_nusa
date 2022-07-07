<%@ include file="../database/connect.jsp"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
    Integer ReceiverId = Integer.parseInt(request.getParameter("receiverId"));
    Integer SenderId = (Integer) session.getAttribute("UserId");
    String ChatContent = request.getParameter("chatContent");
    
    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
    Date today = new Date();

    Connect con = Connect.getConnection(); 
    String query = String.format("INSERT INTO ms_chat (SenderId, ReceiverId, ChatContent, ChatDateTime) VALUES (%d, %d, '%s', '%s')", SenderId, ReceiverId, ChatContent, formatter.format(today));
    con.executeUpdate(query);
    
    response.sendRedirect("../user-detail.jsp?userId="+ReceiverId);

%>