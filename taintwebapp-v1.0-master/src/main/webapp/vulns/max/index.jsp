<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@page import="at.dallermassl.ap.security.taint.webapp.Sanitizer" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>	
	<meta charset="UTF-8"/>
	<title>多重循环性能测试</title>
</head>
<body>
    <h1>多重循环性能测试</h1>
    <p>执行逻辑:</p>
    <p>20000次循环执行  String str = new String(dirname); </p>
    <p>不加agent执行时间2ms - 8ms，2.2版本加agent 17000ms - 30000ms，2.3待测</p>
<%
String normal_querystring = "?dirname=dir";
String dirname = request.getParameter("dirname");

long startTime=System.currentTimeMillis(); 
if (dirname != null) {
    dirname = Sanitizer.mySanitizer(dirname);
    for(int i = 0; i < 20000; i++){
        String str = new String(dirname);
        
    }
	
} else {
%>
<p>正常调用: </p>
	<p>curl '<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+normal_querystring%>" target="_blank"><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+normal_querystring%></a>'</p>

<%
    }
long endTime=System.currentTimeMillis(); //获取结束时间
long time = endTime - startTime;
out.println("程序运行时间："+ time +"ms");
%>
</body>
</html>
