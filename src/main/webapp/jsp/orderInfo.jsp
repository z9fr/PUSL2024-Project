<%@ page import="com.example.xyzhotel.beans.room" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.example.xyzhotel.dao.user.randomQuote" %>
<%@ page import="com.example.xyzhotel.beans.booking" %>
<%@ page import="com.example.xyzhotel.dao.bookings.getBookings" %>
<%@ page import="com.example.xyzhotel.dao.user.singleValues" %><%--
  Created by IntelliJ IDEA.
  User: dasith
  Date: 11/18/21
  Time: 9:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>User Dashboard | <%= session.getAttribute("username")%></title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.9.3/css/bulma.css" integrity="sha512-7VGuxKU1BFMmA+dC7NiW8jF0YOIe6bibjUBr42unVtEsI/UYzXMS3nkgNvmsY4yqauxeiEs4bXF6fPLsCuxN/A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script defer src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>
    <link rel="stylesheet" href="static/custom.css">
</head>

<body>
<jsp:include page="partials/navbar.jsp" />

<section>

<%

    getBookings bookingsDao = new getBookings();
    singleValues singlevalueDao = new singleValues();

    List<booking> bookings = bookingsDao.bookingInfo(Integer.parseInt(request.getParameter("number")),(Integer) session.getAttribute("user_id"));

    if(bookings != null){
        Iterator<booking> iterator2 = bookings.iterator();
        while (iterator2.hasNext()) {
            booking booking = iterator2.next();

    String imgUrl = singlevalueDao.getRoomImage(booking.getRoom_id());
    String RoomTitle = singlevalueDao.getRoomTitle(booking.getRoom_id());
    String RoomDesc = singlevalueDao.getRoomDesc(booking.getRoom_id());
%>

    <section class="section">
        <div class="container">
            <div class="columns is-multiline is-centered">
                <div class="column is-8 has-text-centered">

                    <nav class="breadcrumb" aria-label="breadcrumbs">
                        <ul>
                            <li><a href="/home">Home</a></li>
                            <li><a href="/user/panel">Dashboard</a></li>
                            <li class="is-active"><a href="#" aria-current="page"><%=RoomTitle%></a></li>
                        </ul>
                    </nav>


                    <h2 class="mt-2 mb-4 is-size-1 is-size-3-mobile has-text-weight-bold"><%=RoomTitle%></h2>
                    <p class="subtitle has-text-grey mb-5"><%= RoomDesc %></p>

                    <img class="image is-fullwidth" src="<%=imgUrl%>" alt="">
                    <br> <br>

                    <div class="notification is-success is-light">
                        <h2> <b> Order Details </b></h2><br>
                        You have setup an order to this room on. <strong><%= booking.getStart_date() %></strong> to <strong><%= booking.getEnd_date() %></strong>
                       we hope you will enjoy your time here! have fun!! we are exited to see you on   <strong><%= booking.getStart_date() %></strong>.
                    </div>

                    <div class="box">
                        <b> Start Date : <%= booking.getStart_date() %> </b>
                    </div>
                    <div class="box">
                        <b> Ending Date : <%= booking.getEnd_date() %> </b>
                    </div>

                    <div class="box">
                        <b> Payment Amount : <code><%= booking.getPaymentAmount() %></code> </b>
                    </div>

                    <div class="box">
                        <b> Payment Status : <%= booking.isComplete() %> </b>
                    </div>

                    <div class="box">
                        <b> Order Reason  : <%= booking.getReason() %> </b>
                    </div>
                </div>
            </div>
        </div>
    </section>

<%
    }
}
else { %>

<p> no orders found yet. </p>
<%
    }
%>






</section>

<br>
<hr>
<br>
<!-- header section -->
<section class="section">
    <div class="container">
        <div class="box p-6 has-background-light">
            <div class="is-vcentered columns is-multiline">
                <div class="column is-8-desktop mb-3">
                    <div>
                        <h3 class="is-size-2 is-size-3-mobile mb-2 has-text-weight-bold">Want To Give us some FeedBack?</h3>
                        <p class="has-text-grey-dark">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ut earum maxime quas voluptatibus quia necessitatibus vel praesentium expedita magni laborum?</p>
                    </div>
                </div>
                <div class="column is-4-desktop">
                    <form action="#">
                        <div class="is-flex">

                            <button class="button is-primary" style="margin-left: 40%;">Leave A FeedBack</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<br>



<footer class="section">
    <div class="container">
        <div class="columns is-multiline" style="border-bottom: 1px solid #dee2e6;">
            <div class="column is-3 mb-5">
                <a class="mb-4 is-inline-block" href="#">
                    <img class="image" src="bulma-plain-assets/logos/plainb-logo.svg" alt="" width="96px">
                </a>
                <p class="has-text-grey-dark mb-6">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                <div>
                    <a class="mr-3 is-inline-block" href="#">
                        <img class="mx-auto image is-fullwidth" src="bulma-plain-assets/socials/facebook.svg">
                    </a>
                    <a class="mr-3 is-inline-block" href="#">
                        <img class="mx-auto image is-fullwidth" src="bulma-plain-assets/socials/github.svg">
                    </a>
                    <a class="mr-3 is-inline-block" href="#">
                        <img class="mx-auto image is-fullwidth" src="bulma-plain-assets/socials/instagram.svg">
                    </a>
                    <a class="mr-3 is-inline-block" href="#">
                        <img class="mx-auto image is-fullwidth" src="bulma-plain-assets/socials/linkedin.svg">
                    </a>
                    <a class="is-inline-block" href="#">
                        <img class="mx-auto image is-fullwidth" src="bulma-plain-assets/socials/twitter.svg">
                    </a>
                </div>
            </div>
            <div class="column is-9">
                <div class="columns is-multiline">
                    <div class="column is-6 is-3-desktop mb-5">
                        <h4 class="is-size-4 has-text-weight-bold mb-4">Company</h4>
                        <ul>
                            <li class="mb-2"><a class="button is-white" href="#">About Us</a></li>
                            <li class="mb-2"><a class="button is-white" href="#">Careers</a></li>
                            <li class="mb-2"><a class="button is-white" href="#">Press</a></li>
                            <li><a class="button is-white" href="#">Blog</a></li>
                        </ul>
                    </div>
                    <div class="column is-6 is-3-desktop mb-5">
                        <h4 class="is-size-4 has-text-weight-bold mb-4">Pages</h4>
                        <ul>
                            <li class="mb-2"><a class="button is-white" href="#">Login</a></li>
                            <li class="mb-2"><a class="button is-white" href="#">Register</a></li>
                            <li class="mb-2"><a class="button is-white" href="#">Add list</a></li>
                            <li><a class="button is-white" href="#">Contact</a></li>
                        </ul>
                    </div>
                    <div class="column is-6 is-3-desktop mb-5">
                        <h4 class="is-size-4 has-text-weight-bold mb-4">Legal</h4>
                        <ul>
                            <li class="mb-2"><a class="button is-white" href="#">Terms</a></li>
                            <li class="mb-2"><a class="button is-white" href="#">About Us</a></li>
                            <li class="mb-2"><a class="button is-white" href="#">Team</a></li>
                            <li><a class="button is-white" href="#">Privacy</a></li>
                        </ul>
                    </div>
                    <div class="column is-6 is-3-desktop mb-5">
                        <h4 class="is-size-4 has-text-weight-bold mb-4">Resources</h4>
                        <ul>
                            <li class="mb-2"><a class="button is-white" href="#">Blog</a></li>
                            <li class="mb-2"><a class="button is-white" href="#">Service</a></li>
                            <li class="mb-2"><a class="button is-white" href="#">Product</a></li>
                            <li><a class="button is-white" href="#">Pricing</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="pt-5 has-text-centered">
            <p>All rights reserved © Wireframes Corporation 2021</p>
        </div>
    </div>
</footer>


</body>

</html>