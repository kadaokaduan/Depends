<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<html>
	<head>
		<title>insecure-auth-protocol</title>
	</head>
	<body>
		<h4>存在漏洞：</h4>
        使用Basic进行认证:<br>
        curl -H "Authorization: Basic YWxhZGRpbjpvcGVuc2VzYW1l" -v <%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())%>
		<br><br>
        使用Digest进行认证:
        curl -H "Authorization: Digest username='somename', realm='Restricted area'" -v <%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())%>
		<br>
        <h4>不存在漏洞： </h4>
        使用表单验证方式代替HTTP认证
		<br>
	
		<br><br><br>
		MDN官方关于Authorization描述:
        <a href="https://developer.mozilla.org/zh-CN/docs/Web/HTTP/Headers/Authorization" target="_blank">Authorization</a>
        <br>
        关于http认证的漏洞：
        <a href="https://www.cnblogs.com/XiongMaoMengNan/p/6671206.html" target="_blank">HTTP认证模式：Basic and Digest Access Authentication</a>

	</body>
	
</html>