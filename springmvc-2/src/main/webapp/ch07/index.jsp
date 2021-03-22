<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>
  <script type="text/javascript" src="../scripts/jquery-3.3.1.min.js"></script>
  <script type="text/javascript">
    function getUserJson(){
      var url = "../user/returnJson";
      var args = {};
      $.post(url, args, function (data){});
    }
  </script>
</head>
<body>
<form action="../user/requestMethod" method="post">
  <input type="submit" value="POST" value="GET Request Method">
</form>
<a href="../user/my/pathAnt">Path Ant</a><br><br>

<a href="../user/rest/1">Rest GET</a>

<form action="../user/rest" method="post">
  <input type="submit" value="Rest POST">
</form>

<form action="../user/rest/1" method="post">
  <input type="hidden" name="_method" value="DELETE">
  <input type="submit" value="Rest DELETE">
</form>

<form action="../user/rest/1" method="post">
  <input type="hidden" name="_method" value="PUT">
  <input type="submit" value="Rest PUT">
</form>

<a href="../user/pathVariable/1">Path Variable</a><br><br>

<a href="../user/requestParam?loginName=admin&loginPwd=123456">
  Request Param
</a><br><br>

<form action="../user/saveUser" method="post">
  loginName:<input type="text" name="loginName"><br>
  loginPwd:<input type="password" name="loginPwd"><br>
  province:<input type="text" name="address.province"><br>
  city:<input type="text" name="address.city"><br>
  <input type="submit" value="提交">
</form>

<form action="../user/getUser" method="post">
  loginName1:<input type="text" name="uMap['u1'].loginName"><br>
  loginPwd1:<input type="password" name="uMap['u1'].loginPwd"><br>
  province1:<input type="text" name="uMap['u1'].address.province"><br>
  city1:<input type="text" name="uMap['u1'].address.city"><br>
  loginName2:<input type="text" name="uMap['u2'].loginName"><br>
  loginPwd2:<input type="password" name="uMap['u2'].loginPwd"><br>
  province2:<input type="text" name="uMap['u2'].address.province"><br>
  city2:<input type="text" name="uMap['u2'].address.city"><br>
  <input type="submit" value="提交">
</form>

<a href="../user/returnModelAndView">ModelAndView</a><br><br>

<a href="../user/sessionAttributes">Session Attributes</a><br><br>

<a href="../user/modelAttribute">Model Attribute</a><br><br>

<a href="../user/beanNameViewResolver">BeanNameViewResolver</a><br>

<a href="../user/redirect">Redirect</a>

<a href="javascript:void(0)" id="returnJson" onclick="getUserJson()">Test Json</a><br><br>
</body>
</html>