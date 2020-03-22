<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/3/4
  Time: 18:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>后台管理</title>
</head>
<body>
<h1 align="center">后台管理页面</h1>
<hr>
<div>
    <a href="login.jsp" style="width: 50%;display: inline-block;font-size: 20px">退出登录</a>
    <div align="right" style="float:right;width:50%;display: inline-block;font-size: 20px"><b>帐号:<%=session.getAttribute("account")%></b></div>
</div>
<hr>
<div style="width: 100%">
    <div align="right" style="width: 35%;float: left">点击选择要查看的数据库:&nbsp;&nbsp;&nbsp;</div>
    <div align="left" style="width: 10%;float: left">
        <input type="button" style="width: 100%" value="Student" onclick="useStudent()">
    </div>
    <div align="left" style="width: 10%;float: left">
        <input type="button" style="width: 100%" value="sc" onclick="useSc()">
    </div>
    <div align="left" style="width: 10%;float: left">
        <input type="button" style="width: 100%" value="course" onclick="useCourse()">
    </div>
    <div align="left" style="width: 10%;float: left">
        <input type="button" style="width: 100%" value="account（施工中）">
    </div>
    <div align="right" style="width: 25%;float: left">.</div>
</div>
<div align="center" style="width: 100%;float: left">
    <iframe id="frame" width="80%" height="70%"></iframe>
</div>
<script>
    function useStudent() {
        document.getElementById("frame").src="Student/index.jsp";
    }
    function useSc() {
        document.getElementById("frame").src="sc/index.jsp";
    }
    function useCourse() {
        document.getElementById("frame").src="course/index_course.jsp";
    }
</script>
</body>
</html>
