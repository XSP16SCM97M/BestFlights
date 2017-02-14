<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="bestflight.*" %>
<%@ page import="java.util.*" %>
<%@ page import="DB.*" %>
<%@ page session="true" %><html>
    <%
    MySQLDataStoreUtilities Mysql = new MySQLDataStoreUtilities();
    Map users = new HashMap();
    Mysql.getConnection();
    users=Mysql.selectUser();
    String userid = request.getParameter("userid");
    String password = request.getParameter("password");
    String password2 = request.getParameter("password2");
    String type = request.getParameter("type");


%>
<html>
<head>
    <title>Sign i</title>
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
                <h1><a  href="index.html"><span>Best</span>Flight</a></h1>
            </div>

            <div class="clearfix"> </div>
        </div>
        <div class="nav-top">
            <div class="top-nav">
                <span class="menu"><img src="images/menu.png" alt="" /></span>

                <ul class="nav1">
                    <li class="active"><a href="index.jsp">Flights</a></li>

                    <% if (true){%>

                    <li class="active"><a href="index.jsp">Orders</a></li>

                    <% } %>

                </ul>
                <div class="clearfix"> </div>
                <!-- script-for-menu -->
                <script>
                    $( "span.menu" ).click(function() {
                        $( "ul.nav1" ).slideToggle( 300, function() {
                            // Animation complete.
                        });
                    });

                </script>
                <!-- /script-for-menu -->
            </div>
            <div class="dropdown-grids">
                <div id="loginContainer"><a href="#" id="loginButton"><span>Login</span></a>
                    <div id="loginBox">
                        <form id="loginForm" form method="post" action="/login.jsp">
                            <div class="login-grids">
                                <div class="login-grid-left">
                                    <fieldset id="body">
                                        <fieldset>
                                            <label for="email">User name/label>
                                                <input type="text" name="userid" id="email">
                                        </fieldset>
                                        <fieldset>
                                            <label for="password">Password</label>
                                            <input type="password" name="password" id="password">
                                        </fieldset>
                                        <input type="submit" id="login" value="Sign in">
                                        <label for="checkbox"><input type="checkbox" id="checkbox"> <i>Remember me</i></label>
                                    </fieldset>
                                    <span><a href="#">Forgot your password?</a></span>
                                    <div class="or-grid">
                                        <p>OR</p>
                                    </div>
                                    <div class="social-sits">
                                        <div class="facebook-button">
                                            <a href="#">Connect with Facebook</a>
                                        </div>
                                        <div class="chrome-button">
                                            <a href="#">Connect with Google</a>
                                        </div>
                                        <div class="button-bottom">
                                            <p>New account? <a href="signup.html">Signup</a></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<!--//header-->
<!-- banner -->
<div class="banner">
    <!-- container -->
    <div class="container">
        <div class="col-md-4 banner-left">
            <section class="slider2">
                <div class="flexslider">
                    <ul class="slides">
                        <li>
                            <div class="slider-info">
                                <img src="images/1.jpg" alt="">
                            </div>
                        </li>
                        <li>
                            <div class="slider-info">
                                <img src="images/2.jpg" alt="">
                            </div>
                        </li>
                        <li>
                            <div class="slider-info">
                                <img src="images/3.jpg" alt="">
                            </div>
                        </li>
                        <li>
                            <div class="slider-info">
                                <img src="images/4.jpg" alt="">
                            </div>
                        </li>
                        <li>
                            <div class="slider-info">
                                <img src="images/2.jpg" alt="">
                            </div>
                        </li>
                    </ul>
                </div>
            </section>
            <!--FlexSlider-->
        </div>
        <div class="copyrights">Collect from </div>
        <div class="col-md-8 banner-right">
            <div class="sap_tabs">
                <div class="booking-info">


                    <%if(userid != null && userid.length() != 0) {%>
                        <%userid = userid.trim();%>
                        <%}else{%>
                            <h2>Sign-up Failure! Invaild Username!</h2>
                            <form action="index.jsp">
                                <input type="submit" value="Home">
                            </form>
                    <%}%>
                    <%if(password != null && password.length() != 0 &&password.equals(password2)) {%>
                        <%password = password.trim();%>
                        <%}else{%>
                        <h2>Sign-up Failure! Invaild Password!</h2>
                        <form action="index.jsp">
                            <input type="submit" value="Home">
                        </form>
                    <%}%>

                    <%if(userid != null && userid.length() != 0&&password != null && password.length() != 0 &&password.equals(password2)) {%>
                    <%if(users.containsKey(userid)){%>
                    <h2>Sign-up Failure! Username already exist!</h2>
                    <form action="home.jsp">
                        <input type="submit" value="Home">
                    </form>
                    <%} else { %>
                    <%session.setAttribute("username",userid);%>
                    <h2>Welcom to Bestflight!<%=session.getAttribute("username")%></h2>
                    <form action="index.jsp">
                        <input type="submit" value="Home">
                    </form>
                    <%Mysql.insertUser(userid,password,"user");%>
                    <%}%>
                    <%}%>


                </div>
            </div>
        </div>
        <div class="clearfix"> </div>
    </div>
    <!-- //container -->
</div>
<div class="footer">
    <!-- container -->
    <div class="container">
        <div class="footer-top-grids">
            <div class="footer-grids">
                <div class="col-md-3 footer-grid">
                    <h4>Our Products</h4>
                    <ul>
                        <li><a href="index.jsp">Flight Schedule</a></li>
                        <li><a href="flights-hotels.html">City Airline Routes</a></li>
                        <li><a href="index.html">International Flights</a></li>
                        <li><a href="hotels.html">International Hotels</a></li>
                        <li><a href="bus.html">Bus Booking</a></li>
                        <li><a href="index.html">Domestic Airlines</a></li>
                        <li><a href="holidays.html">Holidays Trip</a></li>
                        <li><a href="hotels.html">Hotel Booking</a></li>
                    </ul>
                </div>
                <div class="col-md-3 footer-grid">
                    <h4>Company</h4>
                    <ul>
                        <li><a href="about.html">About Us</a></li>
                        <li><a href="faqs.html">FAQs</a></li>
                        <li><a href="terms.html">Terms &amp; Conditions</a></li>
                        <li><a href="privacy.html">Privacy </a></li>
                        <li><a href="contact.html">Contact Us</a></li>
                        <li><a href="#">Careers</a></li>
                        <li><a href="blog.html">Blog</a></li>
                        <li><a href="booking.html">Feedback</a></li>
                    </ul>
                </div>
                <div class="col-md-3 footer-grid">
                    <h4>Travel Resources</h4>
                    <ul>
                        <li><a href="holidays.html">Holidays Packages</a></li>
                        <li><a href="weekend.html">Weekend Getaways</a></li>
                        <li><a href="index.html">International Airports</a></li>
                        <li><a href="index.html">Domestic Flights Booking</a></li>
                        <li><a href="booking.html">Customer Support</a></li>
                        <li><a href="booking.html">Cancel Bookings</a></li>
                        <li><a href="booking.html">Print E-tickets</a></li>
                        <li><a href="booking.html">Customer Forums</a></li>
                        <li><a href="booking.html">Make a Payment</a></li>
                        <li><a href="booking.html">Complete Booking</a></li>
                        <li><a href="booking.html">Assurance Claim</a></li>
                        <li><a href="booking.html">Retail Offices</a></li>
                    </ul>
                </div>
                <div class="col-md-3 footer-grid">
                    <h4>More Links</h4>
                    <ul class="chf_footer_list">
                        <li><a href="#">Flights Discount Coupons</a></li>
                        <li><a href="#">Domestic Airlines</a></li>
                        <li><a href="#">Indigo Airlines</a></li>
                        <li><a href="#">Air Asia</a></li>
                        <li><a href="#">Jet Airways</a></li>
                        <li><a href="#">SpiceJet</a></li>
                        <li><a href="#">GoAir</a></li>
                        <li><a href="#">Air India</a></li>
                        <li><a href="#">Domestic Flight Routes</a></li>
                        <li><a href="#">Indian City Flight</a></li>
                        <li><a href="#">Flight Sitemap</a></li>
                    </ul>
                </div>
                <div class="clearfix"> </div>
            </div>
            <!-- news-letter -->
            <div class="news-letter">
                <div class="news-letter-grids">
                    <div class="col-md-4 news-letter-grid">
                        <p>Toll Free No : <span>1234-5678-901</span></p>
                    </div>
                    <div class="col-md-4 news-letter-grid">
                        <p class="mail">Email : <a href="mailto:info@example.com">mail@example.com</a></p>
                    </div>
                    <div class="col-md-4 news-letter-grid">
                        <form>
                            <input type="text" value="Email" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Email';}" required="">
                            <input type="submit" value="Subscribe">
                        </form>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
            <!-- //news-letter -->
        </div>
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
                        <li><a href="#"><img src="images/app2.png" alt="" /></a></a></li>
                        <li><a href="#"><img src="images/app3.png" alt="" /></a></a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-4 footer-bottom-left">
                <h4>We Accept</h4>
                <div class="a-cards">
                    <ul>
                        <li><a href="#"><img src="images/c1.png" alt="" /></a></li>
                        <li><a href="#"><img src="images/c2.png" alt="" /></a></a></li>
                        <li><a href="#"><img src="images/c3.png" alt="" /></a></a></li>
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
            <div class="clearfix"> </div>
            <div class="copyright">
                <p>Copyright &copy; 2015.Company name All rights reserved.<a target="_blank" href="http://www.cssmoban.com/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p>
            </div>
        </div>
    </div>
</div>
<script defer src="js/jquery.flexslider.js"></script>
<script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
<script src="js/jquery-ui.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript">
    $(function(){
        SyntaxHighlighter.all();
    });
    $(window).load(function(){
        $('.flexslider').flexslider({
            animation: "slide",
            start: function(slider){
                $('body').removeClass('loading');
            }
        });
    });
</script>
</body>
</html>