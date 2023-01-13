<%@page import="at.dallermassl.ap.security.taint.webapp.StringModification"%>
<%@page import="at.dallermassl.ap.security.taint.webapp.Sanitizer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>025过滤规则测试 - XSS</h1>
        <%
            String user;
            String sanitizeString;
            String esapiString;
            boolean sanitize;
            boolean esapi;
            String checkedString="";
            String notCheckedString="";

            // input params
            user = request.getParameter("username");
            sanitizeString = request.getParameter("sanitize");
            esapiString = request.getParameter("esapi");
            if (sanitizeString == null || "false".equals(sanitizeString)) {
                sanitize = false;
                notCheckedString = "checked";
            } else {
                sanitize = true;
                checkedString = "checked";
            }
            
            if (esapiString == null || "false".equals(esapiString)) {
                esapi = false;
                notCheckedString = "checked";
            } else {
                esapi = true;
                checkedString = "checked";
            }

            if (user == null) {
                user = "";
            }

            if (sanitize) {
                String encodeUser = Sanitizer.sanitize(user);
                user = encodeUser;
            }
            
            if (esapi) {
                user = Sanitizer.encodeforHtml(user);
            }
        %>

        <h2>Input parameters</h2>
        <p>
        <form name="input" action="./xss.jsp" method="post">
          Username: <input type="text" name="username" value="<%=user%>" size="60"/><br/>
          <input type="radio" name="esapi" value="true" <%=checkedString%>/> 使用ESAPI进行过滤<br/>
          <input type="radio" name="esapi" value="false" <%=notCheckedString%>/> 不使用ESAPI进行过滤<br/>
          <input type="radio" name="sanitize" value="true" <%=checkedString%>/> 使用自定义过滤函数<br/>
          <input type="radio" name="sanitize" value="false"  <%=notCheckedString%>/> 不使用自定义过滤函数<br/>
          <input type="submit" value="Submit"/>
        </form>
        </p>

        <%
        out.println("<li>User: " + user + "</li>");
        %>
        </ul>
        <!-- add image as test (was a bug) -->
        
        
    </body>
</html>