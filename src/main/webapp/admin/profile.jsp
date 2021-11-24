<%@ page import="com.example.xyzhotel.dao.AdminHelper" %>
<%@ page import="com.example.xyzhotel.dao.getBookings" %>
<%@ page import="com.example.xyzhotel.beans.booking" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.example.xyzhotel.dao.singleValues" %>
<!DOCTYPE html>
<html lang="en" class="has-aside-left has-aside-mobile-transition has-navbar-fixed-top has-aside-expanded">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>XYZ Hotel | Admin Dashboard</title>

  <!-- Bulma is included -->
  <link rel="stylesheet" href="/css/main.css">

  <!-- Fonts -->
  <link rel="dns-prefetch" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.9.3/css/bulma.css" integrity="sha512-7VGuxKU1BFMmA+dC7NiW8jF0YOIe6bibjUBr42unVtEsI/UYzXMS3nkgNvmsY4yqauxeiEs4bXF6fPLsCuxN/A==" crossorigin="anonymous" referrerpolicy="no-referrer">
</head>
<body>
<div id="app">


  <jsp:include page="partials/navAdmin.jsp" />



  <section class="section is-title-bar">
    <div class="level">
      <div class="level-left">
        <div class="level-item">
          <ul>
            <li><a href="/user/admin">Admin</a> </li>
            <li>Dashboard</li>
          </ul>
        </div>
      </div>

    </div>
  </section>
  <section class="hero is-hero-bar">
    <div class="hero-body">
      <div class="level">
        <div class="level-left">
          <div class="level-item"><h1 class="title">
            Admin Profile
          </h1></div>
        </div>
        <div class="level-right" style="display: none;">
          <div class="level-item"></div>
        </div>
      </div>
    </div>
  </section>




  <section class="section is-main-section">

    <div class="card">
      <header class="card-header">
        <p class="card-header-title">
          <span class="icon"><i class="mdi mdi-finance"></i></span>
          Your Info
        </p>
        <a href="#" class="card-header-icon">
          <span class="icon"><i class="mdi mdi-reload"></i></span>
        </a>
      </header>

      <div class="card-content">

        <div class="content is-normal">
          <h1> <%=request.getAttribute("admin_username") %>  </h1>

        <h2>Detailed Information</h2>
        <ul>
          <li>  username : <%=request.getAttribute("admin_username") %></li>
            <li>role : <%=session.getAttribute("role") %> </li>
            <li>email : addmailhere@imbored</li>

        </div>

      </div>


    </div>

    <br><br><br>


  <footer class="footer">
    <div class="container-fluid">
      <div class="level">
        <div class="level-left">
          <div class="level-item">
            © 2021, XYZ Hotel
          </div>
          <div class="level-item">
            <
          </div>
        </div>
        <div class="level-right">
          <div class="level-item">
            <div class="logo">
              <a href="/home"><img src="" alt=" XYZ Hotel"></a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </footer>



<!-- Scripts below are for demo only -->
<script type="text/javascript" src="/js/main.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
<script type="text/javascript" src="/js/chart.sample.min.js"></script>

<!-- Icons below are for demo only. Feel free to use any icon pack. Docs: https://bulma.io/documentation/elements/icon/ -->
<link rel="stylesheet" href="https://cdn.materialdesignicons.com/4.9.95/css/materialdesignicons.min.css">
</body>
</html>
