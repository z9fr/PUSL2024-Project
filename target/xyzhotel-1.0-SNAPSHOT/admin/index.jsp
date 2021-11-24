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
            Dashboard
          </h1></div>
        </div>
        <div class="level-right" style="display: none;">
          <div class="level-item"></div>
        </div>
      </div>
    </div>
  </section>












  <section class="section is-main-section">
    <div class="tile is-ancestor">
      <div class="tile is-parent">
        <div class="card tile is-child">
          <div class="card-content">
            <div class="level is-mobile">
              <div class="level-item">
                <div class="is-widget-label"><h3 class="subtitle is-spaced">
                  Users
                </h3>
                  <h1 class="title">
                    <%=request.getAttribute("userCount")%>
                  </h1>
                </div>
              </div>
              <div class="level-item has-widget-icon">
                <div class="is-widget-icon"><span class="icon has-text-primary is-large"><i
                    class="mdi mdi-account-multiple mdi-48px"></i></span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="tile is-parent">
        <div class="card tile is-child">
          <div class="card-content">
            <div class="level is-mobile">
              <div class="level-item">
                <div class="is-widget-label"><h3 class="subtitle is-spaced">
                  Total Bookings
                </h3>
                  <h1 class="title">
                    <%=request.getAttribute("totalBookings")%>
                  </h1>
                </div>
              </div>
              <div class="level-item has-widget-icon">
                <div class="is-widget-icon"><span class="icon has-text-info is-large"><i
                    class="mdi mdi-cart-outline mdi-48px"></i></span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="tile is-parent">
        <div class="card tile is-child">
          <div class="card-content">
            <div class="level is-mobile">
              <div class="level-item">
                <div class="is-widget-label"><h3 class="subtitle is-spaced">
                  Performance
                </h3>
                  <h1 class="title">
                    256%
                  </h1>
                </div>
              </div>
              <div class="level-item has-widget-icon">
                <div class="is-widget-icon"><span class="icon has-text-success is-large"><i
                    class="mdi mdi-finance mdi-48px"></i></span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="card">
      <header class="card-header">
        <p class="card-header-title">
          <span class="icon"><i class="mdi mdi-finance"></i></span>
          Performance
        </p>
        <a href="#" class="card-header-icon">
          <span class="icon"><i class="mdi mdi-reload"></i></span>
        </a>
      </header>
      <div class="card-content">
        <div class="chart-area">
          <div style="height: 100%;">
            <div class="chartjs-size-monitor">
              <div class="chartjs-size-monitor-expand">
                <div></div>
              </div>
              <div class="chartjs-size-monitor-shrink">
                <div></div>
              </div>
            </div>
            <canvas id="big-line-chart" width="2992" height="1000" class="chartjs-render-monitor" style="display: block; height: 400px; width: 1197px;"></canvas>
          </div>
        </div>
      </div>
    </div>
    <div class="card has-table has-mobile-sort-spaced">
      <header class="card-header">
        <p class="card-header-title">
          <span class="icon"><i class="mdi mdi-account-multiple"></i></span>
          Clients
        </p>
        <a href="#" class="card-header-icon">
          <span class="icon"><i class="mdi mdi-reload"></i></span>
        </a>
      </header>
      <div class="card-content">
        <div class="b-table has-pagination">
          <div class="table-wrapper has-mobile-cards">

            <!-- table to display the booking details -->

            <table class="table is-fullwidth is-striped is-hoverable is-sortable is-fullwidth">
              <thead>
              <tr>
                <th></th>
                <th>Booking&nbsp;id&nbsp;</th>
                <th>Booked&nbsp;By&nbsp;</th>
                <th>Start&nbsp;Date&nbsp;</th>
                <th>End&nbsp;Date&nbsp;</th>
                <th>Room&nbsp;Id&nbsp;</th>
                <th>Payment&nbsp;Amount&nbsp;</th>
                <th>Booking&nbsp;Reason&nbsp;</th>
                <th></th>
              </tr>
              </thead>
              <tbody>


              <%

                getBookings bookingsDao = new getBookings();


                List<booking> bookings = bookingsDao.AllBookings();

                int BookingId = 0;
                if (bookings != null) {
                  Iterator<booking> iterator2 = bookings.iterator();
                  while (iterator2.hasNext()) {
                    booking booking = iterator2.next();
              %>


              <tr>
                <td class="is-image-cell">
                  <div class="image">

                  </div>
                </td>

                <td data-label="Booking id"> <%=booking.getBooking_id()%></td>

                <%
                  singleValues sv = new singleValues();
                  String uname = sv.getUserName(booking.getBooked_by());

                  BookingId = booking.getBooking_id();

                %>


                <td data-label="Booked By"><a href="/user/admin/uprofile?id=<%=booking.getBooked_by()%>"><%=uname%> </a> </td>

                <td data-label="Start Date"> <%=booking.getStart_date()%></td>

                <td data-label="End Date"> <%=booking.getEnd_date()%></td>

                <td data-label="room id"> <%=booking.getRoom_id()%></td>

                <td data-label="End Date"> <%=booking.getPaymentAmount()%></td>


                <td data-label="reason"> <%=booking.getReason()%></td>



                <td class="is-actions-cell">
                  <div class="buttons is-right">
                    <a class="button is-small is-primary" type="button" href="/user/admin/view/booking?id=<%=booking.getBooking_id()%>">
                      <span class="icon"><i class="mdi mdi-eye"></i></span>
                    </a>



                    <a class="button is-small is-danger jb-modal" data-target="sample-modal" type="button">
                      <span class="icon"><i class="mdi mdi-trash-can"></i></span>
                    </a>
                  </div>
                </td>
              </tr>

              <%
                }
              } else { %>

              <p> no oders found yet. </p>
              <%
                }
              %>



              </tbody>
            </table>
          </div>

        </div>
      </div>
    </div>
  </section>
  <footer class="footer">
    <div class="container-fluid">
      <div class="level">
        <div class="level-left">
          <div class="level-item">
            © 2021, XYZ Hotel
          </div>
          <div class="level-item">
            <a href="https://github.com/vikdiesel/admin-one-bulma-dashboard" style="height: 20px">
              <img src="https://img.shields.io/github/v/release/vikdiesel/admin-one-bulma-dashboard?color=%23999">
            </a>
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
</div>

<div id="sample-modal" class="modal">
  <div class="modal-background jb-modal-close"></div>
  <div class="modal-card">
    <header class="modal-card-head">
      <p class="modal-card-title">Confirm action</p>
      <a class="delete jb-modal-close" aria-label="close" href="/user/admin/delete/booking?id=<%=BookingId%>"></a>
    </header>
    <section class="modal-card-body">
      <p>This will permanently delete <b>Some Object</b></p>
      <p>This is sample modal</p>
    </section>
    <footer class="modal-card-foot">
      <button class="button jb-modal-close">Cancel</button>
      <a class="button is-danger jb-modal-close"  href="/user/admin/delete/booking?id=<%=BookingId%>" >Delete</a>
    </footer>
  </div>
  <button class="modal-close is-large jb-modal-close" aria-label="close"></button>
</div>

<!-- Scripts below are for demo only -->
<script type="text/javascript" src="/js/main.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
<script type="text/javascript" src="/js/chart.sample.min.js"></script>

<!-- Icons below are for demo only. Feel free to use any icon pack. Docs: https://bulma.io/documentation/elements/icon/ -->
<link rel="stylesheet" href="https://cdn.materialdesignicons.com/4.9.95/css/materialdesignicons.min.css">
</body>
</html>
