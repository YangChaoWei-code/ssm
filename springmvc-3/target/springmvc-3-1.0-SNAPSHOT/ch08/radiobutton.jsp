<%--
  Created by IntelliJ IDEA.
  User: ycw
  Date: 2021/3/8
  Time: 13:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fm" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>fm:radiobutton 标签测试</title>
</head>
<body>
    <fm:form modelAttribute="user" method="post" action="radiobutton">
        性别:
        <fm:checkbox path="sex" value="男"/>男 &nbsp;
        <fm:checkbox path="sex" value="女"/>女 &nbsp;
    </fm:form>
</body>
</html>
