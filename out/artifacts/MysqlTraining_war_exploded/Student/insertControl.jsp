<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/3/4
  Time: 0:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mySqlJDBC.Student.selectStudent" %>
<%@ page import="com.mySqlJDBC.Student.insertStudent" %>
<html>
<head>
    <title>新建中...</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    int aimNO =Integer.parseInt(request.getParameter("_NO"));
    int age=Integer.parseInt(request.getParameter("_age"));
    String name=request.getParameter("_name");
    String dept=request.getParameter("_dept");
    String sex=request.getParameter("_sex");
    boolean exist=selectStudent.existNO(aimNO);
    if(exist){
%>
<script>
    alert("已存在相同的学号！")
    window.history.back();
</script>
<%}
else if(age<=0||age>150){
%>
<script>
    alert("年龄不合法！")
    window.history.back();
</script>
<%}
else if(sex==null){
%>
<script>
    alert("性别不能为空！")
    window.history.back();
</script>
<%}
else{
    insertStudent.insertStudent(aimNO,name,age,sex,dept);
%>
<script>
    window.location.replace("index.jsp");
</script>
<%}%>
</body>
</html>
