<%@ page import="org.apache.http.HttpResponse" %>
<%@ page import="org.apache.http.client.HttpClient" %>
<%@ page import="org.apache.http.client.methods.HttpGet" %>
<%@ page import="org.apache.http.impl.client.HttpClients" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.util.Map" %>

<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>011 - SSRF - HttpClient 方式</title>
</head>
<body>
<%
    String urlString = request.getParameter("url");
    if (urlString != null) {
        try {
            StringBuffer resultBuffer = null;
            HttpClient client = HttpClients.createDefault();
            BufferedReader br = null;
            HttpGet httpGet = new HttpGet(urlString);
            HttpResponse res = client.execute(httpGet);
            // 读取服务器响应数据
            br = new BufferedReader(new InputStreamReader(res.getEntity().getContent(),"UTF-8"));
            String temp;
            resultBuffer = new StringBuffer();
            while ((temp = br.readLine()) != null) {
                resultBuffer.append(temp);
            }
            out.println(org.owasp.esapi.ESAPI.encoder().encodeForHTML(resultBuffer.toString()));
        } catch (Exception e) {
            out.print(org.owasp.esapi.ESAPI.encoder().encodeForHTML(e.toString()));
        }
    }

%>
<pre>说明: 参数 url 为请求的 url</pre>
</body>
</html>
