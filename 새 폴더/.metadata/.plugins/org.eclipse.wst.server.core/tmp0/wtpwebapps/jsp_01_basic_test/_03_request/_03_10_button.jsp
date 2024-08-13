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
	
	int a = 10;
	int b = 20;
	int c = 30;
	
	%>

	<button onclick="window.Location.href='_03_10_buttonPro.jsp?a=<%=a%>&b=<%=b%>&c=<%=c%>'">전송</button>

</body>
</html>