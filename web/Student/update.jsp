<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/3/1
  Time: 15:29
  To change tdis template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mySqlJDBC.Student.selectStudent" %>
<%@ page import="com.info.StudentInfo" %>
<%@ page import="com.mySqlJDBC.allConnect.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <title>修改页面</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    session.setAttribute("account",session.getAttribute("account"));
    int NO=Integer.parseInt(request.getParameter("NO"));
    StudentInfo student=new StudentInfo();
    student.setNo(NO);
    selectStudent.selectByNo(student);

    List<String> list=new ArrayList<>();

%>

<h2 align="center">修改学生信息</h2>
<hr>
<div>
    <a href="index.jsp" style="width: 50%;display: inline-block;font-size: 20px">返回</a>
</div>
<hr>
<div style="float: left;width: 30%;font-weight: bold;margin-left: 5%">
    <div align="center" style="float: left;width: 100%;font-weight: bold">所选课程平均分</div>
    <div style="float: left;border:2px inset;height:170px;width: 100%">
        <%
            list=selectCnameBySno.selectByNO(NO);
            while(!list.isEmpty()){
                if(list.get(0)!=null){
                    String name=list.remove(0);
                    String grade=selectAvgByCname.selectByCname(name);
        %>
        <div style="width:60%;float:left;font-weight: bold">&nbsp;<%=name%></div>
        <div style="width:40%;float:right;font-weight: bold">平均分:<%=grade%></div>
        <%
                }
                else break;
            }
        %>
    </div>
</div>
<form action="updateControl.jsp" method="post" id="info" style="width: 30%;float: left;">
    <table align="center">
        <tr>
            <th colspan="1">学号:</th>
            <td colspan="4"><input type="number" size="10" style="width: 100px" name="_NO" value=<%=student.getNo()%>></td>
            <td><input type="hidden" name="originNO" value=<%=student.getNo()%>></td>
        </tr>
        <tr>
            <th colspan="1">姓名:</th>
            <td colspan="4"><input type="text" size="10" name="_name" value=<%=student.getName()%>></td>
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
            <td colspan="4"><input type="number" size="10" style="width: 100px" name="_age" value=<%=student.getAge()%>></td>
        <tr>
            <th colspan="1">专业:</th>
            <td colspan="4"><input type="text" size="10" name="_dept" value=<%=student.getDept()%>></td>
        </tr>
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
<div style="float: left;margin-left: 5%;font-weight: bold">所选的课程为:</div>
<div style="float: left;border:2px inset;height: 190px;width: 200px">
    <%
        list=selectCnameAndGrade.selectByNO(NO);
        while(!list.isEmpty()){
            String name=list.remove(0);
            String grade=list.remove(0);
            if(name!=null){
    %>
    <div style="width:60%;float:left;font-weight: bold">&nbsp;<%=name%></div>
    <div style="width:40%;float:right;font-weight: bold">成绩:<%=grade%></div>
    <%
            }
        }
    %>
</div>
<script language="JavaScript" type="text/javascript">
    //根据数据库性别的默认值来选好ridio
    function defaultSex() {
        var sex="<%=student.getSex()%>";
        var ridio=document.getElementsByName("_sex");
        for(var i=0;i<ridio.length;i++){
            if(ridio[i].value==sex)ridio[i].checked="checked";
        }
    }
    //重置整个表单！
    function resetForm() {
        document.getElementById("info").reset();
        defaultSex();
    }
    //删除确认框
    function deleteConfirm() {
        if(confirm("确认删除吗？\n对应的成绩也将被删除！")){
            window.location.replace("deleteByNO.jsp?NO="+<%=student.getNo()%>);
        }
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
        var NO=document.getElementsByName("_NO")[0].value;
        var name=document.getElementsByName("_name")[0].value;
        var age=document.getElementsByName("_age")[0].value;
        var dept=document.getElementsByName("_dept")[0].value;
        if(NO!=""&&name!=""&&age!=""&&dept!="")return false;
        else return true;
    }
    defaultSex();
</script>
</body>
</html>
