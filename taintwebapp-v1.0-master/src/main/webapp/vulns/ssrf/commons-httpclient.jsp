<%@ page import="org.apache.commons.httpclient.HttpClient" %>
<%@ page import="org.apache.commons.httpclient.methods.GetMethod" %>

<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>011 - SSRF - commons.httpclient 方式</title>
</head>
<body>
<%
    String urlString = request.getParameter("url");
    if (urlString != null) {
        try {
            HttpClient httpClient = new HttpClient();
            GetMethod getMethod = new GetMethod(urlString);
            httpClient.executeMethod(getMethod);

            String charSet = getMethod.getResponseCharSet();
            byte[] responseBody = getMethod.getResponseBody();
            out.println("response:\r\n" + org.owasp.esapi.ESAPI.encoder().encodeForHTML(new String(responseBody, charSet)));
        } catch (Exception e) {
            out.print(org.owasp.esapi.ESAPI.encoder().encodeForHTML(e.toString()));
        }
    }
%>
<p>commons-httpclient 调用方式: </p>
<pre>说明: 参数 url 为请求的 url</pre>
</body>
</html>
