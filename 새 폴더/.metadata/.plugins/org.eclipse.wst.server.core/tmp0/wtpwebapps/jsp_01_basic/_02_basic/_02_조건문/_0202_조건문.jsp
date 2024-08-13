<%@page import="java.util.Random"%>
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
		/*
		    [문제]
		        랜덤숫자(1~10)을 b에 저장한다.
		        b 가 a 보다 크면 "크다" 를 출력 하시오.
		        b 가 a 보다 작으면 "작다" 를 출력 하시오.
		        b 가 a 와 같으면 "같다" 를 출력 하시오.
		    [예시]
		        7
		        크다
		*/
		int a = 5;
		Random ran = new Random();
		int b = ran.nextInt(10) + 1;
		
	%>
	
	<%=b %>
	<hr/>
	
	<%if(b > a) {%>
		<%=String.format("b : %d가 a : %d보다크다." , b , a) %>
	<%} %>
	<%if(b < a) {%>
		<%=String.format("b : %d가 a : %d보다작다." , b , a) %>
	<%} %>
	<%if(b == a){ %>
		<%=String.format("b : %d가 a : %d가 같다." , b , a) %>
	<%} %>
</body>
</html>