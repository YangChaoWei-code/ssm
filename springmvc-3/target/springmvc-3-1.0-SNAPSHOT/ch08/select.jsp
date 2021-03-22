<%--
  Created by IntelliJ IDEA.
  User: ycw
  Date: 2021/3/8
  Time: 14:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fm" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>fm:select 标签添加fm:option标签</title>
</head>
<body>
<%--    <h3>fm:select 标签添加fm:option标签</h3>--%>
<%--    <fm:form modelAttribute="user" method="post" action="select">--%>
<%--        部门:--%>
<%--        <fm:select path="deptId">--%>
<%--            <fm:option value="1">机械工程学院</fm:option>--%>
<%--            <fm:option value="2">电气工程学院</fm:option>--%>
<%--            <fm:option value="3">信息工程学院</fm:option>--%>
<%--            <fm:option value="4">土木工程学院</fm:option>--%>
<%--        </fm:select>--%>
<%--    </fm:form>--%>
    <fm:form modelAttribute="user" method="post" action="select">
        <%--    <h3>fm:select 标签items属性绑定Map</h3>--%>
<%--        部门: <fm:select path="deptId" items="${deptMap}" />--%>
<%--        <h3>fm:options 标签items属性绑定Map</h3>--%>
<%--        部门:--%>
<%--        <fm:select path="deptId">--%>
<%--            <fm:options items="${deptMap}" />--%>
<%--        </fm:select>--%>
        <h3>fm:select 标签使用fm:options绑定Object</h3>
        部门:
        <fm:select path="deptId">
            <fm:options items="${deptList}" itemLabel="name" itemValue="id"/>
        </fm:select>
    </fm:form>
</body>
</html>
