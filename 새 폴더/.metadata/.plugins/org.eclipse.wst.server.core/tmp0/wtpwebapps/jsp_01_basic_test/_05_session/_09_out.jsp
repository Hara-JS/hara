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
	String outInfo = "자바에서도 html 출력이 가능하다";
	out.println("출력 : " + outInfo);
	%>
	<br>
	아니면 이렇게 출력해야지
	<%=outInfo%>



</body>
</html>




