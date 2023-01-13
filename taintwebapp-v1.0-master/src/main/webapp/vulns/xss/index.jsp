<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="at.dallermassl.ap.security.taint.webapp.AllFilter" %>
<%@ page import="at.dallermassl.ap.security.taint.webapp.CodeFile" %>
<%@ page import="jdk.internal.dynalink.support.NameCodec" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>XSS</h1>
        <%
            String user = request.getParameter("name");
            if(user != null){
                String fg = AllFilter.XssFilter(user);
                String dg = CodeFile.Decode(fg);
                out.println(dg);
            }
        %>

        <p>正常调用：<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getContextPath()) %>/vulns/xss?name=test"><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getContextPath()) %>/vulns/xss?name=test</a></p>
        <p>XSS触发：<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getContextPath()) %>/vulns/xss?name=%3cscript%3ealert(1)%3c%2fscript%3e"><%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getContextPath()) %>/vulns/xss?name=%3cscript%3ealert(1)%3c%2fscript%3e</a></p>
        
             
    </body>
</html>