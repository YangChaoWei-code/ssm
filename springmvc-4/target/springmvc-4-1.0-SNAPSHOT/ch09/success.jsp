<%--
  Created by IntelliJ IDEA.
  User: ycw
  Date: 2021/3/9
  Time: 16:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    姓名: ${requestScope.user.name}<br><br>
    生日: ${requestScope.user.birthday}
</body>
</html>
