<%@ include file="header.jsp" %> 
<% 
  Connect con = Connect.getConnection();
  String[] jobTypeFilter = request.getParameterValues("jobType");
  String[] genderFilter = request.getParameterValues("gender");
  ResultSet rs;
%>
<section class="container content align-items-start">
  <h1 class="w-100 text-center">User List</h1>
  <%@ include file="filterComponent.jsp" %>
  <div class="container-fluid d-flex flex-wrap justify-content-between">
    <%
      String query = String.format("SELECT * FROM ms_user U LEFT JOIN ms_user_chosen_job J ON U.UserId = J.UserId LEFT JOIN ms_job_type T ON J.JobTypeId = T.JobTypeId WHERE NOT (U.UserAccountType = 'Private') "); 
      String genderQuery = "";
      String jobQuery = "";
      
      if(genderFilter != null){
        genderQuery += "UserGender IN (";
        for(int i=0; i<genderFilter.length; i++){
          genderQuery += "'" + genderFilter[i] + "'";
          if(i!= (genderFilter.length - 1)){
              genderQuery += ",";
          }
        }
        genderQuery = "("+genderQuery+"))";
      }

      if(jobTypeFilter != null){
        jobQuery += "JobTypeName IN (";
        for(int i=0; i<jobTypeFilter.length; i++){
          jobQuery += "'" + jobTypeFilter[i] + "'";
          if(i!= (jobTypeFilter.length - 1)){
              jobQuery += ",";
          }
        }
        jobQuery = "("+jobQuery+"))";
      }
      
      if(UserId != null){ 
        query = String.format("SELECT * FROM ms_user U LEFT JOIN ms_user_chosen_job J ON U.UserId = J.UserId LEFT JOIN ms_job_type T ON J.JobTypeId = T.JobTypeId WHERE NOT (U.UserAccountType = 'Private') AND NOT U.UserId = (%d)", UserId); 

      }
      if(genderQuery.length() != 0){
          query += " AND " + genderQuery;
      }
      if(jobQuery.length() != 0){
        query += " AND " + jobQuery;
      }

      query += " GROUP BY U.UserId"; 
      rs = con.executeQuery(query); 

      ArrayList<Integer> userIdList = new ArrayList<Integer>();
      ArrayList<String> userProfileList = new ArrayList<String>();
      ArrayList<String> userNameList = new ArrayList<String>();
      ArrayList<String> userLinkedinList = new ArrayList<String>();

      if(!rs.isBeforeFirst()){
          %>
              <div class="w-100 text-center pt-5">
                  <h2 class="text-info">No Users currently</h2>
              </div>
          <%
      }

      while(rs.next()){ 
        userIdList.add(rs.getInt("UserId"));
        userProfileList.add(rs.getString("UserProfile"));
        userNameList.add(rs.getString("UserFullName"));
        userLinkedinList.add(rs.getString("UserLinkedIn"));
      }
      for(int i=0; i<userIdList.size(); i++){
      %>
        <div class="card home-card-item mt-5" style="width: 18rem">
          <a class="text-decoration-none" href="user-detail.jsp?userId=<%= userIdList.get(i)%>">
          <img src="assets/<%= userProfileList.get(i)%>" class="card-img-top"
          alt="<%= userNameList.get(i)%> Profile Pic">
          <div class="card-body d-flex flex-column justify-content-between">
            <h5 class="card-title"><%= userNameList.get(i)%></h5>
            <div>
            <%

              String query_user_job = String.format("SELECT * FROM ms_user_chosen_job C INNER JOIN ms_job_type J ON C.JobTypeId=J.JobTypeId WHERE UserId = (%d)", userIdList.get(i));
              rs = con.executeQuery(query_user_job); 
              while(rs.next()){
            %>
                <span class="badge badge-info"><%= rs.getString("JobTypeName")%></span>
            <%
              }
            %>
            </div>
            <p class="card-text d-flex justify-content-end" style="font-size: 2rem;">
              <a href="<%= userLinkedinList.get(i)%>" class="text-primary" target="_blank">
                <i class="fab fa-linkedin"></i>
              </a>
            </p>
          </div>
          </a>
        </div>
      <% 
        } 
      %>
  </div>
</section>
<%@ include file="footer.html" %>
