<%@ include file="header.jsp" %>
<section class="container content">
  <h1 class="page-title">Login Form</h1>
  <div class="container form-wrapper">
    <form
      action="controller/loginController.jsp"
      method="post"
      name="LoginForm"
    >
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
        <label for="password">Password</label>
        <input
          type="password"
          name="password"
          class="form-control"
          id="password"
          required
        />
      </div>
      
      <% if(request.getParameter("err") != null){ %>
      <div class="error-msg"><%= request.getParameter("err")%></div>
      <% } %>
      <button type="submit" class="btn btn-primary">Submit</button>
    </form>
    <p class="text-center"><a href="register.jsp" class="text-info">Don't have an account? Register Now</a></p>
  </div>
</section>
<%@ include file="footer.html" %>