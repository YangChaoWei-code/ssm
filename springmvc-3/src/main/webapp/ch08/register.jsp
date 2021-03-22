<%--
  Created by IntelliJ IDEA.
  User: ycw
  Date: 2021/3/8
  Time: 11:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fm" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h3>注册页面</h3>
    <fm:form modelAttribute="user" action="register" method="post">
        姓名: <fm:input path="name"/><br><br>
        性别: <fm:input path="sex"/><br><br>
        年龄: <fm:input path="age"/><br><br>
    </fm:form>
</body>
</html>
