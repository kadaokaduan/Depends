<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<html>
	<head>
		<title>session-rewriting</title>
	</head>
	<body>
		<h4>存在漏洞：</h4>
        <a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+ ";jsessionid=node0j63i5rn8cycw15paw93i13a7s0.node0"%>" target="_blank"><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+ ";jsessionid=node0j63i5rn8cycw15paw93i13a7s0.node0"%></a>
		<br>
        <h4>不存在漏洞： </h4>
        将jsessionid放到cookie中
		<br>
	
		<br>

	</body>
	
</html>