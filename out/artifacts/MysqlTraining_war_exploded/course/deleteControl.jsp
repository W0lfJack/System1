<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/3/5
  Time: 17:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mySqlJDBC.course.deleteCourse" %>
<html>
<head>
    <title>删除中...</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    int NO=Integer.parseInt(request.getParameter("NO"));
    deleteCourse.deleteByNOandCourseNO(NO);
%>
<script>
    window.location.replace("index_course.jsp");
</script>
</body>
</html>
