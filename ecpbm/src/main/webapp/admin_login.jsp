<%--
  Created by IntelliJ IDEA.
  User: ycw
  Date: 2021/4/2
  Time: 17:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
    <title>电子商务平台——后台登录页</title>
    <!-- 引入EasyUI的相关css和js文件 -->
    <link href="EasyUI/themes/default/easyui.css" rel="stylesheet"
          type="text/css" />
    <link href="EasyUI/themes/icon.css" rel="stylesheet" type="text/css" />
    <link href="EasyUI/demo.css" rel="stylesheet" type="text/css" />
    <script src="EasyUI/jquery.min.js" type="text/javascript"></script>
    <script src="EasyUI/jquery.easyui.min.js" type="text/javascript"></script>
    <script src="EasyUI/easyui-lang-zh_CN.js" type="text/javascript"></script>
</head>

<body>
<script type="text/javascript">
    function clearForm() {
        $('#adminLoginForm').form('clear');
    }

    function checkAdminLogin() {
        $("#adminLoginForm").form("submit", {
            // 向控制器类AdminInfoController中login方法发送请求
            url : 'admininfo/login',
            success : function(result) {
                var result = eval('(' + result + ')');
                if (result.success == 'true') {
                    window.location.href = 'admin.jsp';
                    $("#adminLoginDlg").dialog("close");
                } else {
                    $.messager.show({
                        title : "提示信息",
                        msg : result.message
                    });
                }
            }
        });
    }
</script>
<div id="adminLoginDlg" class="easyui-dialog"
     style="left: 550px; top: 200px;width: 300px;height: 200px"
     data-options="title:'后台登录',buttons:'#bb',modal:true">
    <form id="adminLoginForm" method="post">
        <table style="margin:20px;font-size: 13px;">
            <tr>
                <th >用户名</th>
                <td><input class="easyui-textbox" type="text" id="name"
                           name="name" data-options="required:true" value="admin"></input></td>
            </tr>
            <tr>
                <th>密码</th>
                <td><input class="easyui-textbox" type="text" id="pwd"
                           name="pwd" data-options="required:true" value="123456"></input></td>
            </tr>
        </table>
    </form>
</div>
<div id="bb">
    <a href="javascript:void(0)" class="easyui-linkbutton"
       onclick="checkAdminLogin()">登录</a> <a href="javascript:void(0)"
                                             class="easyui-linkbutton" onclick="clearForm();">重置</a>
</div>

</body>
</html>
