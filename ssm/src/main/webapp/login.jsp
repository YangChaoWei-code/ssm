<%--
  Created by IntelliJ IDEA.
  User: ycw
  Date: 2021/3/22
  Time: 16:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="userinfo/login" method="post">
    <table>
        <tr>
            <td>用户名: </td>
            <td><input type="text" name="userName" /></td>
        </tr>
        <tr>
            <td>密码: </td>
            <td><input type="text" name="password" /></td>
        </tr>
        <tr>
            <td><input type="submit" value="登录" /></td>
            <td></td>
        </tr>
    </table>
</form>
</body>
</html>
