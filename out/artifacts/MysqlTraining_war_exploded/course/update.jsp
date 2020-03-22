<%@ page import="com.info.CourseInfo" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/3/5
  Time: 1:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mySqlJDBC.course.selectCourse" %>
<html>
<head>
    <title>修改</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    session.setAttribute("account",session.getAttribute("account"));
    int NO=Integer.parseInt(request.getParameter("NO"));
    CourseInfo course=new CourseInfo();
    course.setNO(NO);
    selectCourse.selectByNO(course);

%>

<h2 align="center">修改课程信息</h2>
<hr>
<div>
    <a href="index.jsp" style="width: 50%;display: inline-block;font-size: 20px">返回</a>
</div>
<hr>
<form action="updateControl.jsp" method="post" id="info">
    <table align="center" >
        <tr>
            <th colspan="1">课程号:</th>
            <td colspan="4"><input type="text" size="10" style="width: 100px" disabled value=<%=course.getNO()%>></td>
            <td><input type="hidden" name="NO" value=<%=course.getNO()%>></td>
        </tr>
        <tr>
            <th colspan="1">课程名:</th>
            <td colspan="4"><input type="text" size="10" name="name" value=<%=course.getName()%>></td>
        </tr>
        <tr>
            <th colspan="1">PNO:</th>
            <td colspan="4"><input type="number" size="10" style="width: 100px" name="pno" value=<%=course.getPno()%>></td>
        <tr>
        <tr>
            <th colspan="1">学分:</th>
            <td colspan="4"><input type="number" size="10" style="width: 100px" name="credit" value=<%=course.getCredit()%>></td>
        <tr>
            <td></td>
            <td colspan="2"><input type="button" value="重置" onclick="resetForm()"></td>
            <td colspan="2"><input type="button" value="提交" onclick="updateData()"></td>
        </tr>
    </table>
</form>
<script language="JavaScript" type="text/javascript">
    //重置整个表单！
    function resetForm() {
        document.getElementById("info").reset();
        defaultSex();
    }
    //更新数据
    function updateData() {
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
