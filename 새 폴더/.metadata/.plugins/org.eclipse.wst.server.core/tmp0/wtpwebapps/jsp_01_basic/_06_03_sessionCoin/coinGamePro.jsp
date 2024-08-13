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
		
		obj = session.getAttribute("scoreCount");
		int scoreCount = (int)obj;	
		
		String str = request.getParameter("choice");
		int choice = Integer.parseInt(str);
		
		str = request.getParameter("coin");
		int coin = Integer.parseInt(str);
		
		int state = 0;
		if(coin % 2 == 0 && choice == 2) {
			state = 1;
			scoreCount += 1;
			
			session.setAttribute("scoreCount", scoreCount);
		} else if(coin % 2 == 1 && choice == 1){
			state = 1;
			scoreCount += 1; 
			
			session.setAttribute("scoreCount", scoreCount);
		} else {
			state = 2;
		}
		
		if(gameCount == 5) {
			state = 3;
		}
	%>
	
	<h1>코인게임</h1>
	<%	if(state == 1) { %>
			<h2>정답!</h2>
			<a href="coinGame.jsp">뒤로가기</a>
	<%	} else if(state == 2) { %>
			<h2>오답!</h2>
			<a href="coinGame.jsp">뒤로가기</a>
	<%	} else if(state == 3) { %>
			<h1>게임종료</h1>
			<% int score = scoreCount * 20; %>
			<h2>점수 : <%= score %></h2>
			<%
				session.removeAttribute("gameCount");
				session.removeAttribute("scoreCount");
			%>
			<a href="index.jsp">처음으로</a>
	<%	} %>
	
</body>
</html>










