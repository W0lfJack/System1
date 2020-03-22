<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/3/5
  Time: 0:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mySqlJDBC.SC.deleteSC" %>
<html>
<head>
    <title>删除中...</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    int NO=Integer.parseInt(request.getParameter("NO"));
    int courseNO=Integer.parseInt(request.getParameter("courseNO"));
    deleteSC.deleteByNOandCourseNO(NO,courseNO);
%>
<script>
    window.location.replace("index.jsp");
</script>
</body>
</html>
