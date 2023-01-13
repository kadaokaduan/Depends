<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<html>
	<head>
		<title>cache-controls-missing</title>
	</head>
	<body>
		<h4>存在漏洞：no-cache,no-store 未全部设置 </h4>
		only no-cache:<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+"?type=no-cache"%>" target="_blank"><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+"?type=no-cache"%></a>
		<br>
		only no-store:<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+"?type=no-store"%>" target="_blank"><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+"?type=no-store"%></a>
		<br>
		use pragma:<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+"?type=pragma"%>" target="_blank"><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+"?type=pragma"%></a>
		<h4>不存在漏洞： </h4>
		both: <a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+"?type=both"%>" target="_blank"><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+"?type=both"%></a>
		<%
            String type;
            
        	type = request.getParameter("type");
        	if(type == null){
        		type = "";
        	}
        	
            if(type.equals("no-cache") ){
            	response.setHeader("Cache-Control","no-cache");
            }
            if(type.equals("no-store")){
            	response.setHeader("Cache-Control","no-store");
            }
            if(type.equals("both")){
            	response.setHeader("Cache-Control","no-cache, no-store");
            }
            if(type.equals("pragma")){
            	response.setHeader("Pragma","no-cache, no-store");
            	response.setHeader("Expires","0");
            }
		%>
		<br><br><br>
		关于Cache-Contorl:
		<a href="https://blog.csdn.net/u012375924/article/details/82806617" target="_blank">浅谈http中的Cache-Control</a>
	</body>
	
</html>