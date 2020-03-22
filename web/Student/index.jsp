<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/2/27
  Time: 23:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.connector.Connector" %>
<%@ page import="com.mySqlJDBC.Student.selectStudent" %>
<%
    request.setCharacterEncoding("UTF-8");
    Connection conn = null;
    PreparedStatement statement = null;
    ResultSet resultSet = null;
    try {
        conn = Connector.getConnection();
        statement =conn.prepareStatement("select * from student");
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
<div style="width:20%;display: inline-block">
    已显示 <%=selectStudent.selectCount()%> 条结果
</div>
<div style="width: 20%;display: inline-block" align="right">
    <input type="button" value="新建一项信息" onclick="createByDefault()">
</div>
<div style="width: 10%;display: inline-block" align="center">
    <input id="searchButton" type="button" value="精确搜索▼" onclick="appear()">
</div>
<div style="width: 40%;display: inline-block" align="center">
    　<%--左边为空白字符，占位用--%>
</div>
<div id="hide" hidden="hidden" style="width: 100%;">　
    <hr>
    <div align="center">
        <form action="accurateSearch.jsp" method="post">
            <table>
                <div style="display: inline-block;border: 1px solid;">
                    <div align="center">学号</div>
                    <div>
                        <select name="NOchoose" style="margin-left: 2px;height: 25px">
                            <option value ="all">全选</option>
                            <option value ="special">特定学号</option>
                            <option value ="startWith">以特定数字开头</option>
                            <option value="contain">包含特定数字</option>
                        </select>
                        <input name="NO" type="text" size="7" style="margin-right: 2px">
                    </div>
                </div>
                <div style="display: inline-block;border: 1px solid;">
                    <div align="center">姓名</div>
                    <div>
                        <select name="nameChoose" style="margin-left: 2px;height: 25px">
                            <option value ="all">全选</option>
                            <option value ="special">特定姓名</option>
                            <option value ="startWith">姓</option>
                            <option value="contain">包含特定字</option>
                        </select>
                        <input name="name" type="text" size="7" style="margin-right: 2px">
                    </div>
                </div>
                <div style="display: inline-block;border: 1px solid;">
                    <div align="center">性别</div>
                    <div>
                        <select name="sexChoose" style="margin-left: 2px;height: 25px">
                            <option value ="all">全选</option>
                            <option value ="男">男</option>
                            <option value ="女">女</option>
                        </select>
                    </div>
                </div>
                <div style="display: inline-block;border: 1px solid;">
                    <div align="center">年龄</div>
                    <div>
                        <select name="ageChoose" style="margin-left: 2px;height: 25px">
                            <option value ="all">全选</option>
                            <option value ="older">大于</option>
                            <option value="younger">小于</option>
                            <option value="equal">等于</option>
                        </select>
                        <input name="age" type="text" size="1" style="margin-right: 2px">
                    </div>
                </div>
                <div style="display: inline-block;border: 1px solid;">
                <div align="center">专业</div>
                <div>
                    <select name="deptChoose" style="margin-left: 2px;height: 25px">
                        <option value ="all">全选</option>
                        <option value ="special">特定专业</option>
                    </select>
                    <input name="dept" type="text" size="7" style="margin-right: 2px">
                </div>
            </div>
                <div></div>
                <div align="right" style="width:35%;display: inline-block;margin-top: 4px">
                    <input type="reset" value="重置">
                </div>
                <div style="width:5%;display: inline-block">　</div>
                <div align="left" style="width:40%;display: inline-block">
                    <input type="submit" value="提交">
                </div>
            </table>
        </form>
    </div>
    <hr>
</div>
<div style="width: 100%;margin-top: 10px">
    <table align="center" border="1" width="500px">
        <tr align="center">
            <td>学号</td>
            <td>姓名</td>
            <td>性别</td>
            <td>年龄</td>
            <td>专业</td>
            <td>修改信息</td>
        </tr>
        <% while (resultSet.next()) {%>
        <tr align="center">
            <td><%=resultSet.getString("Sno")%>
            </td>
            <td><%=resultSet.getString("Sname")%>
            </td>
            <td><%=resultSet.getString("Ssex")%>
            </td>
            <td><%=resultSet.getString("Sage")%>
            </td>
            <td><%=resultSet.getString("Sdept")%>
            </td>
            <td>
                <a href="update.jsp?NO=<%=resultSet.getString("Sno")%>">修改</a>
            </td>
        </tr>
        <%}
            Connector.close(resultSet);
            Connector.close(statement);
            Connector.close(conn);
        %>

    </table>
</div>
<script>
    function createByDefault() {
        window.location.replace("insert.jsp");
    }
    function appear() {
        document.getElementById("searchButton").value="收起▲";
        document.getElementById("searchButton").onclick=disappear;
        document.getElementById("hide").hidden=false;
    }
    function disappear() {
        document.getElementById("searchButton").value="精细搜索▼";
        document.getElementById("searchButton").onclick=appear;
        document.getElementById("hide").hidden=true;
    }
</script>
</body>
</html>
