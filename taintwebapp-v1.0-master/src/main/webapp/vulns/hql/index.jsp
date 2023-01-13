<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<html>
	<head>
		<title>HQL注入</title>
	</head>
	<body>
		<h4>HQL Injection</h4>
		<p>漏洞链接:<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getContextPath()) %>/HqlServlet?name=chen">/HqlServlet?name=chen</a></p>
		
	</body>
	
</html>