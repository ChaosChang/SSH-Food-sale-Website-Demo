<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
    <head>
        <title>OMEGA后台</title>


        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/example/bootstrap/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/example/css/theme.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/example/font-awesome/css/font-awesome.css">


        <script src="${pageContext.request.contextPath}/example/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/example/bootstrap/js/bootstrap.js"></script>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/example/bootstrap/css/bootstrap-switch.css" />
        <script src="${pageContext.request.contextPath}/example/bootstrap/js/bootstrap-switch.js"></script>


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
                <a class="brand" href="${pageContext.request.contextPath}/example/views/adminindex.jsp"><span class="first">OMEGA</span> <span class="second">后台</span></a>
            </div>
        </div>




        <div class="sidebar-nav">
            <form class="search form-inline">
                <input type="text" placeholder="Search...">
            </form>

            <a href="#dashboard-menu" class="nav-header" data-toggle="collapse"><i class="icon-dashboard"></i>首页</a>
            <a href="#user-menu" class="nav-header" data-toggle="collapse"><i class="icon-table"></i>用户
            </a>
            <ul id="user-menu" class="nav nav-list collapse">
                <li ><a href="userSearch">用户管理</a></li>
            </ul>

            <a href="#shop-menu" class="nav-header collapsed" data-toggle="collapse"><i class="icon-reorder"></i>店铺
            </a>
            <ul id="shop-menu" class="nav nav-list collapse">
                <li ><a href="shopSearch">店铺管理</a></li>
            </ul>

            <a href="#good-menu" class="nav-header" data-toggle="collapse"><i class="icon-th-large"></i>商品</a>
            <ul id="good-menu" class="nav nav-list collapse">
                <li ><a href="goodSearch">商品管理</a></li>
            </ul>

            <a href="#order-menu" class="nav-header" data-toggle="collapse"><i class="icon-th-large"></i>订单</a>
            <ul id="order-menu" class="nav nav-list collapse">
                <li ><a href="orderSearch">订单管理</a></li>
            </ul>

            <a href="#envi-menu" class="nav-header" data-toggle="collapse"><i class="icon-th-large"></i>环境</a>
            <ul id="envi-menu" class="nav nav-list collapse">
                <li ><a href="eimageSearch">环境图片管理</a></li>
            </ul>

            <a href="#food-menu" class="nav-header" data-toggle="collapse"><i class="icon-th-large"></i>食物</a>
            <ul id="food-menu" class="nav nav-list collapse">
                <li ><a href="gimageSearch">食物图片管理</a></li>
            </ul>

            <a href="#chef-menu" class="nav-header" data-toggle="collapse"><i class="icon-th-large"></i>厨师</a>
            <ul id="chef-menu" class="nav nav-list collapse">
                <li ><a href="chefSearch">厨师管理</a></li>
            </ul>
        </div>




        <!-- 内容 开始 -->
        <div class="content">

            <div class="header">

                <h1 class="page-title">厨师</h1>
            </div>

            <ul class="breadcrumb">
                <li>厨师 <span class="divider">/</span></li>
                <li class="active">信息修改</li>
            </ul>
            <div class="container-fluid">
                <c:if test="${updtbl=='yes'}">
                    <div class="row-fluid">

                        <div class="alert alert-info">
                            <button type="button" class="close" data-dismiss="alert">×</button>
                            <strong>小提示：</strong> 保存成功！！
                        </div>
                    </div>
                </c:if>

                <!-- begin -->
                <div class="row-fluid sortable">
                    <div class="box span12">
                        <div class="box-content">
                            <div class="page-header" ></div>
                            <form class="form-horizontal" action="chefUpdate" method="POST">
                                <fieldset>
                                    <div class="control-group">
                                        <label class="control-label">商店ID</label>
                                        <div class="controls">
                                            <input name="shopId" class="input-xlarge"  type="text" value="${requestScope.chefEdi.shopId}">
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">厨师姓名</label>
                                        <div class="controls">
                                            <input name="chefname" class="input-xlarge"  type="text" value="${requestScope.chefEdi.chefname}">
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="desc">厨师图片</label>
                                        <div class="controls">
                                            <input name="cplace" class="input-xlarge focused" id="desc" type="text" value="${requestScope.chefEdi.cplace}">
                                        </div>
                                    </div>	
                                    <div class="control-group">
                                        <label class="control-label" for="desc">厨师ID</label>
                                        <div class="controls">
                                            <input name="chefId" class="input-xlarge focused" id="desc" type="text" readonly="true" value="${requestScope.chefEdi.chefId}"/>
                                        </div>
                                    </div>
                                    <div class="form-actions">
                                        <button type="submit" class="btn btn-primary">保 存</button>
                                        <a href="chefSearch">
                                            <input type="button" class="btn" value="返 回">
                                        </a>
                                    </div>
                                </fieldset>
                            </form>
                        </div>


                    </div>
                    <footer>
                        <hr>
                        <p class="pull-right">&copy; 2017.3 <a href="#" target="_blank"> Borrowed by Chaos</a></p>
                    </footer>
                </div>

            </div>


            <!-- end -->

        </div>




        <script type="text/javascript">
            var xmlhttp;
            $('.make-switch').on('switch-change', function (e, data) {
                //创建xmlHttp  
                createXMLHttpRequest();

                var url = "/WirelessOrder/TableServlet?tid=" + $(this).attr('id');

                xmlhttp.onreadystatechange = state_Change;
                xmlhttp.open("POST", url, true);
                xmlhttp.send(null);
            });


            function createXMLHttpRequest() {
                if (window.XMLHttpRequest)
                {// code for IE7, Firefox, Opera, etc.
                    xmlhttp = new XMLHttpRequest();
                } else if (window.ActiveXObject)
                {// code for IE6, IE5
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
            }

            //处理返回结果
            function state_Change()
            {
                if (xmlhttp.readyState == 4)
                {
                    if (xmlhttp.status == 200)
                    {

                    }
                }
            }

        </script>
    </body>
</html>

