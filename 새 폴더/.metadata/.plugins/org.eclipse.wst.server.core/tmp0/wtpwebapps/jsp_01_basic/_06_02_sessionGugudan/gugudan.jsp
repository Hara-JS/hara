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
	
		Object obj = null;
		
		obj = session.getAttribute("gameCount");
		int gameCount = (int)obj;
		gameCount += 1;
		session.setAttribute("gameCount", gameCount);		
		
		obj = session.getAttribute("scoreCount");
		int scoreCount = (int)obj;
		int score = scoreCount * 20;
		
		int x = ran.nextInt(8) + 2;
		int y = ran.nextInt(9) + 1;
	%>
	<h1>구구단 게임</h1>
    <h5>5문제를 맞추면 게임 종료</h5>
    <h2><%= gameCount %>번째 게임 : <%= score %>점</h2>
    
    <form action="gugudanPro.jsp">
    	<%= x %> X <%= y %> = <input type="text" name="z" value="0">	<br>
    	<input type="hidden" name="x" value="<%= x %>">
    	<input type="hidden" name="y" value="<%= y %>">
    	<input type="submit" value="전송">
    </form>
</body>
</html>






















