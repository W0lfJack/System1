<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/3/5
  Time: 17:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mySqlJDBC.course.insertCourse" %>
<html>
<head>
    <title>新建课程中...</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    int NO=Integer.parseInt(request.getParameter("NO"));
    String name = request.getParameter("name");
    String pno = request.getParameter("pno");
    int credit = Integer.parseInt(request.getParameter("credit"));
    boolean pnoIsNull = false;
    if (pno == "") {
        pno = null;
        pnoIsNull = true;
    }
    if (!pnoIsNull) {
        if (Integer.parseInt(pno) < 0) {
%>
<script>
    alert("PNO非法！");
    window.history.back();
</script>
<%
        } else if (credit < 0) {
%>
<script>
    alert("学分非法！");
    window.history.back();
</script>
<%
        } else {
            insertCourse.insertCourse(NO,name, pno, credit);
%>
<script>
    window.location.replace("index_course.jsp");
</script>
<%
        }
    } else if (credit < 0) {
%>
<script>
    alert("学分非法！");
    window.history.back();
</script>
<%
    } else {
    insertCourse.insertCourse(NO,name, pno, credit);
%>
<script>
    window.location.replace("index_course.jsp");
</script>
<%
    }
%>
</body>
</html>
