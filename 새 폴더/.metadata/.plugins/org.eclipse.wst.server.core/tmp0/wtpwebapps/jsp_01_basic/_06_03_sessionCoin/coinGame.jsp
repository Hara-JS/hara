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
	<%
		Object obj = session.getAttribute("gameCount");
		int gameCount = (int)obj;
		gameCount += 1;
		session.setAttribute("gameCount", gameCount);
		
		obj = session.getAttribute("scoreCount");
		int scoreCount = (int)obj;
		int score = scoreCount * 20;
	
		Random ran = new Random();
		int coin = ran.nextInt(10) + 1;
	%>
	<h1>코인게임</h1>
	<h5>1~10 사이의 랜덤 숫자의 홀짝을 맞추는 게임(5번)</h5>	

	<h2><%= gameCount %>번째 게임 : <%= score %>점</h2>

	<h3>치트키 : <%= coin  %></h3>
	<button onclick="window.location.href='coinGamePro.jsp?choice=1&coin=<%= coin%>'">홀</button>
	<button onclick="window.location.href='coinGamePro.jsp?choice=2&coin=<%= coin%>'">짝</button>
	
</body>
</html>












