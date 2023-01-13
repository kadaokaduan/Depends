<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<html>
	<head>
		<title>File-Inclusion</title>
	</head>
	<body>
		<h4>File Inclusion</h4>
		<div>
			<p>使用jsp:include (jsp标签)</p>
			<p>漏洞链接：<a href="jsp-include.jsp?file=index.jsp">jsp-include.jsp?file=index.jsp</a></p>
		</div>
		<div>
			<p>使用jstl</p>
			<p>漏洞链接：<a href="jstl.jsp">jstl.jsp</a></p>
		</div>
	</body>
	
</html>