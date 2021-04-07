<%--
  Created by IntelliJ IDEA.
  User: ycw
  Date: 2021/3/23
  Time: 15:17
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
    <table id="newsinfoDg" class="easyui-datagrid"></table>
    <script type="text/javascript">
        $(function () {
            $('#newsinfoDg').datagrid({
                fit: true,
                fitColumns: true,
                rownumbers: true,
                singleSelect: false,
                url : 'datagrid_data.txt',
                columns : [[{
                    title: '',
                    field: 'productid',
                    align: 'center',
                    checkbox: true
                }, {
                    field: 'unitcost',
                    title: 'unitcost',
                    width: 50
                }, {
                    field: 'status',
                    title: 'status',
                    width: 60
                }, {
                    field: 'listprice',
                    title: 'listprice',
                    width: 50
                }, {
                    field: 'attr1',
                    title: 'attr1',
                    width: 200
                }, {
                    field: 'itemid',
                    title: 'itemid',
                    width: 100
                }]]
            });
        });
    </script>
</body>
</html>
