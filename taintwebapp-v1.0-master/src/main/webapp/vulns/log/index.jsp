<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.log4j.Logger" %> 
<%@ page import="java.util.*,java.io.*,java.text.*,java.net.*" %>  

<html>
	<head>
		<title>log注入</title>
	</head>
	<body>
		<p>漏洞链接：</p>
		<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getContextPath()) %>/vulns/log/?info=1231"><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getContextPath()) %>/vulns/log/?info=1231</a><br>
		<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getContextPath()) %>/vulns/log/?error=1231"><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getContextPath()) %>/vulns/log/?error=1231</a><br>
		<br>
		<%
			Logger log = Logger.getLogger(this.getClass());
			String info = request.getParameter("info");
			String error = request.getParameter("error");
						
			if(info != null){
				log.info("url:"+org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString()) + ";params:"+info);
			}
			
			if(error != null){
				log.error("url:"+org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString()) + ";params:"+error);
			}
			
			File file = new File("../taintwebapplogs/log4j.log");
			BufferedReader  reader = null;
	        try {
	            reader = new BufferedReader(new FileReader(file));
	            String tempString = null;
	            while ((tempString = reader.readLine()) != null) {
	                out.println(tempString + "<br>");
	            }
	            reader.close();
	        } catch (IOException e) {
	            e.printStackTrace();
	        } finally {
	            if (reader != null) {
	                try {
	                    reader.close();
	                } catch (IOException e1) {
	                }
	            }
	        }
		%>
	</body>
</html> 