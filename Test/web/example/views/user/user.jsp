<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%-->

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

            <a href="${pageContext.request.contextPath}/example/views/adminindex.jsp" class="nav-header" data-toggle="collapse"><i class="icon-dashboard"></i>首页</a>
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

            <a href="#order-menu" class="nav-header" data-toggle="collapse"><i class="icon-th-large"></i>环境</a>
            <ul id="order-menu" class="nav nav-list collapse">
                <li ><a href="eimageSearch">环境图片管理</a></li>
            </ul>

            <a href="#order-menu" class="nav-header" data-toggle="collapse"><i class="icon-th-large"></i>食物</a>
            <ul id="order-menu" class="nav nav-list collapse">
                <li ><a href="gimageSearch">食物图片管理</a></li>
            </ul>

            <a href="#order-menu" class="nav-header" data-toggle="collapse"><i class="icon-th-large"></i>厨师</a>
            <ul id="order-menu" class="nav nav-list collapse">
                <li ><a href="chefSearch">厨师管理</a></li>
            </ul>
        </div>

        <!-- 内容 开始 -->
        <div class="content">

            <!-- 提示框1 -->
            <div id="myModal" class="modal hide fade">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h3>警告</h3>
                </div>
                <div  class="modal-body">
                    <p>你确定要删除吗？</p>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn"  data-dismiss="modal" aria-hidden="true">关闭</a>
                    <a id="delbtn2"  href="#" class="btn btn-primary"> 确  认</a>
                </div>
            </div>
            <!-- 提示框2 -->
            <div id="addModal" class="modal hide fade">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h3>请输入桌子最大容纳人数：</h3>
                </div>
                <div  class="modal-body">
                    <form action="/WirelessOrder/table.do?flag=addTable" method="post">
                        <input type="text" name="num"  class="input-block-level">
                        </div>
                        <div class="modal-footer">
                            <a href="#" class="btn"  data-dismiss="modal" aria-hidden="true">取 消</a>
                            <button type="submit" class="btn btn-primary">添 加</button>
                        </div>
                    </form>
                </div>

                <div class="header">

                    <h1 class="page-title">用户</h1>
                </div>

                <ul class="breadcrumb">
                    <li>用户 <span class="divider">/</span></li>
                    <li class="active">用户查询</li>
                </ul>

                <div class="container-fluid">
                    <div class="row-fluid">

                        <div class="row-fluid">
                            <div class="btn-toolbar">
                                <a href="${pageContext.request.contextPath}/example/views/user/useradd.jsp" role="button" class="btn btn-primary" data-toggle="modal">
                                    <i class="icon-plus"></i> 添 加</a>
                                <div class="btn-group">
                                </div>
                            </div>
                        </div>
                        <div class="well">
                            <table class="table table-striped table-bordered bootstrap-datatable datatable">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>姓名</th>
                                        <th>密码</th>
                                        <th>手机号</th>
                                        <th>地址</th>
                                        <th>操作</th>
                                        <th style="width: 26px;"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${userlist}" var="u">
                                        <tr>
                                            <td>${u.userId}</td>
                                            <td>${u.username}</td>
                                            <td>${u.userpw}</td>
                                            <td>${u.userphone}</td>
                                            <!--c:if test="$">
                                                <div id=""  class="make-switch" data-on-label="空闲" data-off-label="满座" >
                                                    <input  type="checkbox" checked >
                                                </div-->
                                            <td>${u.useradd}</td>
                                            <td>
                                                <a  class="btn btn-info" href="userEdit.action?userId=${u.userId}"><i class="icon-edit icon-white"></i>修改</a>
                                                <button  onclick="del(this)"  delid="${u.userId}" class="btn btn-danger"><i class="icon-trash icon-white"></i> 删除</button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="pagination">
                            <ul>
                                <c:if test="${pre=='yes'}">
                                    <li><a href="/WirelessOrder/table.do?flag=table&pageNow=${pNow-1}">前一页</a></li>
                                    </c:if>
                                    <c:forEach var="i" begin="1" end="${pageCount}">
                                    <li>
                                        <a href="/WirelessOrder/table.do?flag=table&pageNow=${i }">${i }</a>
                                    </li>
                                </c:forEach>
                                <c:if test="${next=='yes'}">
                                    <li><a href="/WirelessOrder/table.do?flag=table&pageNow=${pNow+1}">后一页</a></li>
                                    </c:if>
                            </ul>
                        </div>             
                        <footer>
                            <hr>
                            <p class="pull-right">&copy; 2017.3 <a href="#" target="_blank"> Borrowed by Chaos</a></p>
                        </footer>
                    </div>
                </div>
            </div>



            <script type="text/javascript">

                /*
                 $(document).ready(function(){
                 $("#delbtn").click(function(){
                 var delid=$("#delbtn").attr("delid");
                 $("#myModal").modal("show").on("shown", function () {
                 var delurl="/WirelessOrder/TableServlet?delid="+delid;
                 $("#delbtn2").attr('href',delurl);
                 });
                 });
                 
                 });
                 */

                var xmlhttp;
                $('.make-switch').on('switch-change', function (e, data) {
                    //创建xmlHttp  
                    createXMLHttpRequest();

                    var url = "/WirelessOrder/TableServlet?tid=" + $(this).attr('id');

                    xmlhttp.onreadystatechange = state_Change;
                    xmlhttp.open("POST", url, true);
                    xmlhttp.send(null);
                })


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



                function del(obj) {
                    var delid = $(obj).attr("delid");
                    var delurl = "userRemove.action?userId=" + delid;
                    $("#myModal").modal("show").on("shown", function () {
                        $("#delbtn2").attr('href', delurl);
                    });
                }


            </script>
    </body>
</html>
