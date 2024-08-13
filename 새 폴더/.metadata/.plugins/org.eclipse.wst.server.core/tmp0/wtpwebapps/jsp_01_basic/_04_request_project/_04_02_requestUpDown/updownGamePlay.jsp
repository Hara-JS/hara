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
		System.out.println("play = " + play);
		
		int com = 0;
		
		if(play.equals("gameStart")){
			com = ran.nextInt(100) + 1;
		}else if(play.equals("gamePlaying")){
			com = Integer.parseInt(request.getParameter("com"));
		}
	%>
	<div align="center">
		치트키 : <%= com %>
		<h1>업다운게임</h1>
		
		<form action="updownGamePlayPro.jsp">
			<input type="text" name="me" value="0">
			<input type="hidden" name="com" value=<%=com %>>
			
			<input type="submit" value="전송">
		</form>
	</div>
</body>
</html>