<%@ include file="header.jsp" %>
<% 
    if(UserId == null){
        response.sendRedirect("login.jsp?err=Login first to access user detail"); 
        return; 
    } 

    Connect con = Connect.getConnection(); 
    String query = String.format("SELECT * FROM ms_user WHERE UserId = (%d)", UserId);
    ResultSet rs = con.executeQuery(query); 
    rs.next();
    Integer UserWallet = rs.getInt("UserWalletBalance");
    
%>
<section class="container content align-items-start">
  <h1 class="w-100 text-center">My Wallet</h1>
    <div class="container-fluid user-info d-flex justify-content-between align-items-center">
        <div class="balance-group">
            <h3>BALANCE: </h3>
            <h1><%= UserWallet%> coins</h1>
        </div>
        <div class="top-up-group d-flex flex-column justify-content-center">
            <p class="text-info">Every top up will add 100 coins</p>
            <a class="btn btn-success btn-lg mb-2" href="controller/topUpController.jsp?balance=<%= UserWallet+100%>&id=<%= UserId%>"  role="button">Top Up Now</a>
        </div>
    </div>
</section>
<%@ include file="footer.html" %> 
