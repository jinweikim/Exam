<%--
  Created by IntelliJ IDEA.
  User: jin
  Date: 2018/6/24
  Time: 9:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
</head>
<body>
    <form action="/account/valid" method="post">
        <input type="text" name="name" placeholder="用户名">
        <input type="password" name="password" placeholder="密码">
        <input type="submit" value="登录">
    </form>
</body>
</html>
