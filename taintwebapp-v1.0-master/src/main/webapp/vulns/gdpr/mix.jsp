<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="at.dallermassl.ap.security.taint.webapp.Config" %>  
<html>
<head>	
	<meta charset="UTF-8"/>
	<title>027-4 gdpr 混合检测点测试 </title>
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

<%
    Logger log = Logger.getLogger(this.getClass());
    log.info("bankcard:" + "5194130200016587010");
%>

<h2> gdpr log检测点测试</h2>
<p>此处将银行卡号存到日志中，不符合gdpr规范</p>

<%   
    response.getWriter().println("phone:" + "18137100080");
%>
<h2> gdpr response检测点测试</h2>
<p>此处将手机号返回到response响应中，不符合gdpr规范</p>

</body>
</html>
