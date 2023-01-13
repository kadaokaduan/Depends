<%@ page contentType="text/html; charset=UTF-8" %>
<html>
	<head>include 文件包含</head>
	<body>
		<% 
			String urlfile = request.getParameter("file");
		%>
		<jsp:include page="<%=urlfile%>" flush="true"></jsp:include>
	</body>
</html>
