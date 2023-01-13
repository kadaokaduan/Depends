<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="at.dallermassl.ap.security.taint.webapp.SendSMSUti" %>
<%@ page import="java.lang.String" %>
<html>
<head>
    <title>发送验证码</title>
</head>
<body>


<%
    String normal_querystring = "?phoneNumber=13602706376";
    String phoneNumber = request.getParameter("phoneNumber");

    if(phoneNumber != null){
        SendSMSUti sendSMS = new SendSMSUti();
        //发送短信并获取短信内容
        String result = sendSMS.senSMSUtil(phoneNumber);
        // 发送不成功
        if (result == null || !result.equals("OK")) {
            out.println("验证码发送失败");
        }
        //获取验证码
        int code = sendSMS.getCode();
        out.println(code+"");

    }else{
        out.println("请输入phoneNumber");
    }

%>

<p>正常调用: </p>
<p>curl '<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+normal_querystring%>" target="_blank"><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getRequestURL().toString())+normal_querystring%></a>'</p>
</body>

</html>