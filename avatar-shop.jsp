<%@ include file="header.jsp" %>

<% 
  Connect con = Connect.getConnection();
  String[] jobTypeFilter = request.getParameterValues("jobType");
  String[] genderFilter = request.getParameterValues("gender");
  ResultSet rs;
  
%>
<section class="container content align-items-start">
  <h1 class="w-100 text-center">Avatar Shops</h1>
  <div class="container-fluid d-flex flex-wrap flex-row justify-content-between">
        <%
            String query = String.format("SELECT * FROM ms_avatar"); 

            rs = con.executeQuery(query); 

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
