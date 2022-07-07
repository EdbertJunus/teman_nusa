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

    Integer senderId = 0;
    String senderName = "";

    Boolean haveAvatar = rs.isBeforeFirst();
    if(rs.next()){
        senderId = rs.getInt("SenderUserId");
    }

    query = String.format("SELECT UserFullName from ms_user WHERE UserId = (%d)", senderId);
    rs = con.executeQuery(query);
    if(rs.next()){
        senderName = rs.getString("UserFullName");
    }

    query = String.format("SELECT * from ms_user U LEFT JOIN ms_user_avatar_collection C ON U.UserId = C.UserId WHERE NOT U.UserId = (%d)", UserId);
    rs = con.executeQuery(query);

    ArrayList<Integer> userIdList = new ArrayList<Integer>();
    ArrayList<String> userNameList = new ArrayList<String>();

    while(rs.next()){
        if(rs.getInt("AvatarId") != avatarId){
            userIdList.add(rs.getInt("UserId"));
            userNameList.add(rs.getString("UserFullName"));
        }

    } 

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
                if(senderName.length() != 0){
                    %>
                        <p class="py-1 mb-5 text-info">Gift from <%= senderName%></p>
                    <%
                }
            %>
            <form name="giftForm" action="controller/avatarGiftController.jsp" method="post">
                <input type="hidden" name="avatarId" value="<%= avatarId%>"/>
                <button type="button" id="chg-acc-btn" class="btn btn-primary">Give Avatar to Friend</button>
                <div class="confirmation-msg" id="confirmation-msg">
                    <div class="form-group">
                        <label for="giftFriendId">Friends Name</label>
                        <select name="giftFriendId" id="giftFriendId" class="custom-select" required>
                            <option selected disabled value="">Choose...</option>
                            <%
                                for(int i=0; i<userIdList.size(); i++){
                            %>
                                <option value="<%= userIdList.get(i)%>"><%= userNameList.get(i)%></option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                    <p class="text-secondary">Are you sure you want to give this to your friend</p>
                    <button class="btn btn-success btn-lg mb-2" type="submit">Yes</button>
                    <a class="btn btn-danger btn-lg mb-2" href="#" id="chg-btn-no" role="button">No</a>
                </div>
            </form>
            <%
                }
            %>
        </div>
    </div>
</section>
<%@ include file="footer.html" %>
