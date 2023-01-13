<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>028 加密场景测试 </title>
</head>
<body>

<h4>加密场景测试</h4>

<p>此处可测出XSS漏洞</p>

<p>curl http://<%=org.owasp.esapi.ESAPI.encoder().encodeForHTML(request.getServerName().toString() + ":" + request.getServerPort() + request.getContextPath()) %>/EncryptServlet -X POST -d "4faf2813f51475fc47c398192aef2f82#Ol6LoHeBmbYQjxlV9KOPRRN8o52u0UeUOj0dk9zZ/fiYM6jw0pdA/9c9z9i8gmvwxb7jcOl73wgPE/SjZGNYspwv7bkDQ/GSu1zLdoTxpeBzal1Fp12otYlNvep132johvLdgUM/8IW1+bdg6qftOk9A120BqPX36PJf6YIl+gGj+xAl8nukVAbd5KcaYeSGj3uWGdF2WNWPdYOEtGQT0aS0gl561FOlH8P0LSItRgPDkmIzfF9rVYPkhy3OF7p3SzEL3MNlbe2/9wsOOmlj/o2uqjNJEHNwLhJaqam2LBJLiQGqwMKnrtnRsf/PP8ewDBayW/EmR+rHATJlubGUtwmn8yE9UECIq6TZ5//8+RSloGHXGFDNQ/Ji79JzDoZYNLLnu10AP3LH3gczEaDMgJuu2vGYJdb6xl5hxt3G2xS7srJ1kf4K9CrTtmQtbgSwNXv4uUvknvcXj8wsof7PaLBU/YXQxSGZfW8CxRpwVBN9PpMhroqKbx1ZevXHQmnUpGSdobkVHsl7sGgrzk0RZhdiyiVFFOnW4wuRo8Ea7gej2c2mo7sNebnSpyZFNHuVPmnwFu4Qy1dmkrHEh6/fHIKy88U28MK0E9tKnusGdhnCMqT+sqYTsjVa/xSiXnB7OkpE9FDZ3JUnaDMWp2b1/IjIM0uPI3rznRHhfc+b1mw+iB3ql/eZ9gXaB3ZhQgNytl26EBk+UgMQNneqcuJa7gBMzmJkOHNb95vm/nwKKNMHj2hGFRYebdH3hvcpQla9luzzUQbzInL4V4g94k1aHjMNZ5brwN4a46J1GYuMlgE=#Qp5rOgcnn6NwUIZiwR55iTYHHQEbGXApQ4nIVS0ojQY4YoHQP3kBTYJgf3Q5ry5UG59c+TefxQFnOzMcpRXP2rKTCc0QTceHRaFnxkL7sdx5X5OElyM85j8iGkyPDL0vyExtEAcwPcAeIYXOjr29nJK6M2+09zGf+8HyQzLwrXk="</p>

</body>
</html>
