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
	String[] name = { "qwer", "asdff", "zxcv" };

	int[] score = { 87, 65, 98 };

	session.setAttribute("name", name);

	session.setAttribute("score", score);
	%>

	<a href="_03_arrayPro.jsp">다음 페이지</a>

</body>
</html>


