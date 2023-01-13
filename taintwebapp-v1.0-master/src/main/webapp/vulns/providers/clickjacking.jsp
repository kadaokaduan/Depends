<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<html>
	<head>
		<title>clickjacking-control-missing</title>
	</head>
	<body>
		<h4>存在漏洞：X-Frame-Options头未设置 </h4>
		<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+"?type=noset"%>" target="_blank"><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+"?type=noset"%></a>
		<h4>不存在漏洞： </h4>
		deny: <a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+"?type=deny"%>" target="_blank"><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+"?type=deny"%></a>
        <br>
        sameorigin: <a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+"?type=sameorigin"%>" target="_blank"><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+"?type=sameorigin"%></a>
        <br>
        allow-from: <a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+"?type=allow-from"%>" target="_blank"><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+"?type=allow-from"%></a>
        <br>
        (contrast allow-from会报漏洞，实际上不应该报)
        <%
            String type;
            
        	type = request.getParameter("type");
        	if(type == null){
        		type = "";
        	}
        	
            if(type.equals("deny")){
            	response.setHeader("X-Frame-Options","deny");
            }
            if(type.equals("sameorigin")){
            	response.setHeader("X-Frame-Options","sameorigin");
            }
            if(type.equals("allow-from")){
            	response.setHeader("X-Frame-Options","allow-from https://moresec.cn");
            }
		%>
		<br><br><br>
		关于X-Frame-Options:
		<a href="https://developer.mozilla.org/zh-CN/docs/Web/HTTP/X-Frame-Options" target="_blank">X-Frame-Options</a>
	</body>
	
</html>