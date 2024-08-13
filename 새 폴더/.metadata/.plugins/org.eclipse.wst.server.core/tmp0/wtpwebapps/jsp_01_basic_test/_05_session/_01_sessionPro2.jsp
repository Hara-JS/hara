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
	Object obj = session.getAttribute("x");
	System.out.println("02 : " + obj);
	int x = (int) obj;

	obj = session.getAttribute("y");
	System.out.println("02 : " + obj);
	int y = (int) obj;
	%>

	<h2>다음 페이지2</h2>

	x =	<%=x%>, y = <%=y%> <br>

	<a href="_01_sessionRemove.jsp">다음 페이지3</a>
	<a href="_02_invalidate.jsp">세선 모두 지우기</a>

</body>
</html>





