<%-- 
    Document   : Success
    Created on : 2017-3-27, 19:36:00
    Author     : T5-SKYLAKE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        ${requestScope.adname},Online!<br/>
        ${requestScope.adpw}<br/>
        ${cookie.adname.value}<br/>
        <s:property value="Adname"/>
    </body>
</html>
