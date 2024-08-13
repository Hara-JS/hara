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
	<%--
		프로그램 내내 사용될 변수들은 미리
		index.jsp 페이지에서 session에 저장해 놓는다.
	--%>
	
	<%
		Random ran = new Random();
		
		int com = ran.nextInt(100) + 1;
		
		session.setAttribute("com", com);
		session.setAttribute("cheat", 0);
	%>
	
	<h1>업다운 게임</h1>
	<h5>1~100 사이의 랜덤 숫자 맞추기</h5>
	
	<a href="updownGame.jsp">게임시작</a>
</body>
</html>