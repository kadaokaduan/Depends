<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="at.dallermassl.ap.security.taint.webapp.VisitSite" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
<h1>访问站点</h1>
<%
    String url = request.getParameter("url");
    if(url != null){
        VisitSite fg = new VisitSite();
        fg.doPostUrl(url);
    }
%>

<p>正常调用：<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getContextPath()) %>/vulns/visitsite?url=https://222.186.160.54/"><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getContextPath()) %>/vulns/visitsite?url=https://222.186.160.54/</a></p>

</body>
</html>
