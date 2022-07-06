<%@ include file="../database/connect.jsp" %>

<%
    Integer payment = Integer.parseInt((String)request.getParameter("payment"));
    Integer price = Integer.parseInt((String)request.getParameter("price"));

    if(price > payment){
        session.setAttribute("UserMemberPrice", request.getParameter("payment"));
        response.sendRedirect("../register-payment.jsp");
        return;
    }

    String UserFullName = (String)session.getAttribute("UserFullName");
    String UserEmail = (String)session.getAttribute("UserEmail");
    String UserGender = (String)session.getAttribute("UserGender");
    String[] UserJobType = (String[])session.getAttribute("UserJobType");
    String UserLinkedIn = (String)session.getAttribute("UserLinkedIn");
    String UserHandphone = (String)session.getAttribute("UserHandphone");
    String UserPassword = (String)session.getAttribute("UserPassword");

    Integer surplus = payment - price;


    Connect con = Connect.getConnection();
    String query_insert_user = String.format("INSERT INTO ms_user (UserFullName, UserGender, UserLinkedIn, UserHandphone, UserRegisterPrice, UserEmail, UserPassword, UserWalletBalance, UserAccountType) VALUES ('%s', '%s', '%s', '%s', %d, '%s', '%s', %d, '%s')", UserFullName, UserGender, UserLinkedIn, UserHandphone, price, UserEmail, UserPassword, surplus+100, "Public");
    con.executeUpdate(query_insert_user);

    session.removeAttribute("UserFullName");
    session.removeAttribute("UserEmail");
    session.removeAttribute("UserGender");
    session.removeAttribute("UserJobType");
    session.removeAttribute("UserLinkedIn");
    session.removeAttribute("UserHandphone");
    session.removeAttribute("UserMemberPrice");
    session.removeAttribute("UserPassword");

    session.removeAttribute("onGoingRandomPrice");
    
    response.sendRedirect("../login.jsp");    

%>