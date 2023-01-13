<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.security.*" %>
<html>
	<head>
		<title>Insecure Hash</title>
	</head>
	<body>
		<h2>MD5</h2>
		<% 
			String plainText = "Hello , world !";  
		    MessageDigest md5 = MessageDigest.getInstance("md5");  
		    byte[] cipherData = md5.digest(plainText.getBytes());  
		    StringBuilder builder = new StringBuilder();  
		    for(byte cipher : cipherData) {  
		        String toHexStr = Integer.toHexString(cipher & 0xff);  
		        builder.append(toHexStr.length() == 1 ? "0" + toHexStr : toHexStr);  
		    }  
		    out.println(builder.toString());
		%>
		
		<h2>SHA-1</h2>
		<%
			char[] hexDigits = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 
		            'a', 'b', 'c', 'd', 'e', 'f'};
		    try {
		        MessageDigest mdTemp = MessageDigest.getInstance("SHA1");
		        mdTemp.update(plainText.getBytes("UTF-8"));
		         
		        byte[] md = mdTemp.digest();
		        int j = md.length;
		        char[] buf = new char[j * 2];
		        int k = 0;
		        for (int i = 0; i < j; i++) {
		            byte byte0 = md[i];
		            buf[k++] = hexDigits[byte0 >>> 4 & 0xf];
		            buf[k++] = hexDigits[byte0 & 0xf];
		        }
		        out.println(new String(buf));
		    } catch (NoSuchAlgorithmException e) {
		        e.printStackTrace();
		    } 
		%>
	</body>
</html>