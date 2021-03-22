<%--
  Created by IntelliJ IDEA.
  User: ycw
  Date: 2021/3/7
  Time: 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    欢迎来学习Spring MVC! <br>
    ModelAndView:${requestScope.user}
    HttpSession中保存的user:${sessionScope.user}
</body>
</html>
