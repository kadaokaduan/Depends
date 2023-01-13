<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.crypto.*" %>
<%@ page import="javax.crypto.spec.SecretKeySpec" %>
<html>
	<head>
		<title>Weak Encryption</title>
	</head>
	<body>
		<h2>DES加密</h2>
		<% 
			String plainText = "Hello , world !";  
		    
			SecretKey key = KeyGenerator.getInstance("DES").generateKey(); 
			Cipher descipher = Cipher.getInstance("DES"); 
			descipher.init(Cipher.ENCRYPT_MODE, key);
			
			byte[] cipherData = descipher.doFinal(plainText.getBytes());
			System.out.println("key: " + key);
		    System.out.println("cipherText : " +cipherData);
		%>
		
		<h2>AES ECB</h2>
		<%
			String plainTextdes = "Hello,world!1234asdasdasdasdasddddddddddddssssssssssssssssssssssssssssssssssssss";
			byte[] key1 = {1, 2, 3, 4, 5, 6, 7, 8, 0, 1, 2, 3, 4, 5, 6, 7};
			SecretKeySpec spec = new SecretKeySpec(key1, "AES");
			Cipher aesEcbCipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
			aesEcbCipher.init(Cipher.ENCRYPT_MODE, spec);
			
			byte[] cipheraesEcbData = aesEcbCipher.doFinal(plainText.getBytes());
			System.out.println("key: " + key);
		    System.out.println("cipherText : " +cipheraesEcbData);
		
		%>
	</body>
</html>