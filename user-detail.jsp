<%@ include file="header.jsp" %> 
<% 
    if(UserId == null){
        response.sendRedirect("login.jsp?err=Login first to access user detail"); 
        return; 
    } 
  
    Connect con = Connect.getConnection(); 
    Integer UserDetailId = Integer.parseInt(request.getParameter("userId")); 
    String query = String.format("SELECT * FROM ms_user WHERE UserId = (%d)", UserDetailId);
    ResultSet rs = con.executeQuery(query); 
    if(!rs.next()){
        response.sendRedirect("index.jsp"); 
        return; 
    }
    
%>
<section class="container content">
  <input type="hidden" id="UserDetailId" value="<%= UserDetailId%>"/>
  <h1 class="w-100 text-center"><%= rs.getString("UserFullName")%></h1>
  <div class="container-fluid user-info">
    <img src="assets/<%= rs.getString("UserProfile")%>" class="img-fluid"
    alt="<%= rs.getString("UserFullName")%>" style="width: 18rem" />
    <div class="container-fluid user-info-list">
      <div class="form-group row">
        <label for="email" class="col-sm-4 font-weight-bold col-form-label"
          >Email</label
        >
        <div class="col-sm-8 d-flex justify-content-end align-items-center">
          <p class="font-weight-normal m-0"><%= rs.getString("UserEmail")%></p>
        </div>
      </div>
      <div class="form-group row">
        <label for="gender" class="col-sm-4 font-weight-bold col-form-label"
          >Gender</label
        >
        <div class="col-sm-8 d-flex justify-content-end align-items-center">
          <p class="font-weight-normal m-0"><%= rs.getString("UserGender")%></p>
        </div>
      </div>
      <div class="form-group row">
        <label for="linkedin" class="col-sm-4 font-weight-bold col-form-label"
          >LinkedIn</label
        >
        <div class="col-sm-8 d-flex justify-content-end align-items-center">
          <p class="m-0 w-100">
            <a href="<%= rs.getString("UserLinkedIn")%>" target="_blank" class="font-weight-normal"
              ><%= rs.getString("UserLinkedIn")%></a
            >
          </p>
        </div>
      </div>
      <div class="form-group row">
        <label for="handphone" class="col-sm-4 font-weight-bold col-form-label"
          >Handphone</label
        >
        <div class="col-sm-8 d-flex justify-content-end align-items-center">
          <p class="font-weight-normal m-0">
            <%= rs.getString("UserHandphone")%>
          </p>
        </div>
      </div>
      <div class="form-group row">
        <label for="account" class="col-sm-4 font-weight-bold col-form-label"
          >Account Type</label
        >
        <div class="col-sm-8 d-flex justify-content-end align-items-center">
          <p class="font-weight-normal m-0">
            <%= rs.getString("UserAccountType")%>
          </p>
        </div>
      </div>
    </div>
    <div
      class="d-flex justify-content-end align-items-end thumb-wrapper"
      style="font-size: 2rem"
    >
      <%
        query = String.format("SELECT * from ms_wishlist WHERE UserId = (%d) AND FavoritedUserId = (%d)", UserId, UserDetailId);
        rs = con.executeQuery(query);
        
        if(!rs.isBeforeFirst()){
      %>
        <p class="thumb-icon m-0">
            <i class="far fa-thumbs-up"></i>
        </p>
      <%
        }else{
      %>
        <p class="thumb-icon m-0">
            <i class="fas fa-thumbs-up"></i>
        </p>
      <%
        }
      %>
    </div>
  </div>
</section>
<%@ include file="footer.html" %>
