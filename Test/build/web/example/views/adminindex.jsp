<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!-- 引入标签库 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
    <head>
        <title>OMEGA后台</title>


        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/example/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/example/css/theme.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/example/css/font-awesome.css">
        <script src="${pageContext.request.contextPath}/example/js/jquery-1.7.2.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/example/js/bootstrap.js"></script>


        <!-- Demo page code -->

        <style type="text/css">
            #line-chart {
                height:300px;
                width:800px;
                margin: 0px auto;
                margin-top: 1em;
            }
            .brand { font-family: georgia, serif; }
            .brand .first {
                color: #ccc;
                font-style: italic;
            }
            .brand .second {
                color: #fff;
                font-weight: bold;
            }
        </style>


    </head>
    <body class=""> 
        <!--<![endif]-->

        <div class="navbar">
            <div class="navbar-inner">
                <ul class="nav pull-right">

                    <li><a href="#" class="hidden-phone visible-tablet visible-desktop" role="button">设置</a></li>
                    <li id="fat-menu" class="dropdown">
                        <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="icon-user"></i>${applicationScope.admin.adname}
                            <i class="icon-caret-down"></i>
                        </a>

                        <ul class="dropdown-menu">
                            <li><a tabindex="-1" href="/WirelessOrder/home.do?flag=grzx">个人中心</a></li>
                            <li class="divider"></li>
                            <li><a tabindex="-1" href="/WirelessOrder/login.do?flag=logout">退出</a></li>
                        </ul>
                    </li>

                </ul>
            </div>
        </div>




        <div class="sidebar-nav">
            <form class="search form-inline">
                <input type="text" placeholder="Search...">
            </form>

            <a href="${pageContext.request.contextPath}/example/views/adminindex.jsp" class="nav-header" data-toggle="collapse"><i class="icon-dashboard"></i>首页</a>
            <ul id="dashboard-menu" class="nav nav-list collapse in">
                <li><a href="/WirelessOrder/home.do?flag=grzx">个人中心</a></li>
            </ul>

            <a href="userSearch" class="nav-header" data-toggle="collapse"><i class="icon-table"></i>用户
            </a>
            <ul id="user-menu" class="nav nav-list collapse">
                <li ><a href="">用户管理</a></li>
            </ul>

            <a href="shopSearch" class="nav-header collapsed" data-toggle="collapse"><i class="icon-reorder"></i>商家
            </a>
            <ul id="shop-menu" class="nav nav-list collapse">
                <li ><a href="">商家管理</a></li>
            </ul>
            
            <a href="goodSearch" class="nav-header" data-toggle="collapse"><i class="icon-th-large"></i>商品</a>
            <ul id="good-menu" class="nav nav-list collapse">
                <li ><a href="">商品管理</a></li>
            </ul>

            <a href="orderSearch" class="nav-header" data-toggle="collapse"><i class="icon-th-large"></i>订单</a>
            <ul id="order-menu" class="nav nav-list collapse">
                <li ><a href="/WirelessOrder/order.do?flag=order">订单管理</a></li>
            </ul>
            
            <a href="eimageSearch" class="nav-header" data-toggle="collapse"><i class="icon-th-large"></i>环境</a>
            <ul id="envi-menu" class="nav nav-list collapse">
                <li ><a href="/WirelessOrder/order.do?flag=order">环境图片管理</a></li>
            </ul>
            
            <a href="gimageSearch" class="nav-header" data-toggle="collapse"><i class="icon-th-large"></i>食物</a>
            <ul id="food-menu" class="nav nav-list collapse">
                <li ><a href="/WirelessOrder/order.do?flag=order">食物图片管理</a></li>
            </ul>
            
            <a href="chefSearch" class="nav-header" data-toggle="collapse"><i class="icon-th-large"></i>厨师</a>
            <ul id="chef-menu" class="nav nav-list collapse">
                <li ><a href="/WirelessOrder/order.do?flag=order">厨师管理</a></li>
            </ul>
        </div>



        <div class="content">

            <div class="header">
                <h1 class="page-title">首页</h1>
            </div>

            <ul class="breadcrumb">
                <li>首页 <span class="divider">/</span></li>
                <li class="active">报表</li>
            </ul>

            <div class="container-fluid">
                <div class="row-fluid">


                    <div class="row-fluid">
                        <div class="block span6">
                            <a href="#tablewidget" class="block-heading" data-toggle="collapse">昨日</a>
                            <div id="tablewidget" class="block-body collapse in">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>经营支出</th>
                                            <td>5000</td>
                                        </tr>
                                    </thead>
                                    <thead>
                                        <tr>
                                            <th>经营收入</th>
                                            <td>15000</td>
                                        </tr>
                                    </thead>
                                    <thead>
                                        <tr>
                                            <th>接待人次</th>
                                            <td>186</td>
                                        </tr>
                                    </thead>
                                    <thead>
                                        <tr>
                                            <th>营业收入</th>
                                            <td>10000</td>
                                        </tr>
                                    </thead>
                                </table>
                                <p><a href="http://www.52itstyle.com">更多...</a></p>
                            </div>
                        </div>
                        <div class="block span6">
                            <a href="#tablewidget" class="block-heading" data-toggle="collapse">今日</a>
                            <div id="tablewidget" class="block-body collapse in">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>当前收入</th>
                                            <td>8000</td>
                                        </tr>
                                    </thead>
                                    <thead>
                                        <tr>
                                            <th>当前人次</th>
                                            <td>45</td>
                                        </tr>
                                    </thead>

                                    <thead>
                                        <tr>
                                            <th>待结账</th>
                                            <td>25</td>
                                        </tr>
                                    </thead>
                                    <thead>
                                        <tr>
                                            <th>待上菜</th>
                                            <td>20</td>
                                        </tr>
                                    </thead>
                                </table>
                                <p><a href="http://www.52itstyle.com">更多...</a></p>
                            </div>
                        </div>

                    </div>


                    <div class="row-fluid">
                        <div class="block span6">
                            <a href="#tablewidget" class="block-heading" data-toggle="collapse">本月</a>
                            <div id="tablewidget" class="block-body collapse in">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>营业收入</th>
                                            <td>1500000</td>
                                        </tr>
                                    </thead>
                                    <thead>
                                        <tr>
                                            <th>采购支出</th>
                                            <td>150000</td>
                                        </tr>
                                    </thead>
                                    <thead>
                                        <tr>
                                            <th>员工支出</th>
                                            <td>500000</td>
                                        </tr>
                                    </thead>
                                    <thead>
                                        <tr>
                                            <th>本月净利润</th>
                                            <td>850000</td>
                                        </tr>
                                    </thead>
                                </table>
                                <p><a href="http://www.52itstyle.com">更多...</a></p>
                            </div>
                        </div>
                        <div class="block span6">
                            <a href="#tablewidget" class="block-heading" data-toggle="collapse">人流量</a>
                            <div id="tablewidget" class="block-body collapse in">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>8::00~10:00</th>
                                            <td>10.00%</td>
                                        </tr>
                                    </thead>
                                    <thead>
                                        <tr>
                                            <th>10:00~14:00</th>
                                            <td>25.00%</td>
                                        </tr>
                                    </thead>

                                    <thead>
                                        <tr>
                                            <th>17:00~19:00</th>
                                            <td>35.00%</td>
                                        </tr>
                                    </thead>
                                    <thead>
                                        <tr>
                                            <th>19:00~24:00</th>
                                            <td>30.00%</td>
                                        </tr>
                                    </thead>
                                </table>
                                <p><a href="http://www.52itstyle.com">更多...</a></p>
                            </div>
                        </div>

                    </div> 
                    <footer>
                        <hr>
                        <p class="pull-right">&copy; 2017.3 <a href="http://www.52itstyle.com" target="_blank"> Borrowed by Chaos</a></p>
                    </footer>

                </div>
            </div>
        </div>
    </body>
</html>
