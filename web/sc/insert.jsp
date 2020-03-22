<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/3/5
  Time: 0:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新增学生成绩</title>
</head>
<%
    request.setCharacterEncoding("UTF-8");
%>
<body>
<h2 align="center">新建学生信息</h2>
<hr>
<div>
    <a href="index.jsp" style="width: 50%;display: inline-block;font-size: 20px">返回</a>
</div>
<hr>
<form action="insertControl.jsp" method="post" id="info">
    <table align="center" >
        <tr>
            <th colspan="1">学号:</th>
            <td colspan="4"><input type="number" size="10" style="width: 100px" name="NO"></td>
        </tr>
        <tr>
            <th colspan="1">课程编号:</th>
            <td colspan="4"><input type="number" size="10" style="width: 100px" name="courseNO"></td>
        </tr>
        <tr>
            <th colspan="1">成绩:</th>
            <td colspan="4"><input type="number" size="10" style="width: 100px" name="grade"%></td>
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
        var NO=document.getElementsByName("NO")[0].value;
        var courseNO=document.getElementsByName("courseNO")[0].value;
        var grade=document.getElementsByName("grade")[0].value;
        if(NO!=""&&courseNO!=""&&grade!="")return false;
        else return true;
    }
</script>
</body>
</html>
