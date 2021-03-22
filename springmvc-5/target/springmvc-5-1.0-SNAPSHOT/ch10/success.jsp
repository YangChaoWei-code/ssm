<%--
  Created by IntelliJ IDEA.
  User: ycw
  Date: 2021/3/14
  Time: 17:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    文件上传成功!<br>
    上传文件路径: ${requestScope.fileUrl} <br>
    <a href="fileDownload?fileName=${requestScope.fileName}">
        ${requestScope.fileName}
    </a>
</body>
</html>
