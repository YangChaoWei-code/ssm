<%--
  Created by IntelliJ IDEA.
  User: ycw
  Date: 2021/3/16
  Time: 13:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <font color="red"> ${requestScope.message}</font><br><br>
    <form action="${pageContext.request.contextPath}/login" method="post">
        账号: <input type="text" name="loginName"><br><br>
        密码: <input type="password" name="password"><br><br>
        <input type="submit" value="登录"><br>
    </form>
</body>
</html>
