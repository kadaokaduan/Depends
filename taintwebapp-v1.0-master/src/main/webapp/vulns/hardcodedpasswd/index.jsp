<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>密码/加密密钥硬编码</h1>
        <%
            
            new at.dallermassl.ap.security.taint.webapp.hardcodepassword();
        %>

        
        <p>密码/加密密钥被硬编码在hardcodepassword.java中</p>
    </body>
</html>