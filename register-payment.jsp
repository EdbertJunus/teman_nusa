<jsp:include page="header.jsp">
    <jsp:param name="navbar" value="False" />
</jsp:include>

<%
    String UserFullName = (String)session.getAttribute("UserFullName");
    String UserEmail = (String)session.getAttribute("UserEmail");
    String UserGender = (String)session.getAttribute("UserGender");
    String[] UserJobType = (String[])session.getAttribute("UserJobType");
    String UserLinkedIn = (String)session.getAttribute("UserLinkedIn");
    String UserHandphone = (String)session.getAttribute("UserHandphone");
    Integer UserMemberPrice = Integer.parseInt((String)session.getAttribute("UserMemberPrice"));
    String UserPassword = (String)session.getAttribute("UserPassword");
    Integer price = Integer.parseInt((String)session.getAttribute("onGoingRandomPrice"));

    Integer priceDiff = price - UserMemberPrice;
    boolean insertPrice = false;
%>

<section class="container content">
    <div class="jumbotron">
    <h1 class="display-4">Registration Payment</h1>
    <p class="lead">Registration Price : <%= price%></p>
    <p class="lead">Total Paid : <%= UserMemberPrice%></p>
    <hr class="my-4">
    <input type="hidden" name="prevPayment" id="previous-payment" value="<%= UserMemberPrice%>" />
    <form action="controller/registerPaymentController.jsp"
        method="get"
        name="RegisterPaymentForm"
        class="register-payment"
        id="register-payment">
    <%
        if(priceDiff > 0){
            insertPrice = true;
    %>
        <p class="font-weight-bold text-danger">Your payment still less <%= priceDiff%></p>
    <%
        }else{
            if(priceDiff == 0){
    %>          
            <p class="font-weight-bold text-success">Your payment is successfull</p>
            <button class="btn btn-success btn-lg mb-2" type="submit">Continue</button>

            <%
            }else{
            %>
            <p class="font-weight-bold text-success">Sorry you pay more <%= priceDiff*(-1)%>, do you wish to insert the excess money to the wallet?</p>
            <button class="btn btn-success btn-lg mb-2" id="btn-pay-yes" type="submit">Yes</button>
            <button class="btn btn-danger btn-lg mb-2" id="btn-pay-no" type="button">No</button>
    <%
            }
        }
    %>

            <div id="pay-register-input" class="form-group <%= insertPrice ? "active" : ""%>">
                <label for="payment">Insert new payment</label>
                <input
                    type="number"
                    class="form-control"
                    id="payment"
                    name="payment"
                    value="<%= UserMemberPrice%>"
                    required
                    />
                <input type="hidden" id="price" name="price" value="<%= price%>" />
            </div>
            <button id="btn-pay-register" type="submit" class="btn btn-primary btn-submit-price <%= insertPrice ? "active" : ""%>">Submit Price</button>
        </form>
    </div>
</section>
<%@ include file="footer.html" %>
