<%--
  Created by IntelliJ IDEA.
  User: ycw
  Date: 2021/3/14
  Time: 17:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="../fileUpload" method="post" enctype="multipart/form-data">
        <input type="file" name="file" /><br><br>
        <input type="submit" value="上传" /><br>
    </form>
</body>
</html>
