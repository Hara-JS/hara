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
		        3~6 사이의 랜덤 숫자 하나를 저장하고 
		        그 숫자만큼 아래와 같은 규칙으로 출력하시오.
		        단, 일차 반복문 과 이차 반복문으로 출력하시오.
		        
		    [예시]
		        r = 6
		    [출력]
		        18 12 6
		        17 11 5
		        16 10 4
		        15 9 3
		        14 8 2
		        13 7 1    
		    
		    [예시]
		        r = 4
		    [출력]
		        12 8 4
		        11 7 3
		        10 6 2
		        9 5 1
		*/
	%>
	
	<%
		Random ran = new Random();
		int r = ran.nextInt(4) + 3;
		
	    int a = r * 3;
	%>
		r = <%= a %> <br />
	<%
	    for(int i = 0; i < r; i++) {
	        int b = a;
	        for(int j = 0; j < 3; j++){
	 %>
	        	<%= b %> 
	 <%
	            b -= r;
	        }
	        a -= 1;
	 %>
	        <br />
	 <% } %>
</body>
</html>












