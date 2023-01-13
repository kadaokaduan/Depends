<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<html>
	<head>
		<title>Xpath注入</title>
	</head>
	<body>
		<p>漏洞链接：<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getContextPath()) %>/XpathServlet?author=Larry Niven">/XpathServlet?author=Larry Niven</a></p>
		<p>有登录验证（不存在漏洞）：<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getContextPath()) %>/XpathServlet?author=Larry">/XpathServlet?author=Larry</a></p>
	</body>
</html>