<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import ="java.util.*,java.text.*"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<html>
    <head>
        <title><s:text name="HelloWorld.message"/></title>
    </head>

    <body>
        <form action="loginAction" method="post">
            <div>
                <span>用户名<label>*</label></span>
                <input type="text" name="adname">
            </div>
            <div>
                <span>密码<label>*</label></span>
                <input type="password" name="adpw">
            </div>

            <input type="submit" value="登录" class="submit">
        </form>
    </body>
</html>