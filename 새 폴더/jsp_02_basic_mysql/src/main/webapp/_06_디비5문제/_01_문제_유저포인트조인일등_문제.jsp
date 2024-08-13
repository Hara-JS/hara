

<%@page import="java.util.Arrays"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
				String[][] userList = { 
					{"1001","김철수"},
					{"1002","이만수"},
					{"1003","이영희"}
				};
	
				int[][] pointList = {
					{1001, 1},
					{1002, 3},
					{1001, 4},
					{1003, 2},
					{1003, 2}
				};
				
				
				    userList는 회원들의 정보이다. 
				    첫번째값은 회원번호이고, 두번째 값은 이름이다.
				    
				    pointList는 회원들의 점수 기록표이다. 
				    첫번째 값은 회원번호이고, 두번째 값은 포인트이다.
				    여러번 누적된 회원들도있다. 
				    
				[문제]
				    회원별로 포인트를 전부 더해서           
				    포인트 점수가 가장높은 회원의 점수와 이름을 구하시오.
				
				[정답]
				    5 김철수    
			*/
		
			
			
		%>
		
</body>
</html>