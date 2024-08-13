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
	int com = (int) obj;

	String str = request.getParameter("me");
	int me = Integer.parseInt(str);
	%>

	<h1>업다운 게임</h1>
	<%
	if (me <= 100) {
	%>
	<%
	if (com > me) {
	%>
	up
	<a href="updownGame.jsp"><input type="button" value="뒤로 가기"></a>
	<%
	} else if (com < me) {
	%>
	down
	<a href="updownGame.jsp"><input type="button" value="뒤로 가기"></a>
	<%
	} else if (com == me) {

	session.removeAttribute("com");
	session.removeAttribute("cheat");
	%>

	정답
	<a href="index.jsp"><input type="button" value="처음으로"></a>

	<%
	}
	} else {
	%>
	<h2>
		100 <strong>이하</strong> 숫자를 입력해주세요.
	</h2>
	<%
	}
	%>
</body>
</html>















