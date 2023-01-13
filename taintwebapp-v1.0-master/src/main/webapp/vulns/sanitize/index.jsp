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

<%
	String pathTraversal_string = "dir.jsp";
	String xss_string = "xss.jsp";
	String map_string = "map.jsp";
	String xpath_string = "/XpathServlet?author=Larry Niven";
%>

<p>过滤规则测试 - 目录穿越 </p>
	<p>curl '<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+pathTraversal_string%>" target="_blank"><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+pathTraversal_string%></a>'</p>
<p>过滤规则测试 - xss </p>
	<p>curl '<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+xss_string%>" target="_blank"><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+xss_string%></a>'</p>
<p>过滤规则测试 - getParameterMap </p>
	<p>curl '<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+map_string%>" target="_blank"><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+map_string%></a>'</p>
<p>验证规则测试 - xpath注入 </p>
	<p>curl '<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getContextPath().toString())+xpath_string%>" target="_blank"><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getContextPath().toString())+xpath_string%></a>'</p>

</body>
</html>
