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
		String str = request.getParameter("me");
		int me = Integer.parseInt(str);
		
		str = request.getParameter("com");
		int com = Integer.parseInt(str);
	%>	
	
	<div align="center">
		<% if(me > com){ %>
			내가 크다. <br>
			<a href="updownGamePlay.jsp?com=<%=com%>&play=gamePlaying">뒤로가기</a>
		<% } else if(me < com) { %>
			내가 작다. <br>
			<a href="updownGamePlay.jsp?com=<%=com%>&play=gamePlaying">뒤로가기</a>
		<% } else if(me == com) { %>
			정답입니다. <%=com %> <br>
			<a href="index.jsp">처음으로</a>
		<% } %>
	</div>
	
</body>
</html>