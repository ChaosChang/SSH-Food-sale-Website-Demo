<%-- 
    Document   : about
    Created on : 2017-3-27, 23:49:19
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
        <title>About</title>
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
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/example/css/normalize.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/example/css/chiefstyle.css" />
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
                                    <h3> <span class="simpleCart_total"> 我的购物车 </span><img src="${pageContext.request.contextPath}/example/images/bag.png" alt=""></h3>
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
                        <li><a href="${pageContext.request.contextPath}/example/about.jsp" class="active">关于我们</a></li>
                        <li><a href="${pageContext.request.contextPath}/example/menu.jsp">菜单</a></li>
                        <li><a href="${pageContext.request.contextPath}/example/gallery.jsp">美食展示</a></li>
                        <li><a href="${pageContext.request.contextPath}/example/events.jsp">特色环境</a></li>
                        <li><a href="${pageContext.request.contextPath}/example/contact.jsp">联系我们</a></li>
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
            </div>
        </div>
        <!--end-banner-->
        <form action="searchShop" method="post">
            <div class="banner-bottom">
                <div class="container">
                    <div class="droop-down">
                        <div class="col-md-3 droop">
                            <div class="sort-by">
                                <label>城市</label>
                                <select name="city" onchange="ss(this.value)">
                                    <c:forEach items="${shoplist}" var="s">
                                        <option value="${s.city}">
                                            ${s.city}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-3 droop">
                            <div class="sort-by">
                                <label>商家</label>
                                <select name="shopname">
                                    <c:forEach items="${shoplist}" var="s">
                                        <option value="${s.shopname}">
                                            ${s.shopname}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-3 search">
                            <input type="submit" value="查询">
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </form>
        <div class="content">
            <div class="aboutus">
                <div class="container">
                    <h3>About us</h3>
                    <div class="about-grids">
                        <div class="col-md-7 about-grid">
                            <h4>Best service best food & beast atmosphere!</h4>
                            <h4>
                                <img src="${applicationScope.currentShop.shopimage}" class="img-responsive" alt="/">
                            </h4>
                        </div>
                        <div class="col-md-5 about-grid1">

                            <p>&nbsp;</p>
                            <p>&nbsp;</p>
                            <p>&nbsp;</p>
                            <p>&nbsp;</p>
                            <p>&nbsp;</p>
                            <p>用餐环境：</p>
                            <P>${applicationScope.currentShop.shopdescribe}</P>
                            <h3>&nbsp;</h3>
                        </div><div class="clearfix"></div>
                    </div>
                </div>
            </div>
            <div class="ourteam">
                <div class="container">
                    <h3>Our Chef</h3>
                    <div class="main_banner">
                        <div class="main_banner_wrap">
                            <div class="main_banner_box" id="m_box">
                                <a href="javascript:void(0)" class="banner_btn js_pre">
                                    <span class="banner_btn_arrow"><i></i></span>
                                </a>
                                <a href="javascript:void(0)" class="banner_btn btn_next js_next">
                                    <span class="banner_btn_arrow"><i></i></span>
                                </a>

                                <ul>
                                    <li id="imgCard0">
                                        <a href=""><span style="opacity:0;"></span></a>
                                        <img src="${currentchef[0].cplace}" alt="">
                                        <p style="bottom:0">${currentchef[0].chefname}</p>
                                    </li>
                                    <li id="imgCard1">
                                        <a href=""><span style="opacity:0.4;"></span></a>
                                        <img src="${currentchef[1].cplace}" alt="">
                                        <p>${currentchef[1].chefname}</p>
                                    </li>
                                    <li id="imgCard2">
                                        <a href=""><span style="opacity:0.4;"></span></a>
                                        <img src="${currentchef[2].cplace}" alt="">
                                        <p>${currentchef[2].chefname}</p>
                                    </li>
                                    <li id="imgCard3">
                                        <a href=""><span style="opacity:0.4;"></span></a>
                                        <img src="${currentchef[3].cplace}" alt="">
                                        <p>${currentchef[3].chefname}</p>
                                    </li>
                                    <li id="imgCard4">
                                        <a href=""><span style="opacity:0.4;"></span></a>
                                        <img src="${currentchef[4].cplace}" alt="">
                                        <p>${currentchef[4].chefname}</p>
                                    </li>
                                </ul>
                                <!--火狐倒影图层-->
                                <p id="rflt"></p>
                                <!--火狐倒影图层-->
                            </div>
                            <!--序列号按钮-->
                            <div class="btn_list">
                                <span class="curr"></span><span></span><span></span><span></span><span></span>
                            </div>
                        </div>
                    </div>
                    <script src="http://cdn.bootcss.com/jquery/1.11.0/jquery.min.js" type="text/javascript"></script>
                    <script>window.jQuery || document.write('<script src="js/jquery-1.11.0.min.js"><\/script>')</script>
                    <script type="text/javascript" src="${pageContext.request.contextPath}/example/js/main.js"></script>                
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
            function a() {
                $("select option").each(function () {
                    text = $(this).text();
                    if ($("select option:contains(" + text + ")").length > 1)
                        $("select option:contains(" + text + "):gt(0)").remove();
                });
            }
            ;
            window.onload = a;
        </script>
        <script type="text/javascript">
            function ss(value) {
                var selectedOption = value;
                var s = document.getElementById("shopname");
                //alert(selectedOption.value);  
                var shop;
                var count = 0;
                for (var i = 0; i < shop.size; i++)
                {
                    if (selectedOption === shop[i].city) {
                        s.options[count].text = shop[i].shopname;
                        s.options[count].value = shop[i].shopname;
                        count++;
                    }
                }
        </script>

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
            }
            );
        </script>
        <a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>


    </div>
</div>



</body>
</html>
