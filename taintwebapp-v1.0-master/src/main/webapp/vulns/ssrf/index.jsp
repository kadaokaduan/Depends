<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<html>
	<head>
		<title>SSRF</title>
	</head>
	<body>
		<h4>urlConnection.openConnection方式</h4>
		<% 
			String addr = "http://" + request.getServerName().toString() + ":" + request.getServerPort();
		%>
		<p>漏洞链接:<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getContextPath()) %>/SSRFServlet?url=<%=addr + org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getContextPath()) %>">/SSRFServlet?url=<%=addr + org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getContextPath()) %></a></p>
		
		<h4>commons.httpclient方式</h4>
		<p>漏洞链接:<a href="commons-httpclient.jsp?url=<%=addr + org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getContextPath()) %>">commons-httpclient.jsp</a></p>
		
		<h4>httpclient方式</h4>
		<p>漏洞链接:<a href="httpclient.jsp?url=<%=addr + org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getContextPath()) %>">httpclient.jsp</a></p>
	</body>
	
</html>