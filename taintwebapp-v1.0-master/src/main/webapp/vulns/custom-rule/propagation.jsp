<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="at.dallermassl.ap.security.taint.webapp.json.*" %>
<%@page import="com.alibaba.fastjson.*" %>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<html>
<head>	
	<meta charset="UTF-8"/>
	<title>026-2 自定义propagator点测试 </title>
</head>
<body>

<%
   Student student = new Student();
   student.setStudentName("chen");
   student.setStudentAge(18);
   
   String name = request.getParameter("name");
   if(name != null){
       student.setStudentName(name);
   }
   //String jsonStr = JSONObject.toJSONString(student,true);
   ObjectMapper mapper = new ObjectMapper();
   String jsonStr = mapper.writeValueAsString(student);

%>

<h2> 自定义propagator点测试</h2>
<ul>
    <li>用户名: <p id="username"></p></li>
    <li>年龄: <p id="age"></p></li>
</ul>
<p>添加name参数可修改username，例如：?name=chen1</p>

<script>
    var jsonstr = '<%=jsonStr%>';
    obj = JSON.parse(jsonstr);
    document.getElementById("username").innerHTML =obj.studentName;
    document.getElementById("age").innerHTML =obj.studentAge; 
</script>

<p>模拟JSON解析，json目前存在传播点不足导致污点标记丢失的情况(jackson比较多，fastjson目前支持比较常用的默认序列化)</p>
<p>通过自定义传播点可及时覆盖掉这种情况导致的漏报</p>

</body>
</html>
