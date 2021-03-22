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
    欢迎: ${sessionScope.CURRENT_USER.loginName} |
    <a href="${pageContext.request.contextPath}/logout">退出</a>
</body>
</html>
