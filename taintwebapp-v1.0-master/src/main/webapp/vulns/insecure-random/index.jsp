<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<html>
	<head>
		<title>Insecure Randomness</title>
	</head>
	<body>
		<h2>Insecure Randomness</h2>
		<h4>Randow.nextBytes()</h4>
		<%
			Random randomno = new Random();
			byte[] nbyte = new byte[10];
			randomno.nextBytes(nbyte);
			out.println(nbyte);
		%>
		
		<h4>Randow.nextInt()</h4>
		<%
			int value = randomno.nextInt(100);
			out.println(value);
		%>
		
		<h4>Randow.nextGaussian()</h4>
		<%
			double value1 = randomno.nextGaussian();
			out.println(value1);
		%>
		
		<h4>Randow.nextBoolean()</h4>
		<%
			boolean value2 = randomno.nextBoolean();
			out.println(value2);
		%>
		
		<h4>Randow.nextDouble()</h4>
		<%
			double value3 = randomno.nextDouble();
			out.println(value3);
		%>
		
		<h4>Randow.nextFloat()</h4>
		<%
			float value4 = randomno.nextFloat();
			out.println(value4);
		%>
		
		<h4>Randow.nextLong()</h4>
		<%
			long value5 = randomno.nextLong();
			out.println(value5);
		%>
	</body>
	
</html>