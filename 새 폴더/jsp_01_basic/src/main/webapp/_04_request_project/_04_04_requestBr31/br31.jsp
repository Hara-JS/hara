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
		int total = 0;
		int turn = 0;
		
		String play = request.getParameter("play");
		if(play.equals("gameStart")) {
			total = 0;
			turn = 1;
		} else if(play.equals("gamePlaying")) {
			String str = request.getParameter("total");
			total = Integer.parseInt(str);
			
			str = request.getParameter("turn");
			turn = Integer.parseInt(str);	
		}
	%>
	<div align="center">
		<h1>베스킨라빈스31</h1>
		<h3>31이상이면 패배 </h3>
		<h4>현재스코어 : <%= total %></h4>
		<% if(turn % 2 == 1) { %>
			<h2>PLAYER 1 차례</h2>
		<% } else { %>
			<h2>PLAYER 2 차례</h2>
		<% } %>
		<br><br>
		
		<button onclick="window.location.href='br31Pro.jsp?total=<%=total + 1%>&turn=<%=turn%>&'"><%=total + 1 %></button>
		<button onclick="window.location.href='br31Pro.jsp?total=<%=total + 2%>&turn=<%=turn%>&'"><%=total + 2%></button>
		<button onclick="window.location.href='br31Pro.jsp?total=<%=total + 3%>&turn=<%=turn%>&'"><%=total + 3 %></button>
	</div>
</body>
</html>