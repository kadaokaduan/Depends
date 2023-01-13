<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="at.dallermassl.ap.security.taint.webapp.custom.PayDemo" %>
<html>
<head>	
	<meta charset="UTF-8"/>
	<title>026-1 自定义source点测试 </title>
</head>
<body>

<%
    
    PayDemo payDemo = new PayDemo();

	String username = payDemo.getUserName();
	String payServlet_path = "/PayServlet";
%>

<h2> 自定义source点测试 </h2>
<ul>
    <li>用户名: <%=username%></li>
</ul>

<h3>修改用户名</h3>
<p>
	<form name="input" action=<%= request.getContextPath() + payServlet_path %> method="get">
	  修改用户名：<input id="username" type="text" name="username" value= <%=username%> size="60" /><br/>      
      <input type="submit" value="确认"/>
    </form>
</p>

</body>
</html>
