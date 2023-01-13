<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<html>
	<head>
		<title>hardcoded-password</title>
	</head>
	<body>
		<h4>存在漏洞：</h4>
		存在password硬编码:<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+"?type=nosafe"%>" target="_blank"><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+"?type=nosafe"%></a>
        <br>
        public static final String password = "mypassword";
        <br>

        <h4>不存在漏洞： </h4>
        public static final String date_password = "date_password";
		<br>
        
        访问此页面hardcoded-password漏洞应该只报一个

        <%
            new at.dallermassl.ap.security.taint.webapp.Sanitizer();

		%>
		<br><br><br>


	</body>
	
</html>