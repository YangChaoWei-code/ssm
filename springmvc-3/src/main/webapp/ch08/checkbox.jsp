<%--
  Created by IntelliJ IDEA.
  User: ycw
  Date: 2021/3/8
  Time: 12:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fm" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h3>fm:checkbox 标签测试</h3>
    <fm:form modelAttribute="user" method="post" action="checkbox">
        选择课程:
        <fm:checkbox path="courses" value="Java程序设计" label="Java程序设计"/>&nbsp;
        <fm:checkbox path="courses" value="Java Web程序设计" label="Java Web程序设计"/>&nbsp;
        <fm:checkbox path="courses" value="JavaEE框架技术" label="JavaEE框架技术"/>&nbsp;
        <br><br>
        <fm:checkbox path="reader" value="true" /> 已阅读相关协议
    </fm:form>
</body>
</html>
