<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<html>
	<head>
		<title>Insecure Cookie</title>
	</head>
	<body>
		<h2>不安全的Cookie</h2>
		<% 
			String str = "Helloworld";  
			javax.servlet.http.Cookie cookie = new javax.servlet.http.Cookie("SomeCookie", str);
			cookie.setSecure(true);
			cookie.setSecure(false);
			System.out.println(cookie.getSecure());
			response.addCookie(cookie);
		%>

	</body>
</html>