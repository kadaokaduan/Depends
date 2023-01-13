<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.servlet.http.HttpUtils.*" %>
<%@ page import="at.dallermassl.ap.security.taint.webapp.Config" %>
<%@ page import="at.dallermassl.ap.security.taint.webapp.AllFilter" %>

<%-- Declare and define the runQuery() method. --%>
<%! String runQuery(String id) throws SQLException {
     Connection conn = null; 
     Statement stmt = null; 
     ResultSet rset = null; 
     try {
        String dtest = AllFilter.DayTest(id);
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(Config.getProperties("sqlUrl"), Config.getProperties("sqlUsername"), Config.getProperties("sqlPassword"));  
        stmt = conn.createStatement();
        rset = stmt.executeQuery ("SELECT * FROM student WHERE id = " + id);

       return (formatResult(rset));
     } catch (Exception e) { 
       return ("<P> Error: <PRE> " + e + " </PRE> </P>\n");
     } finally {
         if (rset!= null) rset.close(); 
         if (stmt!= null) stmt.close();
         if (conn!= null) conn.close();
     }
  }
  String runPrepareQuery(String param) throws SQLException {
	 Connection conn = null; 
     PreparedStatement psmt = null; 
     ResultSet rset = null; 
     try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(Config.getProperties("sqlUrl"), Config.getProperties("sqlUsername"), Config.getProperties("sqlPassword"));  
        
        //String sql = "SELECT * FROM student order by ?";
        String taintsql = "SELECT * FROM student ORDER BY " + param;       
        psmt = conn.prepareStatement(taintsql);
        //psmt.setString(1, param);
        
		rset = psmt.executeQuery();
       return (formatResult(rset));
     } catch (Exception e) { 
       return ("<P> Error: <PRE> " + e + " </PRE> </P>\n");
     } finally {
         if (rset!= null) rset.close(); 
         if (psmt!= null) psmt.close();
         if (conn!= null) conn.close();
     }
  }
  String formatResult(ResultSet rset) throws SQLException {
    StringBuffer sb = new StringBuffer();
    if (!rset.next()) {
    	sb.append("<P> No matching rows.<P>\n");
    } else {  
        do {  
        	sb.append(rset.getString(2) + "\n");
        } while (rset.next());
    }
    return sb.toString();
  }
%>

<%
  String id = request.getParameter("id");
  if (id == null) {
	   id = "1";
  }
  String param = request.getParameter("param");
  if (param == null) {
	  param = "1";
  }
%>

<html>
<head>
    <meta charset="UTF-8"/>
    <title>012 - SQL 注入测试 - JDBC executeQuery() 方式</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
  <div class="container-fluid" style="margin-top: 50px;">
    <div class="row">
      <div class="col-xs-8 col-xs-offset-2">
        <h4>SQL注入 - mysqli executeQuery()方式 </h4>

        <pre>执行语句：
SELECT * FROM student WHERE id = id;
</pre>
      </div>
    </div>

    <div class="row">
      <div class="col-xs-8 col-xs-offset-2">
        <form action="<%= javax.servlet.http.HttpUtils.getRequestURL(request) %>" method="get">
          <div class="form-group">
             <label>查询条件</label>
             <input class="form-control" name="id" value="<%= id %> " autofocus>
          </div>         

          <button type="submit" class="btn btn-primary">提交查询</button> 
        </form>
      </div>
    </div>

    <div class="row">
      <div class="col-xs-8 col-xs-offset-2">
        <h4>注入结果</h4>
        <pre>
<%= runQuery(id) %>
        </pre>        
        <table class="table">
          <tbody>
            
          </tbody>
        </table>
      </div>
    </div>
    
    <div class="row">
    	<div class="col-xs-8 col-xs-offset-2">
    	<h4>SQL注入 - mysqli PreparedStatement()方式 </h4>
    	<pre>执行语句：
SELECT * FROM student ORDER BY ?;
</pre>
    </div>
  </div>
  
  <div class="row">
      <div class="col-xs-8 col-xs-offset-2">
        <form action="<%= javax.servlet.http.HttpUtils.getRequestURL(request) %>" method="get">
          <div class="form-group">
             <label>查询条件</label>
             <input class="form-control" name="param" value="<%= org.owasp.esapi.ESAPI.encoder().encodeForHTML(param) %> " autofocus>
          </div>         

          <button type="submit" class="btn btn-primary">提交查询</button> 
        </form>
      </div>
    </div>
    
    <div class="row">
      <div class="col-xs-8 col-xs-offset-2">
        <h4>注入结果</h4>
        <pre>
<%= runPrepareQuery(param) %>
        </pre>        
        <table class="table">
          <tbody>
            
          </tbody>
        </table>
      </div>
    </div>
  </div>

<div class="row">
    	<div class="col-xs-8 col-xs-offset-2">
    	<h4>SQL注入 - mybatis </h4>
    	<pre>执行语句：
<%
out.println("无漏洞：select * from student where name = #{name};");
out.println("有漏洞：select * from student where name = '${_parameter}';");
%>
</pre>
<p>漏洞链接：<a href="<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getContextPath()) %>/MybatisServlet?id=1&name=apple&taintName=chen">/MybatisServlet?id=1&name=apple&taintName=chen</a></p>
    </div>
  </div>

  <!-- <div class="row">
    	<div class="col-xs-8 col-xs-offset-2">
    	<h4>SQL注入 - spring boot </h4>
    	<pre>执行语句：
<%
out.println("正常调用： select name from student where name=?");
out.println("存在注入： select name from student where name='"+"param"+"'");
%>
</pre>
<p>正常调用：<a href="/springboot/normal-sql?name=chen">/springboot/normal-sql?name=chen</a></p>
<p>漏洞链接：<a href="/springboot/taint-sql?name=chen">/springboot/taint-sql?name=chen</a></p> -->

    </div>
  </div>
  </div>

</body>

