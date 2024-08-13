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
		String str = request.getParameter("total");
		int total = Integer.parseInt(str);
		
		str = request.getParameter("turn");
		int turn = Integer.parseInt(str);	
			
		int state = 0;
		
		if(total >= 31 && turn % 2 == 1){
			state = 1;
		}
		else if(total >= 31 && turn % 2 == 0){
			state = 2;
		}
		
	%>
	<div align="center">
		<h4>현재스코어 : <%= total %></h4>
		<% if(turn % 2 == 1) { %> 
			<h2>p1 차례 </h2>
		<% } else { %>
			<h2>p2 차례 </h2>
		<%} %>
		
		<% if(state == 1) { %>
			<h1>PLAYER 2 승리</h1>
			<a href="index.jsp">처음으로 </a>
		<% } else if(state == 2) { %>
			<h1>PLAYER 1 승리</h1>
			<a href="index.jsp">처음으로 </a>
		<% } else { %>
			<a href="br31.jsp?total=<%=total%>&turn=<%=turn+1%>&play=gamePlaying">뒤로가기 </a>
		<% } %>
	</div>
</body>
</html>