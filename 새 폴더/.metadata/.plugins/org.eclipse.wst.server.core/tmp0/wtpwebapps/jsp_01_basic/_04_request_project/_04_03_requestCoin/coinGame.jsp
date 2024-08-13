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
		Random ran = new Random();
		String play = request.getParameter("play");
		
		int coin = ran.nextInt(10) + 1;
		
		int gameCount = 0;
		int score = 0;
		int scoreCount = 0;
		
		if(play.equals("gameStart")) {
			
			gameCount = 1;
			scoreCount = 0;
		} else if(play.equals("gamePlaying")){	
			scoreCount = Integer.parseInt(request.getParameter("scoreCount"));
			gameCount = Integer.parseInt(request.getParameter("gameCount"));
			
			score = scoreCount * 20;
		}
	%>
	<div align="center">
		치트키 : <%=coin %>
		<h1>홀짝게임</h1>
		<h2>5문제를 맞추면 종료</h2>
		<h2>[<%= gameCount %>]번째 게임 : [<%= score %>]점</h2>
		<button onclick="window.location.href='coinGamePro.jsp?choice=1&coin=<%=coin%>&scoreCount=<%=scoreCount%>&gameCount=<%=gameCount%>'">홀</button>
		<button onclick="window.location.href='coinGamePro.jsp?choice=2&coin=<%=coin%>&scoreCount=<%=scoreCount%>&gameCount=<%=gameCount%>'">짝</button>
	</div>
</body>
</html>