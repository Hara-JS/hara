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
		int gameCount = 0;
		int scoreCount = 0;
		
		session.setAttribute("gameCount", gameCount);
		session.setAttribute("scoreCount", scoreCount);
	%>

	<h1>코인게임</h1>
	<h5>1~10 사이의 랜덤 숫자의 홀짝을 맞추는 게임(5번)</h5>
	<a href="coinGame.jsp">코인게임</a>
</body>
</html>