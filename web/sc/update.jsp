<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/3/4
  Time: 22:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mySqlJDBC.SC.selectSC" %>
<%@ page import="com.info.SCInfo" %>
<html>
<head>
    <title>修改页面</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    session.setAttribute("account",session.getAttribute("account"));
    int NO=Integer.parseInt(request.getParameter("NO"));
    int courseNO=Integer.parseInt(request.getParameter("courseNO"));
    SCInfo sc=new SCInfo();
    sc.setNO(NO);
    sc.setCourseNo(courseNO);
    selectSC.selectByNOandCourse(sc);

%>

<h2 align="center">修改学生成绩</h2>
<hr>
<div>
    <a href="index.jsp" style="width: 50%;display: inline-block;font-size: 20px">返回</a>
</div>
<hr>
<form action="updateControl.jsp" method="post" id="info">
    <table align="center" >
        <tr>
            <th colspan="1">学号:</th>
            <td colspan="4"><input type="text" size="10" style="width: 100px" disabled value=<%=sc.getNO()%>></td>
            <td><input type="hidden" name="NO" value=<%=sc.getNO()%>></td>
        </tr>
        <tr>
            <th colspan="1">课程号:</th>
            <td colspan="4"><input type="text" size="10" disabled value=<%=sc.getCourseNo()%>></td>
            <td><input type="hidden" name="courseNO" value=<%=sc.getCourseNo()%>></td>
        </tr>
        <tr>
            <th colspan="1">成绩:</th>
            <td colspan="4"><input type="number" size="10" style="width: 100px" name="grade" value=<%=sc.getGrade()%>></td>
        <tr>
            <td></td>
            <td colspan="2"><input type="button" value="重置" onclick="resetForm()"></td>
            <td colspan="2"><input type="button" value="提交" onclick="updateData()"></td>
        </tr>
        <tr>
            <td></td>
            <td colspan="2"><input type="button" value="删除" onclick="deleteConfirm()"></td>
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
    //删除确认框
    function deleteConfirm() {
        var NO=<%=sc.getNO()%>;
        var courseNO=<%=sc.getCourseNo()%>;
        var url="delete.jsp?NO="+NO+"&courseNO="+courseNO;
        if(confirm("确认删除吗？")){
            window.location.replace(url);
        }
    }
    //检验数据是否为空
    function check() {
        var grade=document.getElementsByName("grade")[0].value;
        if(grade!="")return false;
        else return true;
    }
</script>
</body>
</html>
