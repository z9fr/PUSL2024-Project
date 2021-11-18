<%@ page import="com.example.xyzhotel.beans.room" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.example.xyzhotel.dao.randomQuote" %>
<%@ page import="com.example.xyzhotel.beans.booking" %>
<%@ page import="com.example.xyzhotel.dao.getBookings" %><%--
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


<%

    getBookings bookingsDao = new getBookings();

    List<booking> bookings = bookingsDao.bookingInfo(Integer.parseInt(request.getParameter("number")),(Integer) session.getAttribute("user_id"));

    if(bookings != null){
        Iterator<booking> iterator2 = bookings.iterator();
        while (iterator2.hasNext()) {
            booking booking = iterator2.next();
%>

<p> <%= booking.getStart_date()%></p>


<%
    }
}
else { %>

<p> no oders found yet. </p>
<%
    }
%>




<section>
    <div class="section">
        <div class="container mb-5">
            <div class="columns is-multiline is-centered">
                <div class="column is-8 has-text-centered">
                    <nav class="breadcrumb is-centered mb-3" aria-label="breadcrumbs">
                        <ul>
                            <li><a href="/home">Home</a></li>
                            <li><a href="/user/panel">Dashboard</a></li>
                            <li><a href="#">Order</a></li>
                        </ul>
                    </nav>


                    <h2 class="mb-4 is-size-1 is-size-3-mobile has-text-weight-bold">Lorem ipsum dolor sit amet
                        consectutar domor at elis</h2>
                    <div class="is-flex is-justify-content-center is-align-items-center has-text-left">
                        <div class="mr-4">
                            <img class="image is-fullwidth" src="bulma-plain-assets/images/green-400-avatar.png" alt=""
                                 style="width: 56px; height: 56px">
                        </div>
                        <div>
                            <h4 class="is-size-5 has-text-weight-bold">Danny Bailey</h4>
                            <p class="has-text-grey-dark mb-0">February 26, 2021</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="mb-5">
        <img class="image is-fullwidth" src="bulma-plain-assets/images/green-400-horizontal.png" alt="">
    </div>
    <div class="section">
        <div class="container">
            <div class="columns is-multiline is-centered">
                <div class="column is-8 is-6-desktop">
                    <p class="subtitle has-text-grey mb-5">These types of questions led me to miss numerous deadlines,
                        and I wasted time and energy in back-and-forth communication. Sadly, this situation could have
                        been avoided if the wireframes had provided enough detail.</p>
                    <p class="subtitle has-text-grey mb-5">These types of questions led me to miss numerous deadlines,
                        and I wasted time and energy in back-and-forth communication. Sadly, this situation could have
                        been avoided if the wireframes had provided enough detail.</p>
                    <p class="subtitle has-text-grey mb-5">Now that I am a UX designer, I notice that some designers
                        tend to forget that wireframes are equally creative and technical. We are responsible for
                        designing great ideas, but we are also responsible for creating product specifications. I admit
                        that there can be so many details to remember that it’s easy to lose track. To save time and
                        energy for myself, I gathered all of my years of wireframing knowledge into a single checklist
                        that I refer to throughout the process. And now I am sharing this knowledge with you, so that
                        you can get back to being creative.</p>
                </div>
            </div>
        </div>
    </div>
</section>




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