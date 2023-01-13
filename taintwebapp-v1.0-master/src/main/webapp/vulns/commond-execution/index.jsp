<%@page import="java.io.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>	
	<meta charset="UTF-8"/>
	<title>命令执行</title>
</head>
<body>
	<h1>命令执行</h1>

<%
String linux_querystring = "?cmd=cp+/etc/passwd+/tmp/";
String windows_querystring = "?cmd=calc";
String cmd = request.getParameter("cmd");
if (cmd != null) {
	try {
		Runtime.getRuntime().exec(cmd);
	} catch (Exception e) {
	    out.print(org.owasp.esapi.ESAPI.encoder().encodeForHTML(e.toString()));
	}
}
%>
	<p>Linux 触发: </p>
	<p>curl '<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+linux_querystring%>" target="_blank"><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+linux_querystring%></a>'</p>
	<p>然后检查 /tmp 是否存在 passwd 这个文件</p>
	<br>

	<p>Windows 触发: </p>
	<p>curl '<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+windows_querystring%>" target="_blank"><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+windows_querystring%></a>'</p>
	<p>点击这里执行 calc.exe</p>
</body>
</html>
