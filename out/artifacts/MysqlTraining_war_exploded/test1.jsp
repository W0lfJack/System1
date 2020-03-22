<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/3/1
  Time: 20:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Test</title>
</head>
<body>
<html>

<body>
<div id="hide">
    <p>这是一段隐藏的段落。</p>
    <p>这是一段隐藏的段落。</p>
    <p>这是一段隐藏的段落。</p>
    <div style="display: inline-block;border: 1px solid">
        <div align="center">sadasd:</div>
        <div>
            <select id="select" style="margin-left: 2px">
                <option value ="volvo">Volvo</option>
                <option value ="saab">Saab</option>
                <option value="opel">Opel</option>
                <option value="audi">Audi</option>
            </select>
            <input type="text" size="10" style="margin-right: 2px">
        </div>
    </div>
    <div style="display: inline-block">
        <div>123123</div>
        <div>123123</div>
    </div>
    <hr>
</div>

<p>这是一段可见的段落。</p>
<input id="button" type="button" value="打开" onclick=a()>

<script>
function a() {
    document.getElementById("button").value="隐藏";
    document.getElementById("button").onclick=b;
    document.getElementById("hide").hidden=null;
}
function b() {
    document.getElementById("button").value="打开";
    document.getElementById("button").onclick=a;
    document.getElementById("hide").hidden=true;
}
function select(name,value) {
    var s=document.getElementById(name);
    for(var i=0;i<s.length;i++){
        if(s[i].value==value)s[i].selected="selected";
    }
}
select("select","audi");
</script>
</body>
</html>
