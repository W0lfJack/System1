<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/3/5
  Time: 1:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mySqlJDBC.course.selectCourse" %>
<html>
<head>
    <title>新建课程</title>
</head>
<%
    request.setCharacterEncoding("UTF-8");
%>
<body>
<h2 align="center">添加新课程</h2>
<hr>
<div>
    <a href="index_course.jsp" style="font-size: 20px">返回</a>
</div>
<hr>
<form action="insertControl.jsp" method="post" id="info">
    <table align="center">
        <tr>
            <th colspan="1">课程号:</th>
            <td colspan="4"><input type="text" size="10" disabled value=<%=selectCourse.findLoophole()%>></td>
            <td><input type="hidden" size="10" name="NO" value=<%=selectCourse.findLoophole()%>></td>
        </tr>
        <tr>
            <th colspan="1">课程名:</th>
            <td colspan="4"><input type="text" size="10" name="name"></td>
        </tr>
        <tr>
            <th colspan="1">PNO:</th>
            <td colspan="4"><input type="number" size="10" style="width: 100px" name="pno"></td>
        </tr>
        <tr>
            <th colspan="1">学分:</th>
            <td colspan="4"><input type="number" size="10" style="width: 100px" name="credit"></td>
        </tr>
        <tr>
            <td></td>
            <td colspan="2"><input type="reset" value="重置"></td>
            <td colspan="2"><input type="button" value="提交" onclick="insertData()"></td>
        </tr>
    </table>
</form>
<script>
    //更新数据
    function insertData() {
        if(check()){
            alert("请把必要信息补充完整！");
        }
        else{
            if(confirm("确认提交吗？")){
                document.getElementById("info").submit();
            }
        }
    }
    //检验数据是否为空
    function check() {
        var name=document.getElementsByName("name")[0].value;
        var credit=document.getElementsByName("credit")[0].value;
        if(name!=""&&credit!="")return false;
        else return true;
    }
</script>
</body>
</html>
