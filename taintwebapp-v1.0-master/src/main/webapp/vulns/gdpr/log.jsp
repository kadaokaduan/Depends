<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="org.apache.log4j.Logger" %> 
<html>
<head>	
	<meta charset="UTF-8"/>
	<title>027-2 gdpr log检测点测试 </title>
</head>
<body>

<%
    Logger log = Logger.getLogger(this.getClass());
    log.info("bankcard:" + "5194130200016587010");
%>

<h2> gdpr log检测点测试</h2>
<p>此处将银行卡号存到日志中，不符合gdpr规范</p>

</body>
</html>
