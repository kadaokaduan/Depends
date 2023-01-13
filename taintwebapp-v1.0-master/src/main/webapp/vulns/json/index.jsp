<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>JSON数据源漏洞检测</title>
</head>
<body>
<h4>JSON数据源漏洞检测</h4>
<p>测试步骤：</p>
<h5>fastjson解析json</h5>
<p>1.新建test.txt文件，文件内容如下：</p>
<pre>
{"teacherName":"LiLei","teacherAge":25,"course":{"courseName":"math","courseId":1111},"students":[{"studentName":"chen","studentAge":"16"},{"studentName":"chen1","studentAge":"17"}]}
</pre>
<p>2.发送请求包</p>
<p>curl -X POST -H 'Content-type:application/json;UTF-8' -d @test.txt http://<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getServerName().toString() + ":" + request.getServerPort() + request.getContextPath()) %>/FastJsonServlet</p>

<h5>jackson解析json</h5>
<p>1.新建test.txt文件，文件内容如下：</p>
<pre>
{"studentName":"chen1","studentAge":"17"}
</pre>
<p>2.发送请求包</p>
<p>curl -X POST -H 'Content-type:application/json;UTF-8' -d @test.txt http://<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getServerName().toString() + ":" + request.getServerPort() + request.getContextPath()) %>/JacksonServlet</p>

</body>

</html>