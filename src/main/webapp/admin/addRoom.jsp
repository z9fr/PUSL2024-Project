<%@ page import="com.example.xyzhotel.dao.admin.AdminHelper" %>
<%@ page import="com.example.xyzhotel.dao.bookings.getBookings" %>
<%@ page import="com.example.xyzhotel.beans.booking" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.example.xyzhotel.dao.user.singleValues" %>
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
            Add a new Room
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
         Enter details to add a room
        </p>
        <a href="#" class="card-header-icon">
          <span class="icon"><i class="mdi mdi-reload"></i></span>
        </a>
      </header>

      <div class="card-content">

        <div class="content is-normal">

          <form action="/user/admin/add/room/" method="post">


            <div class="field">
              <label class="label">Title</label>
              <div class="control">
                <input class="input" type="text" placeholder="Title for the Room" name="title">
              </div>
            </div>

            <div class="field">
              <label class="label">Price</label>
              <div class="control">
                <input class="input" type="text" placeholder="200" name="price">
              </div>
            </div>


            <div class="field">
              <label class="label">Room image url</label>
              <div class="control">
                <input class="input" type="text" placeholder="https://example.com/supercoolimage.jpg" name="room_image">
              </div>
            </div>


            <div class="field">
              <label class="label">room description</label>
              <div class="control">
                <textarea class="textarea" placeholder="Textarea" name="room_description"></textarea>
              </div>
            </div>
            <br>

            <div class="field is-grouped">
              <div class="control">
                <input type="submit" value="Submit"  class="button is-link">
              </div>
              <div class="control">
                <a href="/admin/home" class="button is-link is-light">cancel</a>
              </div>
            </div>


        </div>

          </form>

      </div>


    </div>

    <br><br><br>





    <!-- Scripts below are for demo only -->
    <script type="text/javascript" src="/js/main.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
    <script type="text/javascript" src="/js/chart.sample.min.js"></script>

    <!-- Icons below are for demo only. Feel free to use any icon pack. Docs: https://bulma.io/documentation/elements/icon/ -->
    <link rel="stylesheet" href="https://cdn.materialdesignicons.com/4.9.95/css/materialdesignicons.min.css">
</body>
</html>
