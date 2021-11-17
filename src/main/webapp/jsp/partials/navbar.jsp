<%--
  Created by IntelliJ IDEA.
  User: dasith
  Date: 11/17/21
  Time: 10:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- the navigation -->

<nav class="navbar" role="navigation" aria-label="main navigation">
    <div class="navbar-brand">
        <a class="navbar-item" href="/" style="margin-left: 50%">
            <img src="https://img.icons8.com/external-kiranshastry-lineal-color-kiranshastry/64/000000/external-coffee-interface-kiranshastry-lineal-color-kiranshastry.png" >
        </a>

        <a role="button" class="navbar-burger" aria-label="menu" aria-expanded="false"
           data-target="navbarBasicExample">
            <span aria-hidden="true"></span>
            <span aria-hidden="true"></span>
            <span aria-hidden="true"></span>
        </a>
    </div>

    <div id="navbarBasicExample" class="navbar-menu" >
        <div class="navbar-start" style="margin-left: 2%">
            <a class="navbar-item">
                Home
            </a>

            <a class="navbar-item">
                Documentation
            </a>

            <div class="navbar-item has-dropdown is-hoverable">
                <a class="navbar-link">
                    More
                </a>

                <div class="navbar-dropdown">
                    <a class="navbar-item">
                        About
                    </a>
                    <a class="navbar-item">
                        Jobs
                    </a>
                    <a class="navbar-item">
                        Contact
                    </a>
                    <hr class="navbar-divider">
                    <a class="navbar-item">
                        Report an issue
                    </a>
                </div>
            </div>
        </div>

        <div class="navbar-end">
            <div class="navbar-item">
                <div class="buttons">
                    <a class="button is-primary" href="/signup.html">
                        <strong>Sign up</strong>
                    </a>
                    <a class="button is-light" href="/login.html">
                        Log in
                    </a>
                </div>
            </div>
        </div>
    </div>
</nav>