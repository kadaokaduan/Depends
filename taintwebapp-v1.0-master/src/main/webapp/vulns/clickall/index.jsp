<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>	
	<meta charset="UTF-8"/>
	<title>一键触发所有链接</title>
</head>
<body>
	<h1>一键触发所有链接</h1>
<%
	String addr = "http://" + request.getServerName().toString() + ":" + request.getServerPort();
	String path = "/usr/local/TaintPost.jar";
	String cmd = "java -jar " + path + " " + addr;
	Process process = Runtime.getRuntime().exec(cmd);

%>

<P>已触发所有漏洞链接，漏洞信息请至雳鉴IAST项目中进行查看！</P>

</body>
</html>
