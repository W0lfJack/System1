<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/3/3
  Time: 13:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mySqlJDBC.Student.deleteStudent" %>
<%@ page import="com.mySqlJDBC.Student.selectStudent" %>
<html>
<head>
    <title>删除中...</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    int NO=Integer.parseInt(request.getParameter("NO"));
    if(selectStudent.existNO(NO)){
        deleteStudent.deleteByNO(NO);
    }
    else{
%>
<script>
    alert("不存在该用户！");
</script>
<%}%>
<script>
    window.location.replace("index.jsp");
</script>
</body>
</html>
