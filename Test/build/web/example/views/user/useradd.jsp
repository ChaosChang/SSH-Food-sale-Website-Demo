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
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/example/bootstrap/css/bootstrap-select.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/example/css/theme.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/example/font-awesome/css/font-awesome.css">


        <script src="${pageContext.request.contextPath}/example/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/example/bootstrap/js/bootstrap.js"></script>
        <script src="${pageContext.request.contextPath}/example/bootstrap/js/bootstrap-select.js"></script>
        <script src="${pageContext.request.contextPath}/example/bootstrap/js/bootstrap-file-input.js"></script>

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
            <ul id="dashboard-menu" class="nav nav-list collapse ">
                <li><a href="/WirelessOrder/home.do?flag=grzx">个人中心</a></li>
            </ul>

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
                <h1 class="page-title">用户</h1>
            </div>

            <ul class="breadcrumb">
                <li>主页<span class="divider">/</span></li>
                <li class="active">用户</li>
            </ul>

            <div class="container-fluid">
                <div class="row-fluid">
                    <c:if test="${menuAdd=='no'}">
                        <div class="alert alert-error">
                            <button type="button" class="close" data-dismiss="alert">×</button>
                            <strong>小提示：</strong> 添加失败！！
                        </div>
                    </c:if>
                    <div class="page-header" ></div>
                    <form action="userAdd" method="post" class="form-horizontal"  enctype="multipart/form-data" >    
                        <div class="row-fluid">
                            <div class="span7">  	
                                <div class="control-group">
                                    <label class="control-label" for="name">用户名</label>
                                    <div class="controls">
                                        <input name="username" class="input-xlarge focused" id="name" type="text" value="">${requestScope.tip}
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="price">密码</label>
                                    <div class="controls">
                                        <input name="userpw" class="input-xlarge focused" id="price" type="password" value="">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="price">手机号</label>
                                    <div class="controls">
                                        <input name="userphone" class="input-xlarge focused" id="price" type="text" value="">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="price">地址</label>
                                    <div class="controls">
                                        <input name="useradd" class="input-xlarge focused" id="price" type="text" value="">
                                    </div>
                                </div>

                            </div>
                            <div class="span5">
                                <div class="fileupload fileupload-new" data-provides="fileupload">
                                    <div class="fileupload-preview  thumbnail" style="width: 220px; height: 170px;">

                                    </div>
                                    <div>
                                        <span class="btn btn-file"><span class="fileupload-new">上传图片</span><span class="fileupload-exists">更改</span>
                                            <input type="file" name="photo" />
                                        </span>
                                        <a href="#" class="btn fileupload-exists" data-dismiss="fileupload">删除</a>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="form-actions">
                            <button type="submit" class="btn btn-primary">添 加</button>
                            <a href="userSearch">
                                <button  class="btn">返 回</button>
                            </a>
                        </div>
                    </form>
                    <footer>
                        <hr>
                        <p class="pull-right">
                            &copy; 2013.8 <a href="#" target="_blank"> shun_fzll</a>
                        </p>
                    </footer>
                </div>
            </div>
        </div>




        <script type="text/javascript">
            $('.selectpicker').selectpicker({
                style: 'btn-info',
                size: 4
            });

            $(document).ready(function () {
                $('#mySelect').change(function () {
                    //alert($(this).children('option:selected').val()); 
                    var p1 = $(this).children('option:selected').val();//这就是selected的值 
                    //改变隐藏域中的值
                    $('#menutype').val(p1);
                    //var p2=$('#menutype').val();
                    //alert(p2)
                })
            })
            $('input[type=file]').bootstrapFileInput();
            $('.file-inputs').bootstrapFileInput();
        </script>
    </body>
</html>
