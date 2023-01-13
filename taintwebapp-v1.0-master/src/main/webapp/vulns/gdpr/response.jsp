<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>	
	<meta charset="UTF-8"/>
	<title>027-3 gdpr response检测点测试 </title>
</head>
<body>

<%
    
    response.getWriter().println("phone:" + "18137100080");
%>

<h2> gdpr response检测点测试</h2>
<p>此处将手机号返回到response响应中，不符合gdpr规范</p>

</body>
</html>
