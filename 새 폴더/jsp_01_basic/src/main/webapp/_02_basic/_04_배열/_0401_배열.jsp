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
	        arr배열에서 3의 배수만 출력하시오.
	    [정답]
	        24
	        12    
	*/
	int[] arr = {10, 43, 24, 12, 52};
		
	%>
	
	<%for(int i = 0; i < arr.length;i++) {%>
		<%if(arr[i] % 3 == 0) {%>
			<%=arr[i] %>
			<br/>
		<%} %>
	<%} %>
	
</body>
</html>