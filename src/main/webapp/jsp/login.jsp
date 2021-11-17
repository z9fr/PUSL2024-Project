<%--
  Created by IntelliJ IDEA.
  User: dasith
  Date: 11/17/21
  Time: 10:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>XYZ Hotel | Login</title>
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
<section class="section is-paddingless-horizontal" style="padding-top: 0;">
    <div class="container grid" style="max-width: 1024px;">


        <!-- /.media -->

        <!-- .section -->
        <div class="section is-paddingless-horizontal">
            <h1 class="title is-2">
                Please Login
            </h1>


            <br>
            <form class="box" action="/login" method="POST">
                <div class="field">
                    <label class="label">Name</label>
                    <div class="control">
                        <input class="input" type="text" placeholder="e.g. @alex" name="username">
                    </div>
                </div>

                <div class="field">
                    <label class="label">Password</label>
                    <div class="control">
                        <input class="input" type="password" placeholder="********" name="password">
                    </div>
                </div>

                <button class="button is-primary" type="submit">Log in</button>
            </form>

            <div class="notification is-danger is-light">
                <button class="delete"></button>
                Primar lorem ipsum dolor sit amet, consectetur
                adipiscing elit lorem ipsum dolor. <strong>Pellentesque risus mi</strong>, tempus quis placerat ut, porta nec nulla. Vestibulum rhoncus ac ex sit amet fringilla. Nullam gravida purus diam, et dictum <a>felis venenatis</a> efficitur.
            </div>
        </div>
        <!-- /.section -->


        <!-- /.columns -->

    </div>
</section>
<!-- /.section -->

</body>


</html>