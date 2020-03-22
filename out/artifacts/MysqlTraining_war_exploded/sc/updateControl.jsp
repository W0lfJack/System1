<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/3/4
  Time: 22:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mySqlJDBC.SC.updateSC" %>
<html>
<head>
    <title>修改中...</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    int NO=Integer.parseInt(request.getParameter("NO"));
    int courseNO=Integer.parseInt(request.getParameter("courseNO"));
    int grade=Integer.parseInt(request.getParameter("grade"));
    updateSC.updateStudentByNoAndCourse(grade,NO,courseNO);
%>
<script>
    window.location.replace("index.jsp");
</script>
</body>
</html>
