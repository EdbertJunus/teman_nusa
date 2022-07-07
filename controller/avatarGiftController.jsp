<%@ include file="../database/connect.jsp"%>
<%

    Connect con = Connect.getConnection();
    Integer UserId = (Integer) session.getAttribute("UserId");
    Integer avatarId = Integer.parseInt(request.getParameter("avatarId"));
    Integer giftFriendId = Integer.parseInt(request.getParameter("giftFriendId"));

    //Remove avatar from previous user

    String query = String.format("DELETE FROM ms_user_avatar_collection WHERE UserId = (%d) AND AvatarId = (%d)", UserId, avatarId);
    con.executeUpdate(query);

    //Add to Avatar Collection of new user
    query = String.format("INSERT INTO ms_user_avatar_collection (UserId, AvatarId, SenderUserId) VALUES (%d, %d, %d)", giftFriendId, avatarId, UserId);
    con.executeUpdate(query);

 

    response.sendRedirect("../avatar-detail.jsp?avatarId="+avatarId+"");

%>