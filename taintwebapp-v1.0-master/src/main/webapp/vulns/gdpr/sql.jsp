<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="at.dallermassl.ap.security.taint.webapp.Config" %>

<html>
<head>	
	<meta charset="UTF-8"/>
	<title>027-1 gdpr sql检测点测试 </title>
</head>
<body>

<h2> gdpr sql检测点测试</h2>
<%
    Connection conn = null; 
    Statement stmt = null;
    PreparedStatement prestmt = null; 
    ResultSet rset = null; 
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(Config.getProperties("sqlUrl"), Config.getProperties("sqlUsername"), Config.getProperties("sqlPassword"));
    } catch (Exception e) {
        e.printStackTrace();
    }

    try {
        String sql = "update gdpr set idcard = \"621225198610062040\" where id = 1";
        PreparedStatement preStmt = conn.prepareStatement(sql);
        int result =preStmt.executeUpdate();// 返回值代表收到影响的行数
        if(result>0) {
            response.getWriter().println("已更新身份证号！");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>


<p>此处将身份证号存到数据库中，不符合gdpr规范</p>

</body>
</html>
