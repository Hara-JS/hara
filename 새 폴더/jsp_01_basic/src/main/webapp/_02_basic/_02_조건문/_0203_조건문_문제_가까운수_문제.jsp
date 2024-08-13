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
		        a는 0  ~ 9  사이의 랜덤 숫자를 저장한다.
		        c는 11 ~ 20 사이의 랜덤 숫자를 저장한다. 
		        a 와 c 중 어떤 숫자가 b 와 더 가까운지 출력하시오.
		    
		        [1] a가 b보다 가까우면 "a가 가깝다."
		        [2] c가 a보다 가까우면 "c가 가깝다."
		        [3] 서로 거리가 같으면 "서로 같다."
		*/
		int b = 10;
	    
	    int a = 0;
	    int c = 0;
	 
	    Random ran = new Random();
	    
	%>
</body>
</html>