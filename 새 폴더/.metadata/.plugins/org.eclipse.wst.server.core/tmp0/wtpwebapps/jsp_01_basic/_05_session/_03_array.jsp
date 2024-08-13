<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--
		session은 배열도 저장할 수 있다.
	 --%>
	 
	 <%
	 	String[] name = {"qwer", "abcd", "hello"};
	 	int[] score = {87, 21, 75};
	 	
	 	session.setAttribute("name", name);
	 	session.setAttribute("score", score);
	 %>
	 
	 <a href="_03_arrayPro.jsp">다음 페이지</a>
</body>
</html>


