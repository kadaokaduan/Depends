<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>	
	<meta charset="UTF-8"/>
	<title>025 过滤规则测试</title>
</head>
<body>
	<h1>025 过滤规则测试 - getParameterMap过滤规则测试</h1>
<%
String normal_querystring = "?dirname=dir";

Map<String,String[]> map = request.getParameterMap();
String[] dirname = map.get("dirname");
if(dirname != null){
	for(String str: dirname){
		out.println(str);
	}
}

%>
<p>curl '<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+normal_querystring%>" target="_blank"><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+normal_querystring%></a>'</p>

<p>过滤规则测试，未添加过滤规则前测出xss漏洞，添加getParameterMap后不应测出xss漏洞</p>


</body>
</html>
