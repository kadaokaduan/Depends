<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>	
	<meta charset="UTF-8"/>
	<title>dubbo场景测试</title>
</head>
<body>
	<h1>dubbo场景测试</h1>

<%

    String dubboAddr = org.owasp.esapi.ESAPI.encoder().encodeForHTML("http://" + request.getServerName().toString() + ":8081");
    String stringVuln = "/stringVuln?name=whoami";
    String pojoVuln = "/pojoVuln?name=whoami";
    String multiPojoVuln = "/multiPojoVuln?name=whoami";
    String mixPojoVuln = "/mixPojoVuln?name=who&name2=ami";

%>    

<p>dubbo调用参数为String类型: </p>
	<p>curl '<a href="<%=dubboAddr + stringVuln%>" target="_blank"><%=dubboAddr + stringVuln%></a>'</p>
<p>dubbo调用参数为简单Pojo对象: </p>
	<p>curl '<a href="<%=dubboAddr + pojoVuln%>" target="_blank"><%=dubboAddr + pojoVuln%></a>'</p>
<p>dubbo调用参数为含有100个成员变量的pojo对象: </p>
	<p>curl '<a href="<%=dubboAddr + multiPojoVuln%>" target="_blank"><%=dubboAddr + multiPojoVuln%></a>'</p>
<p>漏洞触发点为两个参数的拼接: </p>
	<p>curl '<a href="<%=dubboAddr + mixPojoVuln%>" target="_blank"><%=dubboAddr + mixPojoVuln%></a>'</p>


</body>
</html>
