<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		button {
			width: 100px;
			height: 100px;
		}
		.blue {
			background-color: blue; 
		}
		.red {
			background-color: red; 
		}
	</style>
</head>
<body>
	<%
		final int PLAYING = 0;
		final int WIN = 1;
		final int LOSE = 2;
		
		Object obj = session.getAttribute("lotto");
		int[] lotto = (int[])obj;
		
		obj = session.getAttribute("check");
		boolean[] check = (boolean[])obj;
		
		obj = session.getAttribute("count");
		int count = (int)obj;
		
		obj = session.getAttribute("status");
		int status = (int)obj;
	%>
	
	<h1>복권긁기</h1>
	<h3>버튼 3개를 클릭하세요. 전부 7이면 당첨입니다.</h3>
	<h3>남은 횟수 : <%= count %></h3>
	
	<% for(int i=0; i<lotto.length; i++) { %>
		<%	if(check[i] == true && lotto[i] == 7) { %>
				<button class="blue" disabled></button>
		<%	} else if(check[i] == true && lotto[i] == 1) { %>
				<button class="red" disabled="disabled"></button>
		<%	} else {%>
				<%	if(status == PLAYING) { %>
						<button onclick="window.location.href='lottoGamePro.jsp?index=<%= i %>'"></button>
				<%	} else {%>
						<button disabled="disabled"></button>
				<%	} %>
		<%	} %>
	<%	} %>
	
	<%	if(status == WIN) { %>
			<h1>축하합니다. 당첨입니다.</h1>
			<a href="index.jsp">다시한번</a>
	<%	} else if(status == LOSE) { %>
			<h1>아쉽지만 실패입니다.</h1>
			<a href="index.jsp">다시한번</a>
	<%	} %>
</body>
</html>














