<%@ page import="com.example.xyzhotel.beans.room" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.example.xyzhotel.beans.review" %>
<%--
<%--
  Created by IntelliJ IDEA.
  User: dasith
  Date: 11/17/21
  Time: 10:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>XYZ Hotel | Home</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.9.3/css/bulma.css" integrity="sha512-7VGuxKU1BFMmA+dC7NiW8jF0YOIe6bibjUBr42unVtEsI/UYzXMS3nkgNvmsY4yqauxeiEs4bXF6fPLsCuxN/A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script defer src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>


    <link rel="stylesheet" href="/css/custom.css">
    <style>
        .center {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .checked {
            color: orange;
        }

        .is-paddingless-horizontal {
            padding-left: 0;
            padding-right: 0;
        }

        .grid {
            display: grid;
            grid-template-columns:
                [xl-start] 1fr 1.5rem [md-start] minmax(0, 624px) [md-end] 1.5rem 1fr [xl-end];
        }

        .grid * {
            grid-column: md;
        }

        .grid-xl {
            grid-column: xl;
        }

        .checked {
            color: orange;
        }

    </style>
</head>

<body>

<!-- the navigation -->
<jsp:include page="partials/navbar.jsp" />

<!-- header section -->
<section class="hero is-halfheight" >
    <div class="hero-body hero-img">
        <div class="" style="margin-left: 15%;">

            <% if (session.getAttribute("username") == null) { %>
                <h1 class="title is-2" style="color: white;">
                    Lorem, ipsum dolor.
                </h1>
            <% } else {%>
                <h1 class="title is-2" style="color: white;">
                    Hello, <%= session.getAttribute("username")%>
                </h1>

            <% } %>

            <p class="subtitle" style="color: rgb(238, 238, 238);">
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Aut, quibusdam?
            </p>

            <div class="buttons">
                <div class="buttons">

                    <% if (session.getAttribute("username") == null) { %>
                    <div class="buttons">
                        <a class="button is-primary" href="/signup">
                            <strong>Sign up</strong>
                        </a>
                        <a class="button is-light" href="/login">
                            Log in
                        </a>
                    </div>
                    <% } else {%>
                    <div class="buttons">
                        <a class="button is-primary" href="/user/panel">
                            <strong>Dashboard</strong>
                        </a>
                        <a class="button is-light" href="/logout">
                            Logout
                        </a>
                    </div>

                    <% } %>



                </div>
            </div>
        </div>
    </div>
</section>

<!-- what people say about us-->
<section class="quotes section is-medium" style="display: block;margin-top: -3%;">

    <h1 class="title is-2">
        <center>
            What People Think About Us
        </center>
    </h1>
    <br><br><br>

    <div class="container">
        <div class="columns">

            <%
                List<review> reviews = (ArrayList) request.getAttribute("topreviews");

               // while (iterator.hasNext()) {

                //    review review = iterator.next();

                for( int i =0 ; i < 3; i++){
                    review review = reviews.get(i);
            %>

            <div class="column">
                <div class="card">
                    <div class="card-content">
                        <p class="title">
                            “<%= review.getReview_content()%>”
                        </p>
                        <p class="subtitle">
                            <%= review.getReview_user()%>
                        </p>
                    </div>
                    <footer class="card-footer">
                        <p class="card-footer-item">
                            <!-- try to display the stars -->

                            <% for(int x = 1; x < review.getReview_starts(); x++) { %>
                            <tr>
                                <td><span class="fa fa-star checked"></span></td>
                            </tr>
                            <% } %>


                        </p>
                        <p class="card-footer-item">
                            <span>
                                        Share on <a href="https://twitter.com/intent/tweet?text=check+out!<%=review.getReview_user()%>+said+<%=review.getReview_content()%>+about+the+XYZ+hotel&hashtags=xyzhotel">Twitter</a>
                                    </span>
                        </p>
                    </footer>
                </div>
            </div>


<%
    }
%>

        </div>

        <div class="container">
            <div class="columns">

                <%
                    List<review> reviews2 = (ArrayList) request.getAttribute("topreviews");

                    // while (iterator.hasNext()) {

                    //    review review = iterator.next();

                    for( int i =3 ; i <= 4; i++){
                        review review2 = reviews2.get(i);
                %>

                <div class="column">
                    <div class="card">
                        <div class="card-content">
                            <p class="title">
                                “<%= review2.getReview_content()%>”
                            </p>
                            <p class="subtitle">
                                <%= review2.getReview_user()%>
                            </p>
                        </div>
                        <footer class="card-footer">
                            <p class="card-footer-item">
                                <% for(int y = 0; y < review2.getReview_starts() ; y++) { %>
                                <tr>
                                    <script> console.log(review2.getReview_starts())</script>
                                    <td><span class="fa fa-star checked"></span></td>
                                </tr>
                                <% } %>

                            </p>
                            <p class="card-footer-item">
                                   <span>
                                        Share on <a href="https://twitter.com/intent/tweet?text=check+out!<%=review2.getReview_user()%>+said+<%=review2.getReview_content()%>+about+the+XYZ+hotel&hashtags=xyzhotel">Twitter</a>
                                    </span>
                            </p>
                        </footer>
                    </div>
                </div>


                <%
                    }
                %>

            </div>






            <br>
        <center>
            <div class="buttons are-medium" style="margin-left: 42%; margin-right: 42%;">

                <button class="button is-large">View All Reviews</button>

            </div>
        </center>

    </div>

</section>

<hr>


<!-- rooms section -->
<section class="quotes section is-medium" style="display: block;margin-top: -3%;">

    <h1 class="title is-2">
        <center>
            Visit Us Today! Enjoy your life
        </center>
    </h1>
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
<!-- /.section -->

<hr>


<!-- rooms section -->
<section class="quotes section is-medium" style="display: block;margin-top: -3%;">

    <h1 class="title is-2">
        <center>
            About Us
        </center>
    </h1>
    <br><br><br>

    <div class="container">
        <div class="columns">


            <div class="card" style="box-shadow: none;">
                <div class="card-content">
                    <img src="https://bulma.io/images/placeholders/1280x960.png" alt="Placeholder image">

                </div>
            </div>


            <div class="card" style="box-shadow: none;">
                <div class="card-content">
                    <div class="content">
                        Lorem ipsum leo risus, porta ac consectetur ac, vestibulum at eros. Donec id elit non mi porta gravida at
                        eget metus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras
                        mattis consectetur purus sit amet fermentum.

                    </div>
                    <div class="content">
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptas impedit odit consequatur, aut adipisci recusandae facere animi a voluptate maxime.
                        <br>
                        Lorem ipsum dolor <b>sit amet consectetur adipisicing elit.</b> At iure delectus cumque iste. Iste provident neque, ullam sed obcaecati totam molestias odio, minima recusandae voluptates dignissimos veritatis consequatur distinctio accusantium iure accusamus animi rerum itaque. Possimus, dicta eum illum voluptatum aut quibusdam architecto, nobis ad, facere error quasi ipsa inventore?
                        <br>
                    </div>

                    <div class="buttons">
                        <button class="button">Read More About Us</button>
                    </div>


                </div>
            </div>

        </div>



    </div>

</section>
<!-- /.section -->



<jsp:include page="partials/footer.jsp" />


</body>


</html>
