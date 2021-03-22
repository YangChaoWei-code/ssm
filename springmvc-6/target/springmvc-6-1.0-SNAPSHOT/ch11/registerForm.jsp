<%--
  Created by IntelliJ IDEA.
  User: ycw
  Date: 2021/3/15
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="fm" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title><spring:message code="title"/></title>
</head>
<body>
    <a href="registerForm?request_local=zh_CN">中文</a> &nbsp; | &nbsp;
    <a href="registerForm?request_local=en_US">英文</a>
    <h3><spring:message code="title"/></h3>
    <fm:form modelAttribute="user" action="register" method="post">
        <spring:message code="loginName"/>：<fm:input path="loginName"/><br>
        <spring:message code="password"/>：<fm:input path="password"/><br>
        <spring:message code="age"/>：<fm:input path="age"/><br>
        <spring:message code="email"/>：<fm:input path="email"/><br>
        <spring:message code="phone"/>：<fm:input path="phone"/><br>
        <input type="submit" value="<spring:message code="submit"/>"><br>
    </fm:form>
</body>
</html>
