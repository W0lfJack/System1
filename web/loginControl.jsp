<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/2/29
  Time: 0:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>


    <h3 align="center">这是登录判断页面</h3>
    <%
        request.setCharacterEncoding("UTF-8");
        if(session.getAttribute("account")==null){
            String account=request.getParameter("account");
            session.setAttribute("account",account);
        }
        String password=request.getParameter("password");
    %>
    <td><input type="button" onclick="aaa()" value="学生端入口(施工中)" disabled></td>
    <td><input type="button" onclick="bbb()" value="管理员入口"></td>
<script>
    function aaa() {
        window.location.replace("../Student/index.jsp");
    }
    function bbb() {
        window.location.replace("selectDatabase.jsp");
    }
</script>
</body>
</html>
