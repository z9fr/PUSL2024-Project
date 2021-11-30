<%@ page import="com.example.xyzhotel.beans.room" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: dasith
  Date: 11/17/21
  Time: 9:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>XYZ Hotel | All Rooms</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.9.3/css/bulma.css" integrity="sha512-7VGuxKU1BFMmA+dC7NiW8jF0YOIe6bibjUBr42unVtEsI/UYzXMS3nkgNvmsY4yqauxeiEs4bXF6fPLsCuxN/A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script defer src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>

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

        .allItemsCards{
            margin-left: 5%;
            margin-right: 5%;
        }
    </style>
</head>



<body>


<jsp:include page="partials/navbar.jsp" />

<br><br>
<h1 class="title is-2">
    <center>
        All the Rooms Available With Us!
    </center>
</h1>
<section class="quotes section is-medium allItemsCards" style="margin-top: -5%;">

    <div class="columns is-multiline is-mobile">
        <!-- display all rooms -->
        <%
            List<room> rooms = (ArrayList) request.getAttribute("rooms");
            Iterator<room> iterator = rooms.iterator();
            while (iterator.hasNext()) {
                room room = iterator.next();
        %>

        <div class="column is-one-quarter">
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
                        <a class="button is-success" href="/user/booknow?room=<%=room.getRoom_id()%>">
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
    </div>



</section>


<jsp:include page="partials/footer.jsp" />
</body>

</html>