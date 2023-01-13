<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>	
	<meta charset="UTF-8"/>
	<title>026 用户自定义规则测试 </title>
</head>
<body>

<%
	String pathTraversal_string = "source.jsp";
	String xss_string = "propagation.jsp";
	String map_string = "sink.jsp";
	String xpath_string = "/XpathServlet?author=Larry Niven";
%>

<p>用户自定义规则测试 - 自定义source点 </p>
	<p>curl '<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+pathTraversal_string%>" target="_blank"><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+pathTraversal_string%></a>'</p>
<p>用户自定义规则测试 - 自定义propagation点 </p>
	<p>curl '<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+xss_string%>" target="_blank"><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+xss_string%></a>'</p>
<p>用户自定义规则测试 - 自定义sink点 </p>
	<p>curl '<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+map_string%>" target="_blank"><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+map_string%></a>'</p>


</body>
</html>
