<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--계속 사용할 변수는 index.jsp에 저장 --%>

	<%
	Random ran = new Random();

	int com = ran.nextInt(100) + 1;

	session.setAttribute("com", com);
	session.setAttribute("cheat", 0);
	%>
	
	<h1>업 다운 게임</h1>
	<h2>1~100</h2>
	
	<a href="updownGame.jsp"><input type="button" value="게임 시작"></a>

</body>
</html>