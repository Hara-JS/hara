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
				student배열은 이번 학기 중간고사 성적이다.
				가로 한 줄을 기준으로 맨 앞은 번호이고, 뒤에 숫자 3개는
				각각 국어, 수학, 영어 점수이다. 
		*/
		/*
			[학생정보]
				int[][] student = {
				    {1001, 100, 20, 32},         // 152
				    {1002,  40, 43, 12},         // 95
				    {1003,  60, 21, 42},         // 123
				    {1004,  76, 54, 55},         // 185
				    {1005,  23, 11, 76}          // 110
				};	

			위와같은 데이터의 디비를 생성해보자.
		
			[문제]
				국어점수가 영어점수보다 높은학생의 번호 , 국어 , 영어점수를 출력하시오.
			[정답]
				번호	국어	영어
				1001	100	32
				1002	40	12
				1003	60	42
				1004	76	55
		*/
		
	%>
		
</body>
</html>