<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>	
	<meta charset="UTF-8"/>
	<title>027 gdpr个人隐私数据泄漏测试 </title>
</head>
<body>

<%
	String sql_string = "sql.jsp";
	String log_string = "log.jsp";
	String response_string = "response.jsp";
	String mix_string = "mix.jsp";
%>

<p>gdpr个人隐私数据泄漏测试 - 数据库检测点 </p>
	<p>curl '<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+sql_string%>" target="_blank"><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+sql_string%></a>'</p>
<p>gdpr个人隐私数据泄漏测试 - 日志检测点 </p>
	<p>curl '<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+log_string%>" target="_blank"><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+log_string%></a>'</p>
<p>gdpr个人隐私数据泄漏测试 - response响应检测点 </p>
	<p>curl '<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+response_string%>" target="_blank"><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+response_string%></a>'</p>
<p>gdpr个人隐私数据泄漏测试 - 混合点检测（同一个请求多个检测点多条敏感数据） </p>
	<p>curl '<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+mix_string%>" target="_blank"><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+mix_string%></a>'</p>


</body>
</html>
