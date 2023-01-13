<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<html>
	<head>
		<title>csp-header-insecure</title>
	</head>
	<body>
		<h4>存在漏洞：content-security-policy设置为* </h4>
		default-src 设置为*:<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+"?type=default-src"%>" target="_blank"><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+"?type=default-src"%></a>
		<br>
		<!-- only no-store:<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+"?type=no-store"%>" target="_blank"><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+"?type=no-store"%></a>
		<br>
		use pragma:<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+"?type=pragma"%>" target="_blank"><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+"?type=pragma"%></a> -->
		<h4>不存在漏洞： </h4>
		safe: <a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+"?type=safe"%>" target="_blank"><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+"?type=safe"%></a>
		<%
            String type;
            
        	type = request.getParameter("type");
        	if(type == null){
        		type = "";
        	}
        	
            if(type.equals("default-src") ){
            	response.setHeader("Content-Security-Policy","default-src *");
            }
            if(type.equals("no-store")){
            	response.setHeader("Cache-Control","no-store");
            }
            if(type.equals("safe")){
                response.setHeader("Content-Security-Policy","form-action 'none'");
                response.setHeader("Content-Security-Policy","frame-src 'none'");
                response.setHeader("Content-Security-Policy","plugin-types 'none'");
                response.setHeader("Content-Security-Policy","reflected-xss 1");
                response.setHeader("Content-Security-Policy","base-uri 'none'");
                response.setHeader("Content-Security-Policy","referer 'none'");
                response.setHeader("Content-Security-Policy","default-src 'self'");

                response.setHeader("Content-Security-Policy","child-src 'none'");
                response.setHeader("Content-Security-Policy","connect-src 'none'");
                response.setHeader("Content-Security-Policy","frame-ancestors 'none'");
                response.setHeader("Content-Security-Policy","object-src 'none'");
                response.setHeader("Content-Security-Policy","script-src 'none'");
                response.setHeader("Content-Security-Policy","style-src 'none'");
                response.setHeader("Content-Security-Policy","media-src 'none'");
            }

		%>
		<br><br><br>
		MDN官方关于Content-Security-Policy描述:
        <a href="https://developer.mozilla.org/zh-CN/docs/Web/HTTP/Headers/Content-Security-Policy" target="_blank">Content-Security-Policy</a>
        <br>
		OWASP关于Content-Security-Policy漏洞的定义:
		<a href="https://www.owasp.org/index.php/Content_Security_Policy" target="_blank">Content Security Policy</a>
	</body>
	
</html>