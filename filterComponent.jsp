<%@page import="java.util.*"%>
<%@ include file="utils/global-function.jsp" %> 

<%
    String query_filter = String.format("SELECT * FROM ms_job_type"); 
    ResultSet rs_filter = con.executeQuery(query_filter); 
%>

<div class="btn-group filter">
  <button
    type="button"
    id="dropdown-toggle"
    class="btn text-white dropdown-toggle"
    data-toggle="dropdown"
    aria-expanded="false">
    Filter
  </button>
  <div class="dropdown-menu">
    <form class="py-3" action="<%= request.getServletPath().toString().replace("/", "")%>" method="get" name="filter">
      <div class="form-group px-4">
        <label for="gender">Gender</label>
        <div class="form-check">
          <input
            name="gender"
            class="form-check-input"
            type="checkbox"
            value="Male"
            id="Male"
            <%
                if(genderFilter != null && findFromArray(genderFilter, "Male")){
                    out.print("checked=\"checked\"");
                }
            %>
            />
          <label class="form-check-label" for="Male"> Male </label>
        </div>
        <div class="form-check">
          <input
            name="gender"
            class="form-check-input"
            type="checkbox"
            value="Female"
            id="Female"
            <%
                if(genderFilter != null && findFromArray(genderFilter, "Female")){
                    out.print("checked=\"checked\"");
                }
            %>
          />
          <label class="form-check-label" for="Female"> Female </label>
        </div>
      </div>
      <div class="dropdown-divider"></div>
      <div class="form-group px-4 ">
        <label for="jobType">Job Type</label>
        <div class="job-type-group">
            <%
                while(rs_filter.next()){
            %>
                <div class="form-check">
                <input
                    name="jobType"
                    class="form-check-input"
                    type="checkbox"
                    value="<%= rs_filter.getString("JobTypeName")%>"
                    id="JobType0<%= rs_filter.getInt("JobTypeId")%>"
                    <%
                        if(jobTypeFilter != null && findFromArray(jobTypeFilter, rs_filter.getString("JobTypeName"))){
                            out.print("checked=\"checked\"");
                        }
                    %>
                />
                <label class="form-check-label" for="JobType0<%= rs_filter.getInt("JobTypeId")%>"><%= rs_filter.getString("JobTypeName")%></label>
                </div>      
            <%
                }
            %>
        </div>
      </div>
      <div class="px-4 d-flex justify-content-end">
        <button type="submit" class="btn btn-primary">Filter</button>
      </div>
    </form>
  </div>
</div>
