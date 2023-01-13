<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.jasper.el.ExpressionEvaluatorImpl" %>
<html>
<head>
	<title>表达式注入</title>
</head>
<body>
<p>漏洞链接：<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getContextPath()) %>/vulns/el?name=%24%7b5*6%7d"><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getContextPath()) %>/vulns/el?name=${5*6}</a></p>

<div>参数name:</div>
<div><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getParameter("name"))%></div>
<%
	String name = request.getParameter("name");
	if(name != null){
		ExpressionEvaluatorImpl eaaa = new ExpressionEvaluatorImpl(JspFactory.getDefaultFactory().getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory());
		String num = (String)eaaa.evaluate(name,java.lang.String.class,pageContext.getVariableResolver(),null);
		out.println("表达式执行结果：" + num);
	}
%>

<!-- <h4>spel注入(spring)</h4>
<p>漏洞链接：<a href="/springboot/el?el=%221%22">/springboot/el?el="1"</a></p> -->
</body>

</html>