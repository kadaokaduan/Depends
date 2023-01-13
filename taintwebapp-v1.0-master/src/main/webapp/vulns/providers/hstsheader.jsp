<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<html>
	<head>
		<title>hsts-header-missing</title>
	</head>
	<body>
		<h4>存在漏洞：</h4>
		Strict-Transport-Security 未设置:<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+"?type=nosafe"%>" target="_blank"><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+"?type=nosafe"%></a>
		<br>

        <h4>不存在漏洞： </h4>
        Strict-Transport-Security 设置为max-age=<expire-time>:<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+"?type=safe"%>" target="_blank"><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+"?type=safe"%></a>
		<br>
		
		<%
            String type;
            
        	type = request.getParameter("type");
        	if(type == null){
        		type = "";
        	}
        	
            if(type.equals("nosafe") ){
            	
            }
            if(type.equals("safe")){
                response.setHeader("Strict-Transport-Security","max-age=10");
            }

		%>
		<br><br><br>
		MDN官方关于Strict-Transport-Security描述:
        <a href="https://developer.mozilla.org/zh-CN/docs/Security/HTTP_Strict_Transport_Security" target="_blank">Strict-Transport-Security</a>

	</body>
	
</html>