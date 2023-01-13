<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<html>
	<head>
		<title>违反信任边界</title>
	</head>
	<body>
		<h4>Trust Boundary - 违反信任边界</h4>
		<% 
			String param = request.getParameter("param");
			request.getSession().setAttribute("10340",param);
		%>
		<p>漏洞链接:<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getContextPath()) %>/vulns/trust-boundry?param=123">trust-boundry?param=123</a></p>
	</body>
	
</html>