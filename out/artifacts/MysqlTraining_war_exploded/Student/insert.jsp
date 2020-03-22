<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/3/4
  Time: 0:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新建</title>
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
            <td colspan="4"><input type="number" style="width: 100px" size="10" name="_NO"></td>

        </tr>
        <tr>
            <th colspan="1">姓名:</th>
            <td colspan="4"><input type="text" size="10" name="_name"></td>
        </tr>
        <tr>
            <th>性别:</th>
            <td><input type="radio" name="_sex" value="男"></td>
            <td>男</td>
            <td><input type="radio" name="_sex" value="女"></td>
            <td>女</td>
        </tr>
        <tr>
            <th colspan="1">年龄:</th>
            <td colspan="4"><input type="number" size="10" style="width: 100px" name="_age"%></td>
        <tr>
            <th colspan="1">专业:</th>
            <td colspan="4"><input type="text" size="10" name="_dept"%></td>
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
        var NO=document.getElementsByName("_NO")[0].value;
        var name=document.getElementsByName("_name")[0].value;
        var age=document.getElementsByName("_age")[0].value;
        var dept=document.getElementsByName("_dept")[0].value;
        if(NO!=""&&name!=""&&age!=""&&dept!="")return false;
        else return true;
    }
</script>
</body>
</html>
