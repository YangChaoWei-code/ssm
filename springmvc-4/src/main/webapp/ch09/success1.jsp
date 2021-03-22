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
    使用@InitBinder注解进行类型转换之后的跳转页面<br><br>
    姓名: ${requestScope.user1.name}<br><br>
    生日: ${requestScope.user1.birthday}
</body>
</html>
