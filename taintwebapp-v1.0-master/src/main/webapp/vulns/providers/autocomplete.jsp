<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<html>
	<head>
		<title>autocomplete missing</title>
	</head>
	<body>
		<h4>1.Autocomplete missing: </h4>
		<form name="input" action="autocomplete.jsp" method="post">
		<input type="radio" name="esapi" value="true"/>没有autocomplete属性<br/>
		<input type="submit" value="Submit"/>
		</form>
		
		<h4>2.Autocomplete is off: </h4>
		<form name="input" action="autocomplete.jsp" method="post" autocomplete="off">
		<input type="radio" name="esapi" value="true"/>autocomplete属性为off<br/>
		<input type="submit" value="Submit"/>
		</form>
		
	</body>
	
</html>