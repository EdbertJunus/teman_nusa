<%@ include file="header.jsp" %>
<%@page import="java.util.Random"%>
<%
  Integer max = 125000;
  Integer min = 100000;
  Integer registerPrice = new Random().nextInt((max-min)+1) + min;
%>
<section class="container content">
  <h1 class="page-title">Register Form</h1>
  <div class="container form-wrapper">
    <form
      action="controller/registerController.jsp"
      method="post"
      name="RegisterForm"
    >
      <div class="form-group">
        <label for="fullName">Full Name</label>
        <input
          type="text"
          name="fullName"
          class="form-control"
          id="fullName"
          required
        />
      </div>
      <div class="form-group">
        <label for="email">Email</label>
        <input
          type="email"
          name="email"
          class="form-control"
          id="email"
          required
        />
      </div>
      <div class="form-group">
        <label for="gender">Gender</label>
        <div class="form-check">
          <input
            class="form-check-input"
            type="radio"
            name="gender"
            id="Male"
            value="Male"
            required
          />
          <label class="form-check-label" for="Male"> Male </label>
        </div>
        <div class="form-check">
          <input
            class="form-check-input"
            type="radio"
            name="gender"
            id="Female"
            value="Female"
            required
          />
          <label class="form-check-label" for="Female"> Female </label>
        </div>
      </div>
      <div class="form-group">
        <label for="jobType">Job Type</label>
        <div class="form-check">
          <input
            name="jobType"
            class="form-check-input"
            type="checkbox"
            value="Web Design"
            id="webDesign"
          />
          <label class="form-check-label" for="webDesign"> Web Design </label>
        </div>
        <div class="form-check">
          <input
            name="jobType"
            class="form-check-input"
            type="checkbox"
            value="Web Prog"
            id="webProg"
          />
          <label class="form-check-label" for="webProg"> Web Prog </label>
        </div>
      </div>

      <div class="form-group">
        <label for="linkedIn">LinkedIn</label>
        <input
          type="text"
          name="linkedIn"
          class="form-control"
          id="linkedIn"
          required
        />
        <small id="linkedInInfo" class="form-text text-muted">
          Format must be in https://www.linkedin.com/in/*username*
        </small>
      </div>
      <div class="form-group">
        <label for="handphone">Handphone</label>
        <input
          type="number"
          name="handphone"
          class="form-control"
          id="handphone"
          required
        />
      </div>
      <div class="form-group">
        <label for="price">Register Price</label>
        <input
          type="number"
          class="form-control"
          id="price"
          aria-describedby="priceInfo"
          name="price"
          required
        />
        <small id="priceInfo" class="form-text text-muted">
          Register Price is <%= registerPrice%>
        </small>
        <input type="hidden" name="randomRegisterPrice" value="<%= registerPrice%>" />
      </div>
      <div class="form-group">
        <label for="password">Password</label>
        <input
          type="password"
          name="password"
          class="form-control"
          id="password"
          required
        />
      </div>
      <div class="form-group">
        <label for="confirmPassword">Confirm Password</label>
        <input
          type="password"
          name="confirmPassword"
          class="form-control"
          id="confirmPassword"
          required
        />
      </div>
      <% if(request.getParameter("err") != null){ %>
      <div class="error-msg"><%= request.getParameter("err")%></div>
      <% } %>
      <button type="submit" class="btn btn-primary">Submit</button>
    </form>
  </div>
</section>
<%@ include file="footer.html" %>
