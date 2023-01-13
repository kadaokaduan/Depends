<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>	
	<meta charset="UTF-8"/>
	<title>022 HTTP头部注入 </title>
</head>
<body>
	<h1>022 - HTTP头部注入</h1>
<%
String normal_querystring = "?name=testName&value=testvalue";

String name = request.getParameter("name");
String value = request.getParameter("value");

if (name != null) {
	response.setHeader(name, "11111");
} 

if (value != null) {
	response.setHeader("Test-Header", value);
}

Collection<String> headerNames = response.getHeaderNames();
List<String> taintedNames = new ArrayList<String>();

for(String names :headerNames){
	out.println(org.owasp.esapi.ESAPI.encoder().encodeForHTML(names +" : " + response.getHeader(names))+"<br>");
}

%>
<p>不正常调用: </p>
	<p>curl '<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+normal_querystring%>" target="_blank"><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+normal_querystring%></a>'</p>


</body>
</html>
