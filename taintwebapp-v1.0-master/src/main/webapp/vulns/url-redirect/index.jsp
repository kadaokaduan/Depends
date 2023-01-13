<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>URL Redirect</title>
</head>
<body>
<%
    String addr = "http://" + org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getServerName().toString() + ":" + request.getServerPort() + request.getContextPath());

    String urlString = request.getParameter("url");
	String urlString1 = request.getParameter("url1");
    if (urlString != null) {
        response.sendRedirect(urlString);
    }
    if (urlString1 != null) {
        response.setStatus(302);
        response.setHeader("location", urlString1);
    }
%>
<pre>说明: 参数 url 为 sendRedirect请求的 url</pre>
<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getContextPath()) %>/vulns/url-redirect?url=<%= addr %>">漏洞链接：<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getContextPath()) %>/vulns/url-redirect?url=<%= addr %></a>
<pre>说明: 参数 url1 为 setHeader请求的 url</pre>
<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getContextPath()) %>/vulns/url-redirect?url1=<%= addr %>">漏洞链接：<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getContextPath()) %>/vulns/url-redirect?url1=<%= addr %></a>
</body>
</html>
