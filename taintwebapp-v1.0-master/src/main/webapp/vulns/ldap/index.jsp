<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<html>
	<head>
		<title>Ldap注入</title>
	</head>
	<body>
		<h4>LDAP Injection</h4>
		<p>正常请求：<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getContextPath()) %>/LdapServlet?num=244245963255&sn=huamei">/LdapServlet?num=244245963255&sn=huamei</a></p>
		<p>漏洞链接:<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getContextPath()) %>/LdapServlet?num=244245963255%29%28%26%29%29%28%26%28%31%3d%30&sn=1">/LdapServlet?num=244245963255)(&))(&(1=0&sn=1</a></p>
		<p>漏洞解释：使用(&)绕过了对sn的校验，正常情况sn不为huamei会显示找不到该用户，执行注入情况下只需要知道num即可成功查询</p>
		
	</body>
	
</html>