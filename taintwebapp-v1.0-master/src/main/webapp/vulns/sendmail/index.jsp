<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="at.dallermassl.ap.security.taint.webapp.SendMailUti" %>
<%@ page import="java.lang.String" %>
<html>
<head>
    <title>发送验证码</title>
</head>
<body>


<%
    String normal_querystring = "?mailaddr=734731936@qq.com";
    String mailaddr = request.getParameter("mailaddr");

    if(mailaddr != null){
        SendMailUti Mail = new SendMailUti();
        Mail.sendEmail(mailaddr,"subject test","Hello Email", null);
    }else{
        out.println("请输入收件人邮箱");
    }

%>

<p>正常调用: </p>
<p>curl '<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+normal_querystring%>" target="_blank"><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+normal_querystring%></a>'</p>
</body>

</html>
