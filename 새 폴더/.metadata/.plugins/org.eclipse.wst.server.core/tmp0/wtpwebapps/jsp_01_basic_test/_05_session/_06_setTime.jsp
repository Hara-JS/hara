<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	String[] name = { "qwer", "asdf", "zxcv", "wert" };

	int[] score = { 12, 23, 34, 45 };

	session.setAttribute("name", name);

	session.setAttribute("score", score);

	session.setMaxInactiveInterval(5);

	response.sendRedirect("_06_setTimePro.jsp");
	%>


</body>
</html>


