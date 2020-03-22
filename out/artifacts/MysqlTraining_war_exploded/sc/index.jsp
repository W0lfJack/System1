<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/3/4
  Time: 22:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.connector.Connector" %>
<%@ page import="com.mySqlJDBC.SC.selectSC" %>
<%
    request.setCharacterEncoding("UTF-8");
    Connection conn = null;
    PreparedStatement statement = null;
    ResultSet resultSet = null;
    try {
        conn = Connector.getConnection();
        statement =conn.prepareStatement("select * from sc");
        resultSet = statement.executeQuery();
    } catch (SQLException e) {
        e.printStackTrace();
    }

%>
<html>
<head>
    <title>查询页面</title>
</head>
<body>
<h2 align="center">查询结果</h2>
<hr>
<div style="width:10%;float: left;font-size: 10px">已显示 <%=selectSC.selectCount()%> 条结果</div>
<div style="width: 40%" align="right">
    <input type="button" value="新建一项信息" onclick="createByDefault()">
</div>
<br>
<table align="center" border="1" width="300px">
    <tr align="center">
        <td>学号</td>
        <td>课程号</td>
        <td>成绩</td>
        <td>修改成绩</td>
    </tr>
    <% while (resultSet.next()) {%>
    <tr align="center">
        <td><%=resultSet.getInt("Sno")%>
        </td>
        <td><%=resultSet.getInt("Cno")%>
        </td>
        <td><%=resultSet.getInt("Grade")%>
        </td>
        <td>
            <a href="update.jsp?NO=<%=resultSet.getString("Sno")%>&courseNO=<%=resultSet.getString("Cno")%>">修改</a>
        </td>
    </tr>
    <%}
        Connector.close(resultSet);
        Connector.close(statement);
        Connector.close(conn);
        
    %>

</table>
<script>
    function createByDefault() {
        window.location.replace("insert.jsp");
    }
</script>
</body>
</html>

