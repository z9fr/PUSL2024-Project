<%@ page import="com.example.xyzhotel.beans.room" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.0/css/bulma.min.css">
    <script defer src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>

    <link rel="stylesheet" href="/css/custom.css">
    <style>
        .center {
            display: flex;
            justify-content: center;
            align-items: center;
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
    </style>
</head>

<body>

<!-- the navigation -->
<jsp:include page="partials/navbar.jsp" />

<!-- header section -->
<section class="hero is-halfheight" >
    <div class="hero-body hero-img">
        <div class="" style="margin-left: 15%;">

            <h1 class="title is-2" style="color: white;">
                Lorem, ipsum dolor.
            </h1>

            <p class="subtitle" style="color: rgb(238, 238, 238);">
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Aut, quibusdam?
            </p>

            <div class="buttons">
                <div class="buttons">
                    <a class="button is-primary is-medium" href="/signup.html">
                        <strong>Sign up</strong>
                    </a>
                    <a class="button is-light is-medium" href="/login.html">
                        Log in
                    </a>
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
            <div class="column">
                <div class="card">
                    <div class="card-content">
                        <p class="title">
                            “Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis, perferendis?”
                        </p>
                        <p class="subtitle">
                            Lorem, ipsum.
                        </p>
                    </div>
                    <footer class="card-footer">
                        <p class="card-footer-item">
                                    <span>
                                        View on <a href="#">Twitter</a>
                                    </span>
                        </p>
                        <p class="card-footer-item">
                                    <span>
                                        Share on <a href="#">Facebook</a>
                                    </span>
                        </p>
                    </footer>
                </div>
            </div>
            <div class="column">
                <div class="card">
                    <div class="card-content">
                        <p class="title">
                            “Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis, perferendis?”
                        </p>
                        <p class="subtitle">
                            Lorem, ipsum.
                        </p>
                    </div>
                    <footer class="card-footer">
                        <p class="card-footer-item">
                                    <span>
                                        View on <a href="#">Twitter</a>
                                    </span>
                        </p>
                        <p class="card-footer-item">
                                    <span>
                                        Share on <a href="#">Facebook</a>
                                    </span>
                        </p>
                    </footer>
                </div>
            </div>
        </div>
        <div class="columns">
            <div class="column">
                <div class="card">
                    <div class="card-content">
                        <p class="title">
                            “Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis, perferendis?”
                        </p>
                        <p class="subtitle">
                            Lorem, ipsum.
                        </p>
                    </div>
                    <footer class="card-footer">
                        <p class="card-footer-item">
                                <span>
                                    View on <a href="#">Twitter</a>
                                </span>
                        </p>
                        <p class="card-footer-item">
                                <span>
                                    Share on <a href="#">Facebook</a>
                                </span>
                        </p>
                    </footer>
                </div>
            </div>
            <div class="column">
                <div class="card">
                    <div class="card-content">
                        <p class="title">
                            “Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis, perferendis?”
                        </p>
                        <p class="subtitle">
                            Lorem, ipsum.
                        </p>
                    </div>
                    <footer class="card-footer">
                        <p class="card-footer-item">
                                    <span>
                                        View on <a href="#">Twitter</a>
                                    </span>
                        </p>
                        <p class="card-footer-item">
                                    <span>
                                        Share on <a href="#">Facebook</a>
                                    </span>
                        </p>
                    </footer>
                </div>
            </div>
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
                Iterator<room> iterator = rooms.iterator();
                while (iterator.hasNext()) {
                    room room = iterator.next();
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
