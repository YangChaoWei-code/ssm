<%--
  Created by IntelliJ IDEA.
  User: ycw
  Date: 2021/3/23
  Time: 15:03
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
    <div class="easyui-tabs" style="width: 700px;height: 250px">
        <div title="选项卡1" style="padding: 10px">
            页面1
        </div>
        <div title="选项卡2" style="padding: 10px">
            页面1
        </div>
        <div title="选项卡3" data-options="iconCls:'icon-help', closable:true"
             style="padding: 10px">页面3</div>
    </div>
</body>
</html>
