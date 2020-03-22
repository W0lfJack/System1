<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/2/28
  Time: 19:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>学生查询系统-登录</title>
</head>
<%
    if(session.getAttribute("account")!=null)session.setAttribute("account",null);
%>
<body>
    <h3 align="center">学生查询系统登录页面</h3>
    <hr>
    <form action="loginControl.jsp" method="post">
        <table align="center">
            <tr>
                <td>
                    帐号:
                </td>
                <td colspan="2">
                    <input type="text" name="account" value="admin"/>
                </td>
            </tr>
            <tr>
                <td>
                    密码:
                </td>
                <td colspan="2">
                    <input type="password" name="password" value="admin"/>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="submit" value="登录"/>
                </td>
                <td>
                    <input type="reset" value="重置">
                </td>
            </tr>
            <tr>
                <td></td>
                <td style="font-size: 5px">↑可以直接按登录键！</td>
                <td style="font-size: 5px">登录判断还没做</td>
            </tr>
        </table>
    </form>
</body>
</html>
