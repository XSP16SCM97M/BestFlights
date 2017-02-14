

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="bestflight.*" %>
<%@ page import="DB.MySQLDataStoreUtilities" %>
<!DOCTYPE html>
<html>
<head>
  <title>ordermanagement</title>
  <!-- Custom Theme files -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="keywords" content="Govihar Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
	Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
  <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
  <!-- //Custom Theme files -->
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
        <h1><a  href="index.html"><span>BestFlight</span></a></h1>
      </div>
      <div class="clearfix"> </div>
    </div>
  </div>
</div>

<div align="center">
  <h1>Order management:</h1>

  <table border="02" cellpadding="1">
    <thead>
    <tr>
      <th>Ticket Id</th>
      <th>User Id</th>
      <th>Passanger Name</th>
      <th>Email Address</th>
      <th>Credit Card</th>
      <th>Address</th>
      <th>Date </th>
      <th>Price</th>
      <th> </th>
    </tr>
    </thead>
    <tbody>
    <%
      MySQLDataStoreUtilities mySQLDataStoreUtilities = new MySQLDataStoreUtilities();
      mySQLDataStoreUtilities.getConnection();
      boolean isPost = "POST".equals(request.getMethod());
      if(isPost){
        if(request.getParameter("update")!=null){
          System.out.println("update statment");
          String userid=request.getParameter("userId");
          String orderId=request.getParameter("orderId");
          String userName=request.getParameter("userName");
          String emailId=request.getParameter("emailId");
          String creditCard=request.getParameter("creditCard");
          String address=request.getParameter("address");
          String date=request.getParameter("date");
          String price=request.getParameter("price");
          mySQLDataStoreUtilities.updateOrder(new Order(userid,orderId,userName,emailId,creditCard,address,date,price));
        }else if(request.getParameter("delete")!=null){
          System.out.println("delete statment");
          String orderId=request.getParameter("orderId");
          mySQLDataStoreUtilities.deleteOrder(orderId);
        }
      }
      ArrayList<Order> orders= (ArrayList<Order> )mySQLDataStoreUtilities.getOrder();

      for (Order order : orders) {
        out.println("<tr>");
        out.println("<form action=\"order.jsp\" method=\"post\" >");
        out.println("<td>"+order.getTicketId()+"<input name=\"orderId\" value =\""+order.getTicketId()+"\" type=\"hidden\" /></td>");
        out.println("<td><input name=\"userId\" value =\""+order.getUid()+"\" type=\"text\" size=\"10\" /></td>");
        out.println("<td><input name=\"userName\" value =\""+order.getName()+"\" type=\"text\" size=\"10\" /></td>");
        out.println("<td><input name=\"emailId\" value =\""+order.getEmail()+"\" type=\"text\" size=\"10\" /></td>");
        out.println("<td><input name=\"creditCard\" value =\""+order.getCreditcard()+"\" type=\"text\" size=\"10\" /></td>");
        out.println("<td><input name=\"address\" value =\""+order.getAddress()+"\" type=\"text\" size=\"20\" /></td>");
        out.println("<td><input name=\"date\" value =\""+order.getDate()+"\" type=\"text\" size=\"10\" /></td>");
        out.println("<td><input name=\"price\" value =\""+order.getPrice()+"\" type=\"text\" size=\"10\" /></td>");
        out.println(" <td>");
        out.println("<input name=\"update\" class=\"formbutton\" value=\"Update Order\" type=\"submit\" size=\"10\" />");
        out.println("<input name=\"delete\" class=\"formbutton\" value=\"Delete Order\" type=\"submit\"  size=\"10\"/>");
        out.println("</td>");
        out.println("</form>");
        out.println("</tr>");
      }

    %>
    </tbody>
  </table>
</div>


<div class="footer-bottom-top-grids">
  <div class="copyright">
    <p>Copyright © 2016.BestFlight All rights reserved.<a target="_blank" href="http://www.cssmoban.com/"></a></p>
  </div>
</div>

<script defer src="js/jquery.flexslider.js"></script>
<script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
<script src="js/jquery-ui.js"></script>
<script type="text/javascript" src="js/script.js"></script>
</body>
</html>