<%@ include file="header.jsp" %>

<% 
    if(UserId == null){
        response.sendRedirect("login.jsp?err=Login first to access user detail"); 
        return; 
    } 
    Connect con = Connect.getConnection();
    ResultSet rs;
  
%>
<section class="container content align-items-start">
  <h1 class="w-100 text-center">Collection Angels</h1>
  <div class="container-fluid d-flex flex-wrap flex-row justify-content-between">
        <%
            String query = String.format("SELECT * FROM ms_avatar A LEFT JOIN ms_user_avatar_collection AC ON A.AvatarId = AC.AvatarId WHERE AC.UserId = (%d) AND AC.SenderUserId IS NOT NULL", UserId); 

            rs = con.executeQuery(query); 

            if(!rs.isBeforeFirst()){
                %>
                    <div class="w-100 text-center pt-5">
                        <h2 class="text-info">No collections currently</h2>
                    </div>
                <%
            }
            
            while(rs.next()){   
        %>
                <div class="card home-card-item mt-5" style="width: 18rem">
                    <a href="avatar-detail.jsp?avatarId=<%= rs.getInt("AvatarId")%>">
                        <img src="<%= rs.getString("AvatarImageURL")%>" class="card-img-top"
                        alt="Avatar_<%= rs.getInt("AvatarId")%>">
                        <div class="card-body d-flex flex-column justify-content-between">
                            <h5 class="card-title"><%= rs.getString("AvatarPrice")%> coins</h5>
                        </div>
                    </a>
                </div>
        <% 
            } 
        %>
  </div>
</section>
<%@ include file="footer.html" %>
