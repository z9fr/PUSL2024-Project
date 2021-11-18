<%@ page import="com.example.xyzhotel.beans.room" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.example.xyzhotel.dao.randomQuote" %><%--
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


<section class="section">
  <div class="container">
    <div class="columns is-multiline is-centered">
      <div class="column is-8 has-text-centered">
        <span class="has-text-grey-dark">Welcome 😃</span>
        <h2 class="mt-2 mb-4 is-size-1 is-size-3-mobile has-text-weight-bold">Hello, <%= session.getAttribute("username")%>. Welcome Back</h2>
        <p class="subtitle has-text-grey mb-5">
            <%
              randomQuote quote = new randomQuote();
              String myQuote = quote.getQuote();

            %>
            <%= myQuote %>

        </p>
        <a class="button"
           href="#">Share with your friends</a></div>
    </div>
  </div>
  </div>
</section>

<hr>

<section class="section">
  <div class="container">
    <div class="is-vcentered columns is-multiline">


      <div class="column is-6 is-3-desktop">
        <div class="card" style="padding: 7%;">
          <h4>Premium</h4>
          <span class="mb-5 is-inline-block is-size-1 is-size-3-mobile has-text-weight-bold">$99,99</span>

          <a class="button is-primary is-fullwidth has-text-centered" href="#">Action</a>
        </div>
      </div>

      <div class="column is-6 is-3-desktop">
        <div class="card" style="padding: 7%;">
          <h4>Premium</h4>
          <span class="mb-5 is-inline-block is-size-1 is-size-3-mobile has-text-weight-bold">$99,99</span>

          <a class="button is-primary is-fullwidth has-text-centered" href="#">Action</a>
        </div>
      </div>

      <div class="column is-6 is-3-desktop">
        <div class="card" style="padding: 7%;">
          <h4>Premium</h4>
          <span class="mb-5 is-inline-block is-size-1 is-size-3-mobile has-text-weight-bold">$99,99</span>

          <a class="button is-primary is-fullwidth has-text-centered" href="#">Action</a>
        </div>
      </div>

      <div class="column is-6 is-3-desktop">
        <div class="card" style="padding: 7%;">
          <h4>Premium</h4>
          <span class="mb-5 is-inline-block is-size-1 is-size-3-mobile has-text-weight-bold">$99,99</span>

          <a class="button is-primary is-fullwidth has-text-centered" href="#">Action</a>
        </div>
      </div>


    </div>
  </div>
</section>






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

<hr>

<!-- rooms section -->
<section class="quotes section is-medium" style="display: block;margin-top: -3%;">


  <div class="columns is-centered">
    <div class="column is-10 is-8-desktop mb-5 has-text-centered">

      <h2 class="mt-2 mb-4 is-size-1 is-size-3-mobile has-text-weight-bold">Here's the Rooms Availible with us</h2>
      <p class="subtitle has-text-grey mb-5">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque
        massa nibh, pulvinar vitae aliquet.</p>

    </div>
  </div>
  <br><br><br>

  <div class="container">
    <div class="columns">

      <%
        List<room> rooms = (ArrayList) request.getAttribute("latestRooms");
        Iterator<room> iterator1 = rooms.iterator();
        while (iterator1.hasNext()) {
          room room = iterator1.next();
      %>

      <div class="column">
        <div class="card">
          <div class="card-image">
            <figure class="image is-4by3">
              <img src="<%= room.getRoom_image()%>" alt="room image">
            </figure>
          </div>
          <div class="card-content">
            <div class="media">

              <div class="media-content">
                <p class="title is-4"><%= room.getTitle()%></p>

              </div>
            </div>

            <div class="content">
              <%= room.getRoom_description()%>
              <br>
            </div>

            <div class="content">
              <a class="button is-success" href="booknow?room=<%=room.getRoom_id()%>">
                            <span class="icon is-small">
                              <i class="fas fa-check"></i>
                            </span>
                <span>Book Now</span>
              </a>
            </div>


          </div>
        </div>
      </div>

      <%
        }
      %>

    </div>


    <br>


    <center>
      <div class="buttons are-medium" style="margin-left: 42%; margin-right: 42%;">


        <a href="/all" class="button is-large" > View All Rooms</a>

      </div>
    </center>

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