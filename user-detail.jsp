<%@ include file="header.jsp" %> 
<% 
    if(UserId == null){
        response.sendRedirect("login.jsp?err=Login first to access user detail"); 
        return; 
    } 
  
    Connect con = Connect.getConnection(); 
    Integer UserDetailId = Integer.parseInt(request.getParameter("userId")); 

    String query = String.format("SELECT * FROM ms_wishlist WHERE (UserId = (%d) OR UserId = (%d)) AND (FavoritedUserId = (%d) OR FavoritedUserId = (%d))", UserId, UserDetailId, UserId, UserDetailId);
    ResultSet rs = con.executeQuery(query);
    rs.last();

    Boolean hasRelation = rs.getRow() == 2;

    //Stored Image and Name for  Receiver and Sender
    String myProfile = "";

    if(hasRelation){
      query = String.format("SELECT * FROM ms_user WHERE UserId = (%d)", UserId);
      rs = con.executeQuery(query);
      rs.next();
      myProfile = rs.getString("UserProfile");
    }
    
    query = String.format("SELECT * FROM ms_user WHERE UserId = (%d)", UserDetailId);
    rs = con.executeQuery(query); 
    if(!rs.next()){
        response.sendRedirect("index.jsp"); 
        return; 
    }

    String UserFullName = rs.getString("UserFullName");
    Integer ReceiverId = rs.getInt("UserId");
    String friendProfile = rs.getString("UserProfile");

    
%>
<section class="container content">
  <input type="hidden" id="UserDetailId" value="<%= UserDetailId%>"/>
  <h1 class="w-100 text-center"><%= UserFullName%></h1>
  <div class="container-fluid user-info">
    <img src="assets/<%= rs.getString("UserProfile")%>" class="img-fluid"
    alt="<%= UserFullName%>" style="width: 18rem" />
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
          <p class="m-0 w-100 text-right">
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
  <%
    if(hasRelation){
  %>
    <div class="container-fluid chat-group">
      <h5 class="w-100 text-center"> Chat with <%= UserFullName%></h5>
      <div class="chat-view rounded">
        <%
          query = String.format("SELECT * FROM `ms_chat` WHERE (SenderId = (%d) OR SenderId = (%d)) AND (ReceiverId = (%d) OR ReceiverId = (%d))", UserId, UserDetailId, UserId, UserDetailId);
          rs = con.executeQuery(query);
          String chatUserName = "me";
          Boolean isSender = false;
          String imageUrl = "";

          while(rs.next()){
            if(rs.getInt("SenderId") == UserDetailId){
              chatUserName = UserFullName;
              imageUrl = friendProfile;
              isSender = true;
            }else{
              chatUserName = "me";
              imageUrl = myProfile;
              isSender = false;
            }
        %>
        <div class="chat-item <%= isSender ? "" : "align-items-end"%> container-fluid">
          <div class="row <%= isSender ? "" : "flex-row-reverse"%>  align-items-center">
            <img src="assets/<%= imageUrl%>" class="img-thumbnail img-fluid rounded-circle" style="width:3rem;" alt="<%= chatUserName%> profile">
            <p class="m-0 <%= isSender ? "ml-2" : "mr-2"%>"><%= chatUserName%></p>
          </div>
          <div class="row <%= isSender ? "" : "flex-row-reverse"%> mt-2 border rounded border bg-light text-dark chat-content">
            <p class="m-0 ml-2 "><%= rs.getString("ChatContent")%></p>
            <small class="m-0 <%= isSender ? "ml-5" : "mr-5"%>" text-muted d-flex align-items-end"><%= rs.getString("ChatDateTime")%></small>
          </div>
        </div>
        <%-- <div class="chat-item align-items-end container-fluid">
          <div class="row flex-row-reverse align-items-center">
            <img src="..." class="img-thumbnail img-fluid rounded-circle" style="width:3rem;" alt="...">
            <p class="m-0 mr-2">UserFull Name</p>
          </div>
          <div class="row flex-row-reverse mt-2 border rounded border bg-light text-dark chat-content">
            <p class="m-0 ml-2 ">This is the chat</p>
            <small class="m-0 mr-5 text-muted d-flex align-items-end">Date</small>
          </div>
        </div> --%>
        <%
          }
        %>
      </div>
      <div class="chat-form rounded mt-3">
        <form action="controller/handleChatController.jsp" method="post">
          <input type="hidden" name="receiverId" value="<%= ReceiverId%>"/>
          <div class="form-group">
            <label for="exampleFormControlTextarea1">Type your chat here: </label>
            <textarea name="chatContent" class="form-control" id="exampleFormControlTextarea1" rows="3" maxlength="20000" required ></textarea>
          </div>
          <button type="submit" class="btn btn-primary">Submit</button>
        </form>
      </div>
    </div>
  <%
    }
  %>
</section>
<%@ include file="footer.html" %>
