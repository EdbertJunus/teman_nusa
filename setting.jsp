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
    String UserAccountType = rs.getString("UserAccountType");
    Integer UserWallet = rs.getInt("UserWalletBalance");
    Integer accountPrice = 0;
    if(UserAccountType.equals("Public")){
        accountPrice = 50;
    }else{
        accountPrice = 5;
    }
%>
<section class="container content align-items-start">
  <h1 class="w-100 text-center">User List</h1>
    <div class="container-fluid user-info">
        <img src="assets/<%= rs.getString("UserProfile")%>" class="img-fluid" alt="<%= rs.getString("UserFullName")%>" style="width: 18rem; height: fit-content;" />
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
                >Job Type</label
                >
                <div class="col-sm-8 d-flex flex-wrap justify-content-end align-items-center">
                <%

                String query_user_job = String.format("SELECT * FROM ms_user_chosen_job C INNER JOIN ms_job_type J ON C.JobTypeId=J.JobTypeId WHERE UserId = (%d)", UserId);
                rs = con.executeQuery(query_user_job); 
                while(rs.next()){
                %>
                    <span class="badge badge-info mr-1 mb-1" style="font-size: 85%;"><%= rs.getString("JobTypeName")%></span>
                <%
                }
                %>
                </div>
            </div>
            <div class="form-group row">
                <label for="account" class="col-sm-4 font-weight-bold col-form-label"
                >Account Type</label
                >
                <div class="col-sm-8 d-flex justify-content-end align-items-center">
                <p class="font-weight-normal m-0">
                    <%= UserAccountType%>
                </p>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-12 d-flex flex-column justify-content-end">
                    <button type="button" id="chg-acc-btn" class="btn btn-primary w-auto">Change Account Type</button>
                    <div class="warning-msg" id="warning-msg">
                        <p class="text-success">Current Wallet Balance: <%= UserWallet%></p>
                        <%
                            if(UserWallet > accountPrice){
                        %>
                            <p class="text-secondary">You will be charged <%= accountPrice%> coin for changing account type</p>
                            <a class="btn btn-success btn-lg mb-2" href="controller/handleAccountType.jsp?type=<%=UserAccountType%>&price=<%= UserWallet-accountPrice%>&id=<%= UserId%>"  role="button">Yes</a>
                            <a class="btn btn-danger btn-lg mb-2" href="#" id="chg-btn-no" role="button">No</a>
                        <%
                            }else{
                        %>
                            <p class="text-warning">You have not enough money please top up</p>
                        <%
                            }
                        %>
                    </div>
                </div>

            </div>
        </div>
    </div>
</section>
<%@ include file="footer.html" %> 
