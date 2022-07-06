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
%>
<section class="container content align-items-start">
  <h1 class="w-100 text-center">User List</h1>
    <div class="container-fluid user-info">
        <img src="assets/<%= rs.getString("UserProfile")%>" class="img-fluid" alt="<%= rs.getString("UserFullName")%>" style="width: 18rem" />
        <div class="container-fluid user-info-list">
            <div class="form-group row">
                <label for="email" class="col-sm-4 font-weight-bold col-form-label">
                    Email
                </label>
                <div class="col-sm-8 d-flex justify-content-end align-items-center">
                <p class="font-weight-normal m-0">
                    <%= rs.getString("UserEmail")%>
                </p>
                </div>
            </div>
            <div class="form-group row">
                <label for="gender" class="col-sm-4 font-weight-bold col-form-label"
                >Gender</label
                >
                <div class="col-sm-8 d-flex justify-content-end align-items-center">
                <p class="font-weight-normal m-0">
                    <%= rs.getString("UserGender")%>
                </p>
                </div>
            </div>
            <div class="form-group row">
                <label for="linkedin" class="col-sm-4 font-weight-bold col-form-label"
                >LinkedIn</label
                >
                <div class="col-sm-8 d-flex justify-content-end align-items-center">
                <p class="m-0 w-100 text-right">
                    <a href="<%= rs.getString("UserLinkedIn")%>" target="_blank" class="font-weight-normal">
                        <%= rs.getString("UserLinkedIn")%>
                    </a>
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
    </div>
</section>
<%@ include file="footer.html" %> 
