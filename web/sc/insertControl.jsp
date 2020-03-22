<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/3/4
  Time: 22:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mySqlJDBC.SC.insertSC" %>
<%@ page import="com.mySqlJDBC.SC.selectSC" %>
<html>
<head>
    <title>增加中...</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    int NO=Integer.parseInt(request.getParameter("NO"));
    int courseNO=Integer.parseInt(request.getParameter("courseNO"));
    int grade=Integer.parseInt(request.getParameter("grade"));
    boolean exist=selectSC.exist(NO,courseNO);
    if(exist){
%>
<script>
    alert("该学号的课程已有成绩！");
    window.location.assign("insert.jsp");
</script>
<%}
    else if(grade<0){
%>
<script>
    alert("成绩不合法！")
    window.location.assign("insert.jsp");
</script>
<%
    }else insertSC.updateStudentByNoAndCourse(NO,courseNO,grade);
%>
<script>
    window.location.replace("index.jsp");
</script>
</body>
</html>
