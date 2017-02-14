

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="bestflight.*" %>
<%@ page import="DB.MySQLDataStoreUtilities" %>
<!DOCTYPE html>
<html>
<head>
  <title>usermanagement</title>
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
  <h1>User Management</h1>
  <table border="02" cellpadding="5">
    <thead>
    <tr>
      <th>User Id</th>
      <th>Password</th>
      <th>User Type</th>
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
          String password=request.getParameter("pass");
          String userType=request.getParameter("userType");
          mySQLDataStoreUtilities.updateUser(new User(userid,password,userType));
        }else if(request.getParameter("delete")!=null){
          System.out.println("delete statment");
          String userid=request.getParameter("userId");
          mySQLDataStoreUtilities.deleteUser(userid);
        }
      }
      HashMap<String,User> users= (HashMap<String,User> )mySQLDataStoreUtilities.selectUser();

      for (User user : users.values()) {
        out.println("<tr>");
        out.println("<form action=\"user.jsp\" method=\"post\" >");
        out.println("<td>"+user.getID()+"<input name=\"userId\" value =\""+user.getID()+"\" type=\"hidden\" /></td>");
        out.println("<td><input name=\"pass\" value =\""+user.getPasswd()+"\" type=\"text\" /></td>");
        out.println("<td><input name=\"userType\" value =\""+user.getType()+"\" type=\"text\" /></td>");
        out.println(" <td>");
        out.println("<input name=\"update\" class=\"formbutton\" value=\"Update User\" type=\"submit\" />");
        out.println("<input name=\"delete\" class=\"formbutton\" value=\"delete User\" type=\"submit\" />");
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