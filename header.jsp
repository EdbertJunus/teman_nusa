<%@ include file="database/connect.jsp"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Teman Nusa</title>
    <%-- <link rel="stylesheet" href="css/bootstrap.min.css" /> --%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="css/register-style.css" />
    <link rel="stylesheet" href="css/home-style.css" />
  </head>
  <body>
    <%
      String hasNavbar = request.getParameter("navbar");
      Integer UserId = (Integer) session.getAttribute("UserId");
      if(hasNavbar == null){
    %>
    <nav class="navbar navbar-expand-lg navbar-light">
      <a class="navbar-brand font-weight-bolder" href="#">Teman Nusa</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">WishList</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Avatar Shop</a>
          </li>
          <%
            if(UserId != null){
          %>
          <li class="nav-item">
            <a class="nav-link" href="#">Collection Angels</a>
          </li>
          <%
            }
          %>
        </ul>
        <ul class="navbar-nav">
          <%
            if(UserId == null){
          %>
          <li class="nav-item active">
            <a class="nav-link" href="login.jsp">Login</a>
          </li>
          <%
            }else{
          %>
          <li class="nav-item active">
            <a class="nav-link" href="#">Wallet</a>
          </li>
          <li class="nav-item active">
            <a class="nav-link" href="#">Settings</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="controller/logoutController.jsp">Log Out</a>
          </li>
          <%
            }
          %>
        </ul>
      </div>
    </nav>
    <%
      }
    %>
  