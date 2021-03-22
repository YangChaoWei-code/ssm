<%--
  Created by IntelliJ IDEA.
  User: ycw
  Date: 2021/3/15
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fm" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <font color="blue"><h4><spring:message code="welcome" arguments="${requestScope.user.loginName}"/> </h4></font>
    <spring:message code="info"/><br>
    <spring:message code="password"/>：${requestScope.user.password }<br>
    <spring:message code="age"/>：${requestScope.user.age }<br>
    <spring:message code="email"/>：${requestScope.user.email }<br>
    <spring:message code="phone"/>：${requestScope.user.phone }<br>
</body>
</html>
