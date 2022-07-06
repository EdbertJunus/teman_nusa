<%@ include file="../database/connect.jsp" %>
<%@page import="java.util.*"%>

<%
    Integer payment = Integer.parseInt((String)request.getParameter("payment"));
    Integer price = Integer.parseInt((String)request.getParameter("price"));

    if(price > payment){
        session.setAttribute("UserMemberPrice", request.getParameter("payment"));
        response.sendRedirect("../register-payment.jsp");
        return;
    }

    String UserFullName = (String)session.getAttribute("UserFullName");
    String UserEmail = (String)session.getAttribute("UserEmail");
    String UserGender = (String)session.getAttribute("UserGender");
    String[] UserJobType = (String[])session.getAttribute("UserJobType");
    String UserLinkedIn = (String)session.getAttribute("UserLinkedIn");
    String UserHandphone = (String)session.getAttribute("UserHandphone");
    String UserPassword = (String)session.getAttribute("UserPassword");

    Integer surplus = payment - price;

    Connect con = Connect.getConnection();
    //Insert User
    String query_insert_user = String.format("INSERT INTO ms_user (UserFullName, UserGender, UserLinkedIn, UserHandphone, UserRegisterPrice, UserEmail, UserPassword, UserWalletBalance, UserAccountType, UserProfile) VALUES ('%s', '%s', '%s', '%s', %d, '%s', '%s', %d, '%s', '%s')", UserFullName, UserGender, UserLinkedIn, UserHandphone, price, UserEmail, UserPassword, surplus+100, "Public", "beruang.jpg");
    ResultSet st = con.executeUpdate(query_insert_user).getGeneratedKeys();
    st.next();
    int UserId = st.getInt(1);

    //Get UserJobType Id
  
    String query_job_type = "";
    for(int i=0; i<UserJobType.length; i++){
        query_job_type += "'" + UserJobType[i] + "'";
        if(i != (UserJobType.length - 1)){
            query_job_type += ",";
        }
    }
    String query_jobType = String.format("SELECT * FROM ms_job_type WHERE JobTypeName IN (%s)", query_job_type);
    ResultSet rs = con.executeQuery(query_jobType);
    ArrayList<Integer> jobTypeIdList = new ArrayList<Integer>();

    while(rs.next()){
        jobTypeIdList.add(rs.getInt("JobTypeId"));
    }
    
    //Insert User Chosen Job
    String query_insert_user_chosen;
    for(int i=0; i<jobTypeIdList.size(); i++){
        query_insert_user_chosen = String.format("INSERT INTO ms_user_chosen_job (UserId, JobTypeId) VALUES (%d, %d)", UserId, jobTypeIdList.get(i));
        con.executeUpdate(query_insert_user_chosen);
    }

    session.removeAttribute("UserFullName");
    session.removeAttribute("UserEmail");
    session.removeAttribute("UserGender");
    session.removeAttribute("UserJobType");
    session.removeAttribute("UserLinkedIn");
    session.removeAttribute("UserHandphone");
    session.removeAttribute("UserMemberPrice");
    session.removeAttribute("UserPassword");

    session.removeAttribute("onGoingRandomPrice");
    
    response.sendRedirect("../login.jsp");

%>