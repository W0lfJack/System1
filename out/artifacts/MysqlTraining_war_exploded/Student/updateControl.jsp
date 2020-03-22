<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/3/3
  Time: 12:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mySqlJDBC.Student.selectStudent" %>
<%@ page import="com.mySqlJDBC.Student.updateStudent" %>
<html>
<head>
    <title>提交</title>
</head>
<body>
提交页面
<%
    request.setCharacterEncoding("UTF-8");
    int aimNO =Integer.parseInt(request.getParameter("_NO"));
    int originNO=Integer.parseInt(request.getParameter("originNO"));
    int age=Integer.parseInt(request.getParameter("_age"));
    boolean exist=selectStudent.existNO(aimNO);
    if(exist&&aimNO!=originNO){
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
    else{
        String name=request.getParameter("_name");
        String sex=request.getParameter("_sex");

        String dept=request.getParameter("_dept");
        updateStudent.updateStudentNO(aimNO,name,age,sex,dept,originNO);
%>
<script>
    window.location.replace("index.jsp");
</script>
<%}%>

</body>
</html>
