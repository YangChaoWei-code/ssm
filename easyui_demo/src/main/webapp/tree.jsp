<%--
  Created by IntelliJ IDEA.
  User: ycw
  Date: 2021/3/23
  Time: 15:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="EasyUI/themes/default/easyui.css" rel="stylesheet"
          type="text/css" />
    <link href="EasyUI/themes/icon.css" rel="stylesheet" type="text/css" />
    <link href="EasyUI/demo.css" rel="stylesheet" type="text/css" />
    <script src="EasyUI/jquery.min.js" type="text/javascript"></script>
    <script src="EasyUI/jquery.easyui.min.js" type="text/javascript"></script>
    <script src="EasyUI/easyui-lang-zh_CN.js" type="text/javascript"></script>
</head>
<body>
<%--    定义ul    --%>
    <ul id="tt"></ul>
    <script type="text/javascript">
        // 为Tree控件指定数据源
        $('#tt').tree({
            url : 'tree_data.json'
        });
    </script>
</body>
</html>
