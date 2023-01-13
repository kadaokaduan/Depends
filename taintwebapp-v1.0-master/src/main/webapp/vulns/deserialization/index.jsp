<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>016 不安全的反序列化</title>
</head>
<body>
<h4>016 不安全的反序列化</h4>
<p>测试步骤：</p>
<p>1.发送请求包</p>
<p>curl -X POST -H 'Content-type:application/octet-stream;UTF-8' -d rO0ABXQAC0hlbGxvIFdvcmxk http://<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getServerName().toString() + ":" + request.getServerPort() + request.getContextPath()) %>/DeserializationServlet</p>

</body>

</html>