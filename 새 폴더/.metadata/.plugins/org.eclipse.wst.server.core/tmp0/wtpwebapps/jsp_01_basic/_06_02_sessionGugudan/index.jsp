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
		프로그램 내내 사용될 변수들은 
		미리 index.jsp 페이지에서 session에 저장해놓는다.
	 --%>
	 
	 <%
	 	int gameCount = 0;
	 	int scoreCount = 0;
	 	
	 	session.setAttribute("gameCount", gameCount);
	 	session.setAttribute("scoreCount", scoreCount);
	 %>
	 
	 <h1>구구단 게임</h1>
	 <h5>5문제를 맞추면 게임 종료</h5>
	 <a href="gugudan.jsp">게임시작</a>
</body>
</html>