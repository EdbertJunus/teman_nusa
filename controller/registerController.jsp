<%@ page import="java.util.*" %>
<%@ include file="../database/connect.jsp" %>

<%
    String UserFullName = request.getParameter("fullName");
    String UserEmail = request.getParameter("email");
    String UserGender = request.getParameter("gender");
    String[] UserJobType = request.getParameterValues("jobType");
    String UserLinkedIn = request.getParameter("linkedIn");
    String UserHandphone = request.getParameter("handphone");
    String UserMemberPrice = request.getParameter("price");
    String UserPassword = request.getParameter("password");
    String UserConfirmPassword = request.getParameter("confirmPassword");

    String randomRegisterPrice = request.getParameter("randomRegisterPrice");

    Connect con = Connect.getConnection();
    String query;
    ResultSet rs;

    session.setAttribute("UserFullName", UserFullName);
    session.setAttribute("UserEmail", UserEmail);
    session.setAttribute("UserLinkedIn", UserLinkedIn);
    session.setAttribute("UserHandphone", UserHandphone);
    
    if(UserFullName.length() == 0){
        response.sendRedirect("../register.jsp?err=Full Name must be filled");
        session.removeAttribute("UserFullName");
        return;
    }else if(UserFullName.length() < 3){
        response.sendRedirect("../register.jsp?err=Full Name must minimal contain 3 characters");
        session.removeAttribute("UserFullName");
        return;
    }
    
    if(UserEmail.length() == 0){
        response.sendRedirect("../register.jsp?err=Email must be filled");
        session.removeAttribute("UserEmail");
        return;
    }else {
        query = String.format("SELECT * FROM ms_user WHERE UserEmail = ('%s')", UserEmail);
        rs = con.executeQuery(query);
        if(rs.next()){
            response.sendRedirect("../register.jsp?err=Full User with this email already exist");
            session.removeAttribute("UserEmail");
            return;
        }
    }

    if(UserGender.length() == 0){
        response.sendRedirect("../register.jsp?err=Gender must be filled");
        return;
    }

    if(UserJobType == null){
        response.sendRedirect("../register.jsp?err=Job Type must be filled");
        return;
    }else if(UserJobType.length < 3){
        response.sendRedirect("../register.jsp?err=Job Type must be minimal 3");
        return;
    } 

    if(UserLinkedIn.length() == 0){
        response.sendRedirect("../register.jsp?err=LinkedIn must be filled");
        session.removeAttribute("UserLinkedIn");
        return;
    }else if(UserLinkedIn.indexOf("https://www.linkedin.com/in/") == -1){
        response.sendRedirect("../register.jsp?err=LinkedIn must be in this format https://www.linkedin.com/in/<username>");
        session.removeAttribute("UserLinkedIn");
        return;
    }else if(UserLinkedIn.equals("https://www.linkedin.com/in/")){
        response.sendRedirect("../register.jsp?err=LinkedIn must be in this format https://www.linkedin.com/in/<username>");
        session.removeAttribute("UserLinkedIn");
        return;
    }
    
    if(UserHandphone.length() == 0){
        response.sendRedirect("../register.jsp?err=Handphone must be filled");
        session.removeAttribute("UserHandphone");
        return;
    }else if(UserHandphone.length() > 13 || UserHandphone.length() < 10){
        response.sendRedirect("../register.jsp?err=Handphone length must be between 10 and 13");
        session.removeAttribute("UserHandphone");
        return;
    }else if(!UserHandphone.matches("[0-9]+")){
        response.sendRedirect("../register.jsp?err=Handphone must only contain numbers");
        session.removeAttribute("UserHandphone");
        return;
    }

    if(UserMemberPrice.length() == 0){
        response.sendRedirect("../register.jsp?err=MemberPrice must be filled");
        return;
    }else if(!UserMemberPrice.matches("[0-9]+")){
        response.sendRedirect("../register.jsp?err=MemberPrice must only contain numbers");
        return;
    }

    if(UserPassword.length() == 0 || UserConfirmPassword.length() == 0){
        response.sendRedirect("../register.jsp?err=Password and Confirm Password must be filled");
        return;
    }else if(UserPassword.length() < 8){
        response.sendRedirect("../register.jsp?err=Password must contain minimal 8 characters");
        return;
    }else if(!UserPassword.matches("(?=.*[0-9])(?=.*[a-zA-Z])([a-zA-Z0-9]+)")){
        response.sendRedirect("../register.jsp?err=Password must contain numbers and alphabeths");
        return;
    }else if(!UserPassword.equals(UserConfirmPassword)){
        response.sendRedirect("../register.jsp?err=Password and Confirm Password must be the same");
        return;
    }

    session.setAttribute("UserFullName", UserFullName);
    session.setAttribute("UserEmail", UserEmail);
    session.setAttribute("UserGender", UserGender);
    session.setAttribute("UserJobType", UserJobType);
    session.setAttribute("UserLinkedIn", UserLinkedIn);
    session.setAttribute("UserHandphone", UserHandphone);
    session.setAttribute("UserMemberPrice", UserMemberPrice);
    session.setAttribute("UserPassword", UserPassword);

    session.setAttribute("onGoingRandomPrice", randomRegisterPrice);

    response.sendRedirect("../register-payment.jsp");

%>

