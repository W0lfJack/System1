<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/3/5
  Time: 0:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.connector.Connector" %>
<%@ page import="com.mySqlJDBC.course.selectCourse" %>
<%
    request.setCharacterEncoding("UTF-8");
    Connection connection=Connector.getConnection();
    PreparedStatement pstmt=null;
    ResultSet resultSet=null;
    try{
        pstmt=connection.prepareStatement("select * from course");
        resultSet=pstmt.executeQuery();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
<html>
<head>
    <title>详细课程</title>
</head>
<body>
<h2 align="center">查询结果</h2>
<hr>
<div style="width:10%;float: left;font-size: 10px">已显示 <%=selectCourse.selectCount()%> 条结果</div>
<div style="width: 40%" align="right">
    <input type="button" value="添加新课程" onclick="createByDefault()">
</div>
<br>
<table align="center" border="1" width="500px">
    <tr align="center">
        <td>课程号</td>
        <td>课程名</td>
        <td>pno</td>
        <td>学分</td>
        <td>修改课程</td>
        <td>删除课程</td>
    </tr>
    <% while (resultSet.next()) {%>
    <tr align="center">
        <td><%=resultSet.getInt("Cno")%>
        </td>
        <td><%=resultSet.getString("Cname")%>
        </td>
        <td><%=resultSet.getString("Cpno")%>
        </td>
        </td>
        <td><%=resultSet.getInt("Ccredit")%>
        </td>
        <td>
            <a href="update.jsp?NO=<%=resultSet.getString("Cno")%>">修改</a>
        </td>
        <td>
            <a href="#" onclick="confirmDelete(<%=resultSet.getString("Cno")%>,'<%=resultSet.getString("Cname")%>')">删除</a>
        </td>
    </tr>
    <%}
        Connector.close(resultSet);
        Connector.close(pstmt);
        Connector.close(connection);
    %>

</table>
<script>
    //新增课程
    function createByDefault() {
        window.location.replace("insert.jsp");
    }
    //删除课程确认框
    function confirmDelete(NO,name) {
        var text="即将删除 "+NO+" 号课程,\n" +
            "课程名为: "+name+"\n"
        if(confirm(text)){
            window.location.assign("deleteControl.jsp?NO="+NO);
        }

    }
</script>
</body>
</html>
