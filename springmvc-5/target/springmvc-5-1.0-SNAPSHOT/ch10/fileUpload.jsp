<%--
  Created by IntelliJ IDEA.
  User: ycw
  Date: 2021/3/14
  Time: 21:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>文件上传</title>
</head>
<body>
    <form action="../upload" method="post" enctype="multipart/form-data">
        文件描述: <input type="text" name="description"><br><br>
        请选择文件<input type="file" name="files" multiple="multiple">
        <br><br>
        <input type="submit" value="上传" /> <br>
    </form>
</body>
</html>
