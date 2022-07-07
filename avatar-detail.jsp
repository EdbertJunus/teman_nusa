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

    Integer avatarId = Integer.parseInt(request.getParameter("avatarId"));

    query = String.format("SELECT * FROM ms_user_avatar_collection AC WHERE AC.AvatarId = (%d) AND AC.UserId = (%d)", avatarId, UserId);
    rs = con.executeQuery(query);

    Boolean haveAvatar = rs.isBeforeFirst();

    query = String.format("SELECT * FROM ms_avatar WHERE AvatarId = (%d)", avatarId);
    rs = con.executeQuery(query); 
    if(!rs.next()){
        response.sendRedirect("index.jsp"); 
        return; 
    }
    
%>
<section class="container content">
    <input type="hidden" id="avatarId" value="<%= avatarId%>"/>
    <h1 class="w-100 text-center">
        Avatar #<%= rs.getString("avatarId")%>
    </h1>
    <div class="container-fluid avatar-detail">
        <img src="<%= rs.getString("AvatarImageURL")%>" class="img-fluid"
        alt="<%= rs.getString("AvatarImageURL")%>" style="width: 32rem" />
        <div class="avatar-detail-info">
            <h3 class="m-0 font-weight-light">Price</h3>
            <h1 class="display-3"><%= rs.getInt("AvatarPrice")%> coins</h1>
            <%
                if(!haveAvatar){
            %>
            <button type="button" id="chg-acc-btn" class="btn btn-primary">Buy Now</button>
            <div class="confirmation-msg" id="confirmation-msg">
                <p class="text-success">Current Wallet Balance: <%= UserWallet%></p>
                <%
                    if(UserWallet > rs.getInt("AvatarPrice")){
                %>
                    <p class="text-secondary">You will be charged <%= rs.getInt("AvatarPrice")%> coin for changing account type</p>
                    <a class="btn btn-success btn-lg mb-2" href="controller/handleAvatarTransaction.jsp?avatarPrice=<%= rs.getInt("AvatarPrice")%>&wallet=<%= UserWallet%>&userId=<%= UserId%>&avatarId=<%= avatarId%>&avatarURL=<%= rs.getString("AvatarImageURL")%>"  role="button">Yes</a>
                    <a class="btn btn-danger btn-lg mb-2" href="#" id="chg-btn-no" role="button">No</a>
                <%
                    }else{
                %>
                    <p class="text-warning"><a href="wallet.jsp">You have not enough money please top up </a></p>
                <%
                    }
                %>
            </div>
            <%
                }else{
            %>
            <h4 class="text-info">You have the avatar already</h4>
            <%
                }
            %>
        </div>
    </div>
</section>
<%@ include file="footer.html" %>
