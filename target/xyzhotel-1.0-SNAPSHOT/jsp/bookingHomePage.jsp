<%--
  Created by IntelliJ IDEA.
  User: dasith
  Date: 11/22/21
  Time: 2:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>XYZ Hotel | Book Now</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.9.3/css/bulma.css" integrity="sha512-7VGuxKU1BFMmA+dC7NiW8jF0YOIe6bibjUBr42unVtEsI/UYzXMS3nkgNvmsY4yqauxeiEs4bXF6fPLsCuxN/A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script defer src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>
    <!-- <link rel="stylesheet" href="styles/debug.css"> -->
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

<jsp:include page="partials/navbar.jsp" />



<!-- .section -->
<section class="section is-paddingless-horizontal" >
    <div class="card container grid">


        <!-- /.media -->

        <!-- .section -->
        <div class="section is-paddingless-horizontal">

            <form action="/user/booknow" method="POST">

                <%
                    if (request.getAttribute("error") != null) {
                %>

                <br><br>

                <div class="notification is-danger is-light" id="theError">
                    <button class="delete" onclick="hideErr()"></button>
                    <%=request.getAttribute("error")%>
                </div>

                <script>
                    document.getElementById("theSubmitBtn").disabled= true
                </script>

                <%
                    }
                %>


                <%
                    if (request.getAttribute("the_Room_title_for_booking") != null) {
                %>

                <h1 class="title is-2">
                    Complete Booking For <%=request.getAttribute("the_Room_title_for_booking")%>
                </h1>
                <%
                    }
                %>



                <div class="field">
                    <label class="label">Booking Start Date</label>
                    <div class="control">
                        <input class="input" type="date" placeholder="Date" name="start_date">
                    </div>
                </div>

                <div class="field">
                    <label class="label">Booking End Date</label>
                    <div class="control">
                        <input class="input" type="date" placeholder="Date" name="end_date">
                    </div>
                </div>


                <div class="field">
                    <label class="label">Message</label>
                    <div class="control">
                        <textarea class="textarea" placeholder="Textarea" name="reason"></textarea>
                    </div>
                </div>

                <div class="field">
                    <div class="control">
                        <label class="checkbox">
                            <input type="checkbox">
                            I agree to the <a href="#">terms and conditions</a>
                        </label>
                    </div>
                </div>

                <input type="hidden" name="room_id", value=<%=request.getAttribute("the_Room_id_to_booking")%>>


                <br>


                <%
                    if (request.getAttribute("the_Room_price_for_booking") != null) {
                %>

                <div class="field">
                    <label class="label"><%=request.getAttribute("the_Room_price_for_booking")%> USD</label>

                </div>

                <%
                    }
                %>

                <%
                    if (request.getAttribute("error") != null) {
                %>

                <div class="field is-grouped">
                    <div class="buttons">

                        <a class="button is-light" href="/">
                            Cancel
                        </a>
                    </div>
                </div>


                <%
                }

                else {
                %>


                <div class="field is-grouped">
                    <div class="buttons">
                        <input type="submit" class="button is-primary" value="Complete the Payment" id="theSubmitBtn">

                        <a class="button is-light" href="/">
                            Cancel
                        </a>
                    </div>
                </div>

                <%
                    }
                %>



                <br>



            </form>

   
        </div>


    </div>
</section>
<!-- /.section -->

<script>
    function hideErr(){
        document.getElementById("theError").style.display="none";
    }
</script>


</body>

</html>