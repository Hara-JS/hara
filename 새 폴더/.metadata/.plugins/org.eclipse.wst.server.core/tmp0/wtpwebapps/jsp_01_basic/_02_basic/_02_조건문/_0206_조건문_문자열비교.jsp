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
			[문자열비교]
					
				지금까지 문자열비교에서는 == 을사용했지만, 
				이후 문자열비교는 compareTo 를 사용해야한다. 
				
				[1] a.compareTo(b) == 0 은 서로 같다를 뜻하고
				[2] a.compareTo(b) != 0 은 서로 다르다를 뜻한다. 
				
				지금까지 문자열비교에서는 == 을사용했지만, 
				이후 문자열비교는 compareTo 를 사용해야한다. 
				
				[1] a.equals(b) == true 은 서로 같다를 뜻하고
				[2] a.equals(b) == false 은 서로 다르다를 뜻한다. 
				
				
				[1] a.equals(b) 의  "== true" 부분은 생략 가능하다 false는 생략 못한다. 
		*/
		
		String a = "aaaa";
		String b = "bbbb";
		
		String a1 = "aaaa";
		String b1 = "aaaa";
			
		String a2 = "aaaa";
		String b2 = "aaaa";
	%>
		<% if(a.compareTo(b) == 0){%>
			서로같다.
		<% }else{%>
			서로다르다.
		<%} %>
		
		
		<% if(a1.equals(b1) == true){%>
			서로같다.
		<% }else{%>
			서로다르다.
		<%} %>
		
		<% if(a2.equals(b2)){%>
			서로같다.
		<% }else{%>
			서로다르다.
		<%} %>
	
</body>
</html>