<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="at.dallermassl.ap.security.taint.webapp.custom.PayDemo" %>
<html>
<head>	
	<meta charset="UTF-8"/>
	<title>026-3 自定义sink点测试 </title>
</head>
<body>

<%
    
    PayDemo payDemo = new PayDemo();

	String username = payDemo.getUserName();
	String bankBalance = payDemo.getMoney();
	String accountBalance = payDemo.getStamps();
	String payServlet_path = "/PayServlet";
%>

<h2> 自定义sink点测试( 逻辑漏洞 - 充值金额任意修改 ) </h2>
<ul>
    <li>用户名: <%=username%></li>
    <li>银行卡余额: <%= bankBalance %></li>
    <li>账户余额: <%= accountBalance %></li>
</ul>

<h3>充值</h3>
<p>
	<form name="input" action=<%= request.getContextPath() + payServlet_path %> method="post">
	  充值账户：<input id="username" type="text" name="username" size="60" /><br/>
      充值金额: <input id="inputmoney" type="number" name="money" size="60" onkeyup="getStampsValue(this)"/><br/>
      可获得: <input id="playerget" type="text" name="stamps"  size="60" readonly/>点券<br/>      
      <input type="submit" value="确认"/>
    </form>
</p>

<script>function getStampsValue(v){document.getElementById("playerget").value = v.value * 100;}</script>

</body>
</html>
