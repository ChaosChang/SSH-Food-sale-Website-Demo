<%--
    Document   : checkout
    Created on : 2017-3-28, 12:47:18
    Author     : T5-SKYLAKE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*,java.text.*"
        import="java.math.BigDecimal"
        import="java.util.List"
        import="com.opensymphony.xwork2.ActionContext"
        import="example.Bean.Cart"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Check out</title>
        <link href="${pageContext.request.contextPath}/example/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
        <link href="${pageContext.request.contextPath}/example/css/style.css" rel="stylesheet" type="text/css" media="all" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Curabitur Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/example/css/flexslider.css" type="text/css" media="screen" />
        <script src="${pageContext.request.contextPath}/example/js/jquery-1.11.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/example/js/bootstrap.js"></script>
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
        </script>
        <!---End-smoth-scrolling---->

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
                                    <h3> <span>我的购物车</span><img src="images/bag.png" alt=""></h3>
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
            <div class="banner ban1">
                <div class="container">
                    <div class="top-menu">
                        <span class="menu"><img src="${pageContext.request.contextPath}/example/images/nav.png" alt="" /> </span>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/example/index.jsp">主页</a></li>
                        <li><a href="${pageContext.request.contextPath}/example/about.jsp">关于我们</a></li>
                        <li><a href="${pageContext.request.contextPath}/example/menu.jsp">菜单</a></li>
                        <li><a href="${pageContext.request.contextPath}/example/gallery.jsp">美食展示</a></li>
                        <li><a href="${pageContext.request.contextPath}/example/events.jsp">特色环境</a></li>
                        <li><a href="${pageContext.request.contextPath}/example/contact.jsp">联系我们</a></li>
                    </ul><!-- script for menu -->

                    <script>
                        $("span.menu").click(function () {
                            $(".top-menu ul").slideToggle("slow", function () {
                            });
                        });
                    </script>
                    <!-- //script for menu -->
                </div>
            </div>
        </div>
        <!--end-banner-->
        <!-- checkout -->
        <div class="cart-items">
            <div class="container">
                <h1>我的购物车</h1>
                <c:forEach items="${realcartlist}" var="rc">
                    <div class="cart-header">
                        <div class="close1"> </div>
                        <div class="cart-sec simpleCart_shelfItem">
                            <div class="cart-item cyc">
                                <img src="${rc.image}" class="img-responsive" alt="">
                            </div>
                            <div class="cart-item-info">
                                <h3>&nbsp;</h3>
                                <div class="delivery">
                                    <p>Service Charges : ${rc.money}</p>
                                </div>
                                <div class="delivery">
                                    <p>Buy Number : ${rc.number}</p>
                                </div>
                            </div>
                            <a href="cartRemove.action?cartId=${rc.cartId}"><button  type="submit" class="btn btn-danger"><i class="icon-trash icon-white"></i> 删除</button></a>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <form method="post" action="orderAdd">
                <div>
                    <%int money = 0;
                        List cart = (List) ActionContext.getContext().getApplication().get("realcartlist");
                        for (int i = 0; i < cart.size(); i++) {
                            money += ((Cart) cart.get(i)).getNumber() * ((Cart) cart.get(i)).getMoney().intValue();
                        }
                    %>
                    Total Money:<input type="text" name="totalmoney" value="<%=money%>"/><br>
                </div>
                <div>
                    <button type="submit" class="btn btn-primary">提交订单</button>
                </div>
                <%SimpleDateFormat template
                            = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    String today = template.format(new java.util.Date()).substring(0, 10);%>
                <input type="hidden" name="orderdate" value="<%=today%>"/>
            </form>
        </div>
        <!-- checkout -->
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
