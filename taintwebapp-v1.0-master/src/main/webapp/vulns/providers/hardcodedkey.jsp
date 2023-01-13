<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<html>
	<head>
		<title>hardcoded-key</title>
	</head>
	<body>
		<h4>存在漏洞：</h4>
		存在key硬编码:<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+"?type=nosafe"%>" target="_blank"><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+"?type=nosafe"%></a>
		<br>
        public static final String key = "key";
        
        <h4>不存在漏洞： </h4>
       
		<br>
		
        <%
            new at.dallermassl.ap.security.taint.webapp.Sanitizer();

		%>
		<br><br><br>


	</body>
	
</html>