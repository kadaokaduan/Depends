<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<html>
	<head>
		<title>xcontenttype-header-missing</title>
	</head>
	<body>
		<h4>存在漏洞：</h4>
		x-content-type-options 未设置:<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+"?type=nosafe"%>" target="_blank"><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+"?type=nosafe"%></a>
		<br>

        <h4>不存在漏洞： </h4>
        x-content-type-options 设置为nosniff:<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+"?type=nosniff"%>" target="_blank"><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+"?type=nosniff"%></a>
		<br>
		
		<%
            String type;
            
        	type = request.getParameter("type");
        	if(type == null){
        		type = "";
        	}
        	
            if(type.equals("nosafe") ){
            	
            }
            if(type.equals("nosniff")){
                response.setHeader("X-Content-Type-Options","nosniff");
            }

		%>
		<br><br><br>
		MDN官方关于X-Content-Type-Options描述:
        <a href="https://developer.mozilla.org/zh-CN/docs/Web/HTTP/Headers/X-Content-Type-Options" target="_blank">X-Content-Type-Options</a>

	</body>
	
</html>