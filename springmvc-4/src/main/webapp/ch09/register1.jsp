<%--
  Created by IntelliJ IDEA.
  User: ycw
  Date: 2021/3/9
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h3>注册页面</h3>
    <form action="../testInitBinder" method="post">
        姓名: <input type="text" id="name" name="name"><br><br>
        生日: <input type="text" id="birthday" name="birthday"><br><br>
            <input id="submit" type="submit" value="提交">
    </form>
</body>
</html>
