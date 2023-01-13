<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<html>
	<head>
		<title>csp-header-missing</title>
	</head>
	<body>
		<h4>存在漏洞：未设置content-security-policy 或 x-content-security-policy</h4>
		<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+"?type=noset"%>" target="_blank"><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+"?type=noset"%></a>
		<br>

		<h4>不存在漏洞： </h4>
        设置content-security-policy(新版本，http1.1):<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+"?type=csp"%>" target="_blank"><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+"?type=csp"%></a>
		<br>
		设置x-content-security-policy（旧版本，http1.0）:<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+"?type=xcsp"%>" target="_blank"><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+"?type=xcsp"%></a>
		<br>
		<%
            String type;
            
        	type = request.getParameter("type");
        	if(type == null){
        		type = "";
        	}
        	
            if(type.equals("noset") ){
            	
            }
            if(type.equals("csp")){
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
            if(type.equals("xcsp")){
                response.setHeader("X-Content-Security-Policy","*");
            }

		%>
		<br><br><br>
		MDN官方关于Content-Security-Policy描述:
        <a href="https://developer.mozilla.org/zh-CN/docs/Web/HTTP/CSP" target="_blank">内容安全策略( CSP )</a>

	</body>
	
</html>