<%--
  Created by IntelliJ IDEA.
  User: dasith
  Date: 11/25/21
  Time: 1:57 AM
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

<jsp:include page="../partials/navbar.jsp" />


<!-- .section -->
<section class="section is-paddingless-horizontal" >
    <div class="card container grid">


        <!-- /.media -->

        <!-- .section -->
        <div class="section is-paddingless-horizontal">

            <form action="/user/feedback" method="POST">

                <%
                    if (request.getAttribute("error") != null) {
                %>

                <br><br>

                <div class="notification is-danger is-light" id="theError">
                    <button class="delete" onclick="hideErr()"></button>
                    <%=request.getAttribute("error")%>
                </div>

                <%

                    }
                %>

                <script>
                    document.getElementById("theSubmitBtn").disabled= true
                </script>

                <h1 class="title is-2">
                   Leave Us a FeedBack, <%= session.getAttribute("username")%>
                </h1>




                <div class="field">
                    <label class="label">Message</label>
                    <div class="control">
                        <textarea class="textarea is-primary" placeholder="What Do you think about Us ?..." name="feedback"></textarea>
                    </div>
                </div>

                <div class="select is-primary" >
                    <select name="rating">
                        <option value="1">1 Star</option>
                        <option value="2">2 Star</option>
                        <option value="3">3 Star</option>
                        <option value="4">4 Star</option>
                        <option value="5">5 Star</option>
                    </select>
                </div>


                <br>   <br>

                <div class="field">
                    <div class="control">
                        <label class="checkbox">
                            <input type="checkbox">
                            I agree to the <a href="#">terms and conditions</a>
                        </label>
                    </div>
                </div>




                <br>



                <div class="field is-grouped">
                    <div class="buttons">
                        <input type="submit" class="button is-primary" value="Submit a FeedBack" id="theSubmitBtn">

                        <a class="button is-light" href="/">
                            Cancel
                        </a>
                    </div>
                </div>


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