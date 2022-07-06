<%@ include file="header.jsp" %> <% Connect con = Connect.getConnection();
String query = String.format("SELECT * FROM ms_user"); if(UserId != null){ query
= String.format("SELECT * FROM ms_user WHERE NOT UserId = (%d)", UserId); }
ResultSet rs = con.executeQuery(query); %>
<section class="container content align-items-start">
  <h1 class="w-100 text-center">User List</h1>
  <div class="btn-group filter">
    <button type="button" class="btn text-white dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
      Action
    </button>
    <div class="dropdown-menu">
      <a class="dropdown-item" href="#">Action</a>
      <a class="dropdown-item" href="#">Another action</a>
      <a class="dropdown-item" href="#">Something else here</a>
      <div class="dropdown-divider"></div>
      <a class="dropdown-item" href="#">Separated link</a>
    </div>
  </div>
  <div class="container-fluid d-flex flex-wrap justify-content-between">
    <% while(rs.next()){ %>
    <div class="card home-card-item mt-5" style="width: 18rem">
      <img src="assets/<%= rs.getString("UserProfile")%>" class="card-img-top"
      alt="<%= rs.getString("UserFullName")%> Profile Pic">
      <div class="card-body">
        <h5 class="card-title"><%= rs.getString("UserFullName")%></h5>
        <p class="card-text d-flex justify-content-end" style="font-size: 2rem;">
          <a href="<%= rs.getString("UserLinkedIn")%>" class="text-primary" target="_blank">
            <i class="fab fa-linkedin"></i>
          </a>
        </p>
      </div>
    </div>
    <div class="card home-card-item mt-5" style="width: 18rem">
      <img src="assets/<%= rs.getString("UserProfile")%>" class="card-img-top"
      alt="<%= rs.getString("UserFullName")%> Profile Pic">
      <div class="card-body">
        <h5 class="card-title"><%= rs.getString("UserFullName")%></h5>
        <p class="card-text d-flex justify-content-end" style="font-size: 2rem;">
          <a href="<%= rs.getString("UserLinkedIn")%>" class="text-primary" target="_blank">
            <i class="fab fa-linkedin"></i>
          </a>
        </p>
      </div>
    </div>
    <div class="card home-card-item mt-5" style="width: 18rem">
      <img src="assets/<%= rs.getString("UserProfile")%>" class="card-img-top"
      alt="<%= rs.getString("UserFullName")%> Profile Pic">
      <div class="card-body">
        <h5 class="card-title"><%= rs.getString("UserFullName")%></h5>
        <p class="card-text d-flex justify-content-end" style="font-size: 2rem;">
          <a href="<%= rs.getString("UserLinkedIn")%>" class="text-primary" target="_blank">
            <i class="fab fa-linkedin"></i>
          </a>
        </p>
      </div>
    </div>
    <div class="card home-card-item mt-5" style="width: 18rem">
      <img src="assets/<%= rs.getString("UserProfile")%>" class="card-img-top"
      alt="<%= rs.getString("UserFullName")%> Profile Pic">
      <div class="card-body">
        <h5 class="card-title"><%= rs.getString("UserFullName")%></h5>
        <p class="card-text d-flex justify-content-end" style="font-size: 2rem;">
          <a href="<%= rs.getString("UserLinkedIn")%>" class="text-primary" target="_blank">
            <i class="fab fa-linkedin"></i>
          </a>
        </p>
      </div>
    </div>
    <% } %>
  </div>
</section>
<%@ include file="footer.html" %>
