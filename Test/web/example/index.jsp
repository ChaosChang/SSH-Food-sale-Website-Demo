<%-- 
    Document   : index
    Created on : 2017-3-27, 22:36:40
    Author     : T5-SKYLAKE
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Home</title>
        <link href="${pageContext.request.contextPath}/example/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
        <link href="${pageContext.request.contextPath}/example/css/style.css" rel="stylesheet" type="text/css" media="all" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Curabitur Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/example/css/flexslider.css" type="text/css" media="screen" />
        <script src="${pageContext.request.contextPath}/example/js/jquery-1.11.1.min.js"></script>
        <!---- start-smoth-scrolling---->
        <script type="text/javascript" src="${pageContext.request.contextPath}/example/js/move-top.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/example/js/easing.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function ($) {
                $(".scroll").click(function (event) {
                    event.preventDefault();
                    $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1200);
                });
            });
        </script><!-- cart -->
        <script src="${pageContext.request.contextPath}/example/js/simpleCart.min.js"></script>
        <!-- cart -->
        <script src="${pageContext.request.contextPath}/example/js/bootstrap.js"></script>

    </head>
    <body>
        <!-- start-header section-->
        <div class="header">
            <div class="container">
                <div class="top-header">
                    <div class="logo wow fadeInLeft" data-wow-delay="0.5s">
                        <a href="${pageContext.request.contextPath}/example/index.jsp"><img src="${pageContext.request.contextPath}/example/images/logo.jpg" alt="" /></a>
                    </div>
                    <div class="phone">
                        <ul>
                            <li><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span></li>
                            <li><p>+021-6666666</p></li>
                        </ul>
                    </div>
                    <div class="logo">
                        <h1><a href="${pageContext.request.contextPath}/example/index.jsp">Omick Steaks</a></h1>
                    </div>
                    <div class="header-right">
                        <div class="login">
                            <c:if test="${applicationScope.user eq null}">
                                <a href="${pageContext.request.contextPath}/example/login.jsp">Login</a></c:if>
                            <c:if test="${applicationScope.user ne null}">
                                Welcome,${applicationScope.user.username}
                                <a href="userLogout">Logout</a></c:if>
                            </div>
                            <div class="cart box_1">
                                <a href="cartSearch">
                                    <h3> <span>我的购物车</span><img src="${pageContext.request.contextPath}/example/images/bag.png" alt=""></h3>
                            </a>	
                            <div class="clearfix"> </div>
                        </div>
                    </div>

                    <div class="clearfix"></div>
                </div>	
            </div>
        </div>
        <!-- end-header section-->
        <!--start-banner-->
        <div class="banner">
            <div class="container">
                <div class="top-menu">
                    <span class="menu"><img src="${pageContext.request.contextPath}/example/images/nav.png" alt=""/> </span>
                    <ul>
                        <li><a  href="${pageContext.request.contextPath}/example/index.jsp" class="active">主页</a></li>
                        <li><a  href="${pageContext.request.contextPath}/example/about.jsp">关于我们</a></li>
                        <li><a  href="${pageContext.request.contextPath}/example/menu.jsp">菜单</a></li>
                        <li><a  href="${pageContext.request.contextPath}/example/gallery.jsp">美食展示</a></li>
                        <li><a  href="${pageContext.request.contextPath}/example/events.jsp">特色环境</a></li>
                        <li><a  href="${pageContext.request.contextPath}/example/contact.jsp">联系我们</a></li>
                    </ul>
                    <!-- script for menu -->

                    <script>
                        $("span.menu").click(function () {
                            $(".top-menu ul").slideToggle("slow", function () {
                            });
                        });
                    </script>
                    <!-- //script for menu -->

                </div>
                <section class="slider">
                    <div class="flexslider">
                        <ul class="slides">
                            <li>
                                <div class="slider-info">
                                    <h2>Welcome</h2>
                                    <p>Omick Steaks will meet your taste!</p>
                                </div>
                            </li>
                            <li>
                                <div class="slider-info">
                                    <h2>Welcome</h2>
                                    <p>Omick Steaks will meet your taste!</p>
                                </div>
                            </li>
                            <li>	
                                <div class="slider-info">
                                    <h2>Welcome</h2>
                                    <p>Omick Steaks will meet your taste!</p>
                                </div>
                            </li>
                        </ul>
                    </div>
                </section>
                <!-- FlexSlider -->
                <script defer src="${pageContext.request.contextPath}/example/js/jquery.flexslider.js"></script>
                <script type="text/javascript">
                   $(function () {
                       SyntaxHighlighter.all();
                   });
                   $(window).load(function () {
                       $('.flexslider').flexslider({
                           animation: "slide",
                           start: function (slider) {
                               $('body').removeClass('loading');
                           }
                       });
                   });
                </script>
                <!-- FlexSlider -->
            </div>	
        </div>
        <!--end-banner-->
        <div class="content">
            <!--hot-offer-->
            <div class="today-offer">
                <div class="today-head">
                    <h3>Hot  Food</h3>
                    <p></p>
                </div>
                <div class="today-grids">
                    <div class="col-md-3 today-grid test1">
                        <img src="${pageContext.request.contextPath}/example/images/p1.jpg" class="img-responsive" alt="/">
                        <div class="textbox">
                            <h4>披萨</h4>
                            <p></p>
                        </div>
                    </div>
                    <div class="col-md-3 today-grid test1">
                        <img src="${pageContext.request.contextPath}/example/images/p2.jpg" class="img-responsive" alt="/">
                        <div class="textbox">
                            <h4>香辣鸡翅</h4>
                            <p></p>
                        </div>
                    </div>
                    <div class="col-md-3 today-grid test1">
                        <img src="${pageContext.request.contextPath}/example/images/p3.jpg" class="img-responsive" alt="/">
                        <div class="textbox">
                            <h4>香嫩鸡腿</h4>
                            <p></p>
                        </div>
                    </div>
                    <div class="col-md-3 today-grid test1">
                        <img src="${pageContext.request.contextPath}/example/images/p4.jpg" class="img-responsive" alt="/">
                        <div class="textbox">
                            <h4>巨无霸</h4>
                            <p></p>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <!--end-hot-offer-->
            <!--menu-->
            <div class="menu-offer">
                <div class="container">
                    <div class="menu-head">
                        <h3>Hot  Menu</h3>
                        <p></p>
                    </div>
                    <div class="menu-grids">
                        <div class="col-md-4 menu-grid">
                            <div class="menu-text">
                                <div class="menu-text-left">
                                    <h5>Cheese, tomato</h5>
                                </div>
                                <div class="menu-text-midle">
                                    <span class="line"> </span>
                                </div>
                                <div class="menu-text-right">
                                    <h5>$ 50</h5>
                                </div>
                                <div class="clearfix"> </div>
                            </div>	
                            <div class="menu-text">
                                <div class="menu-text-left">
                                    <h5>Chicken, mozzarella</h5>
                                </div>
                                <div class="menu-text-midle">
                                    <span class="line"> </span>
                                </div>
                                <div class="menu-text-right">
                                    <h5>$62</h5>
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                            <div class="menu-text">
                                <div class="menu-text-left">
                                    <h5>Tuna, Sweetcorn</h5>
                                </div>
                                <div class="menu-text-midle">
                                    <span class="line"> </span>
                                </div>
                                <div class="menu-text-right">
                                    <h5>$25</h5>
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                            <div class="menu-text">
                                <div class="menu-text-left">
                                    <h5>Minced, Beef</h5>
                                </div>
                                <div class="menu-text-midle">
                                    <span class="line"> </span>
                                </div>
                                <div class="menu-text-right">
                                    <h5>$30</h5>
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                        </div>
                        <div class="col-md-4 menu-grid">
                            <div class="menu-text">
                                <div class="menu-text-left">
                                    <h5>tomato, mushr</h5>
                                </div>
                                <div class="menu-text-midle">
                                    <span class="line"> </span>
                                </div>
                                <div class="menu-text-right">
                                    <h5>$ 50</h5>
                                </div>
                                <div class="clearfix"> </div>
                            </div>	
                            <div class="menu-text">
                                <div class="menu-text-left">
                                    <h5>Chicken, onions</h5>
                                </div>
                                <div class="menu-text-midle">
                                    <span class="line"> </span>
                                </div>
                                <div class="menu-text-right">
                                    <h5>$62</h5>
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                            <div class="menu-text">
                                <div class="menu-text-left">
                                    <h5>Tuna, Sweetcorn</h5>
                                </div>
                                <div class="menu-text-midle">
                                    <span class="line"> </span>
                                </div>
                                <div class="menu-text-right">
                                    <h5>$25</h5>
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                            <div class="menu-text">
                                <div class="menu-text-left">
                                    <h5>Pineapple, Beef</h5>
                                </div>
                                <div class="menu-text-midle">
                                    <span class="line"> </span>
                                </div>
                                <div class="menu-text-right">
                                    <h5>$30</h5>
                                </div>
                                <div class="clearfix"> </div>
                            </div>

                        </div>
                        <div class="col-md-4 menu-grid cooke">
                            <img src="${pageContext.request.contextPath}/example/images/p5.jpg" class="img-responsive" alt="/">
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
            <!--end-menu-->
            <div class="order-grids">
                <div class="container">
                    <div class="order-head">
                        <h3>Our  difference</h3>
                        <p>&nbsp;</p>
                    </div>
                    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingOne">
                                <h4 class="panel-title">
                                    <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                        Dessert cake
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                                <div class="panel-body">
                                    <div class="col-md-3 order-grid">
                                        <img src="${pageContext.request.contextPath}/example/images/d1.jpg" class="img-responsive" alt="/">
                                    </div>
                                    <div class="col-md-3 order-grid">
                                        <img src="${pageContext.request.contextPath}/example/images/d2.jpg" class="img-responsive" alt="/">
                                    </div>
                                    <div class="col-md-3 order-grid">
                                        <img src="${pageContext.request.contextPath}/example/images/d3.jpg" class="img-responsive" alt="/">
                                    </div>
                                    <div class="col-md-3 order-grid">
                                        <img src="${pageContext.request.contextPath}/example/images/d4.jpg" class="img-responsive" alt="/">
                                    </div>
                                    <div class="clerafix"></div>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingTwo">
                                <h4 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                        Western Food
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                                <div class="panel-body">
                                    <div class="col-md-3 order-grid">
                                        <img src="${pageContext.request.contextPath}/example/images/p6.jpg" class="img-responsive" alt="/">
                                    </div>
                                    <div class="col-md-3 order-grid">
                                        <img src="${pageContext.request.contextPath}/example/images/p7.jpg" class="img-responsive" alt="/">
                                    </div>
                                    <div class="col-md-3 order-grid">
                                        <img src="${pageContext.request.contextPath}/example/images/p8.jpg" class="img-responsive" alt="/">
                                    </div>
                                    <div class="col-md-3 order-grid">
                                        <img src="${pageContext.request.contextPath}/example/images/p9.jpg" class="img-responsive" alt="/">
                                    </div>
                                    <div class="clerafix"></div>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingFour">
                                <h4 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFoure">
                                        Main Course
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
                                <div class="panel-body">
                                    <div class="col-md-3 order-grid">
                                        <img src="${pageContext.request.contextPath}/example/images/s1.jpg" class="img-responsive" alt="/">
                                    </div>
                                    <div class="col-md-3 order-grid">
                                        <img src="${pageContext.request.contextPath}/example/images/s2.jpg" class="img-responsive" alt="/">
                                    </div>
                                    <div class="col-md-3 order-grid">
                                        <img src="${pageContext.request.contextPath}/example/images/s3.jpg" class="img-responsive" alt="/">
                                    </div>
                                    <div class="col-md-3 order-grid">
                                        <img src="${pageContext.request.contextPath}/example/images/s4.jpg" class="img-responsive" alt="/">
                                    </div>
                                    <div class="clerafix"></div>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingFive">
                                <h4 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                                        Starters and Salads
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFive">
                                <div class="panel-body">
                                    <div class="col-md-3 order-grid">
                                        <img src="${pageContext.request.contextPath}/example/images/s5.jpg" class="img-responsive" alt="/">
                                    </div>
                                    <div class="col-md-3 order-grid">
                                        <img src="${pageContext.request.contextPath}/example/images/s6.jpg" class="img-responsive" alt="/">
                                    </div>
                                    <div class="col-md-3 order-grid">
                                        <img src="${pageContext.request.contextPath}/example/images/s7.jpg" class="img-responsive" alt="/">
                                    </div>
                                    <div class="col-md-3 order-grid">
                                        <img src="${pageContext.request.contextPath}/example/images/s8.jpg" class="img-responsive" alt="/">
                                    </div>
                                    <div class="clerafix"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!---//End-banner---->
            <script type="text/javascript" src="${pageContext.request.contextPath}/example/js/jquery.lightbox.js"></script>
            <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/example/css/lightbox.css" media="screen" />
            <script type="text/javascript">
                                                         $(function () {
                                                             $('.gallery a').lightBox();
                                                         });
            </script>
            <!---->

            <div class="footer text-center">
                <div class="container">
                    <a class="wow bounceIn" data-wow-delay="0.5s" href="${pageContext.request.contextPath}/example/index.jsp"><img src="${pageContext.request.contextPath}/example/images/logo.png" alt="" /></a>
                    <p class="wow bounceIn" data-wow-delay="0.4s">Copyright &copy; 2017.Donghua University All rights reserved.</a></p>
                    <div class="social">
                        <a href="${pageContext.request.contextPath}/example/404error.jsp"><span class="behance"></span></a>
                        <a href="${pageContext.request.contextPath}/example/404error.jsp"><span class="dribble"></span></a>
                        <a href="http://www.twitter.com"><span class="twitter"></span></a>
                        <a href="http://www.facebook.com"><span class="facebook"></span></a>
                        <a href="http://www.linkedin.com"><span class="linkedin"></span></a>
                    </div>
                </div>
            </div>
            <!---->
            <script type="text/javascript">
                $(document).ready(function () {
                    /*
                     var defaults = {
                     containerID: 'toTop', // fading element id
                     containerHoverID: 'toTopHover', // fading element hover id
                     scrollSpeed: 1200,
                     easingType: 'linear' 
                     };
                     */

                    $().UItoTop({easingType: 'easeOutQuart'});

                });
            </script>
            <a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>


        </div>
    </div>



</body>
</html>
