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
		Object obj = session.getAttribute("com");
		int com = (int)obj;
	
		String str = request.getParameter("me");
		int me = Integer.parseInt(str);
	%>
	<h1>업다운 게임</h1>
	<%	if(com > me) { %>
			<h2>Up!</h2>
			<a></a>
			<a href="updownGame.jsp">뒤로가기</a>
	<%	} else if(com < me) { %>
			<h2>Down!</h2>
			<a href="updownGame.jsp">뒤로가기</a>
	<%	} else if(com == me) { %>
	<%
			session.removeAttribute("com");
			session.removeAttribute("cheat");
	%>
			<h2>Bingo!</h2>
			<a href="index.jsp">처음으로</a>
	<%	} %>
	
</body>
</html>















