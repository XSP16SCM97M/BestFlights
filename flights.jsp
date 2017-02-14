<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>
  <head>
      <title>Ticketsinfo</title>
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
      <meta name="keywords" content="Govihar Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
	Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
      <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
      <link href="css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
      <link href="css/style.css" type="text/css" rel="stylesheet" media="all">
      <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
      <link type="text/css" rel="stylesheet" href="css/JFFormStyle-1.css" />
      <!-- js -->
      <script src="js/jquery.min.js"></script>
      <script src="js/modernizr.custom.js"></script>
      <!-- //js -->
      <!-- fonts -->
      <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,700,500italic,700italic,900,900italic' rel='stylesheet' type='text/css'>
      <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
      <!-- //fonts -->
      <script type="text/javascript">
        $(document).ready(function () {
          $('#horizontalTab').easyResponsiveTabs({
            type: 'default', //Types: default, vertical, accordion
            width: 'auto', //auto or any width like 600px
            fit: true   // 100% fit in a container
          });
        });
      </script>
      <!--pop-up-->
      <script src="js/menu_jquery.js"></script>
      <!--//pop-up-->
  </head>
  <body>
  <!--header-->
  <div class="header">
    <div class="container">
      <div class="header-grids">
        <div class="logo">
          <h1><a  href="index.jsp"><span>Best</span>Flight</a></h1>
        </div>
      </div>
    </div>
  </div>


  <div align="center">
    <h2>Search info</h2>
    <table border="2" cellpadding="5">
    <thead>
    <tr>
      <th>id&nbsp</th>
      <th>&nbspduration&nbsp</th>
      <th>&nbspflightNum&nbsp</th>
      <th>&nbspflightCarrier&nbsp</th>
      <th>&nbspaircraft&nbsp</th>
      <th>&nbsparrivalTime&nbsp</th>
      <th>&nbspdepartTime&nbsp</th>
      <th>&nbspdestination&nbsp</th>
      <th>&nbsporigin&nbsp</th>
      <th>&nbspprice&nbsp</th>
      <th>&nbspSelect?&nbsp</th>
    </tr>
    </thead>
    <tbody>
    <tr>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td><%= request.getParameter("flyto")%></td>
      <td><%= request.getParameter("flyfrom")%></td>
      <td></td>
      <td>
        <input type="radio" name="gender" value="yse"> Yes<br>
      </td>
    </tr>
    <tr>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td><%= request.getParameter("flyto")%></td>
      <td><%= request.getParameter("flyfrom")%></td>
      <td></td>
      <td>
        <input type="radio" name="gender" value="yse"> Yes<br>
      </td>
    </tr>
    </tbody>
  </table>

    <h1>API</h1>


  </div>

  <div class="footer">
    <!-- container -->
    <div class="container">
    </div>
    <!-- //container -->
  </div>
  <!-- //footer -->
  <div class="footer-bottom-grids">
    <!-- container -->
    <div class="container">
      <div class="footer-bottom-top-grids">
        <div class="col-md-4 footer-bottom-left">
          <h4>Download our mobile Apps</h4>
          <div class="d-apps">
            <ul>
              <li><a href="#"><img src="images/app1.png" alt="" /></a></li>
              <li><a href="#"><img src="images/app2.png" alt="" /></a></li>
              <li><a href="#"><img src="images/app3.png" alt="" /></a></li>
            </ul>
          </div>
        </div>
        <div class="col-md-4 footer-bottom-left">
          <h4>We Accept</h4>
          <div class="a-cards">
            <ul>
              <li><a href="#"><img src="images/c1.png" alt="" /></a></li>
              <li><a href="#"><img src="images/c2.png" alt="" /></a></li>
              <li><a href="#"><img src="images/c3.png" alt="" /></a></li>
            </ul>
          </div>
        </div>
        <div class="col-md-4 footer-bottom-left">
          <h4>Follow Us</h4>
          <div class="social">
            <ul>
              <li><a href="#" class="facebook"> </a></li>
              <li><a href="#" class="facebook twitter"> </a></li>
              <li><a href="#" class="facebook chrome"> </a></li>
              <li><a href="#" class="facebook dribbble"> </a></li>
            </ul>
          </div>
        </div>
        </div>
      </div>
    </div>
  </div>
  <script defer src="js/jquery.flexslider.js"></script>
  <script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
  <script src="js/jquery-ui.js"></script>
  <script type="text/javascript" src="js/script.js"></script>
  </body>
</html>