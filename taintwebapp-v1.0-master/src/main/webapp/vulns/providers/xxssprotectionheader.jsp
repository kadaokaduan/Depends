<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<html>
	<head>
		<title>xxssprotection-header-disabled</title>
	</head>
	<body>
		<h4>存在漏洞：</h4>
		x-xss-protection 的值设置为0:<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+"?type=0"%>" target="_blank"><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+"?type=0"%></a>
		<br>

        <h4>不存在漏洞： </h4>
        (可以不用管，因为这个值不设置默认为1)<br>
        x-xss-protection 的值设置为1:<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+"?type=1"%>" target="_blank"><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+"?type=1"%></a>
		<br>
		
		<%
            String type;
            
        	type = request.getParameter("type");
        	if(type == null){
        		type = "";
        	}
        	
            if(type.equals("0") ){
            	response.setHeader("X-XSS-Protection","0");
            }
            if(type.equals("1")){
                
            }

		%>
		<br><br><br>
		MDN官方关于X-XSS-Protection描述:
        <a href="https://developer.mozilla.org/zh-CN/docs/Web/HTTP/Headers/X-XSS-Protection" target="_blank">X-XSS-Protection</a>

	</body>
	
</html>