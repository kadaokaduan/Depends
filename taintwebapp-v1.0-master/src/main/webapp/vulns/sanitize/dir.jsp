<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@page import="at.dallermassl.ap.security.taint.webapp.Sanitizer" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>	
	<meta charset="UTF-8"/>
	<title>025 过滤规则测试 </title>
</head>
<body>
	<h1>025 过滤规则测试 - 目录穿越</h1>
<%
String normal_querystring = "?dirname=dir";
String linux_querystring = "?dirname=../../../../../../../../../../../../../../../var/log/";
String windows_querystring = "?dirname=../../../../../../../../../../../../../../../Windows";
String dirname = request.getParameter("dirname");

if (dirname != null) {
	String encodeDirname = Sanitizer.mySanitizer(dirname);
	dirname = encodeDirname;
	try {
		File folder = new File(dirname);
		if (folder.isDirectory()) {
			File[] listOfFiles = folder.listFiles();
			for (File file : listOfFiles) {
			    out.println(org.owasp.esapi.ESAPI.encoder().encodeForHTML(file.getName()));
			}
		}
	} catch (Exception e) {
	   out.print(e);
	}
} else {
%>
<p>正常调用: </p>
	<p>curl '<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+normal_querystring%>" target="_blank"><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+normal_querystring%></a>'</p>
<p>不正常调用 - Linux: </p>
	<p>curl '<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+linux_querystring%>" target="_blank"><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+linux_querystring%></a>'</p>
<p>不正常调用 - Windows: </p>
	<p>curl '<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+windows_querystring%>" target="_blank"><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+windows_querystring%></a>'</p>
<%
	}
%>
</body>
</html>
