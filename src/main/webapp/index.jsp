<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/view/common/tagPage.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>首页</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
</head>
<body>


<h2>
    <a href="http://code.YouMeek.com" target="_blank">Hello YouMeek</a>
</h2>

<br>

<a href="/supplierUserController/showUserToJspByName/sun" target="_blank">查询用户信息并跳转到一个JSP页面</a>

<br>

<a href="/supplierUserController/showUserToJsonByName/sun" target="_blank">查询用户信息并直接输出JSON数据</a>

<br>
<a href="/supplierUserController/userCenter" target="_blank">用户中心</a>
<br>
<a href="/supplierUserController/register" target="_blank">注册</a>
</body>
</html>
