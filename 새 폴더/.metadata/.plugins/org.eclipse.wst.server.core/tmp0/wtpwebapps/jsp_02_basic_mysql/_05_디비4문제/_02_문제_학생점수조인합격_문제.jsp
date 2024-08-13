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
			student 배열은 순서대로 ["학생번호", "이름", "성별"] 의 데이터 이고, 
			score 배열은 순서대로 ["학생번호", "국어", "수학"] 의 데이터이다.
			
			String[][] student = {	
					{"1001", "이만수", "남"},
					{"1002", "이영희", "여"},
					{"1003", "김민정", "여"},
					{"1004", "이철민", "남"},
					{"1005", "오만석", "남"},
					{"1006", "최이슬", "여"}
				};
				
				int[][] score = {		
					{1001 , 10, 20},
					{1002 , 70, 30},
					{1003 , 64, 65},
					{1004 , 64, 87},
					{1005 , 64, 80},
					{1006 , 14, 90}
				};
		*/
		/*
			[문제] 
				평균이 60점이상이면 합격이다.
				합격생들의 번호, 이름, 점수를 출력하시오.
			[정답]

				번호	이름	총합
				1003	김민정	64
				1004	이철민	75
				1005	오만석	72

		*/
				
		
			
		%>
		
		
		
		
</body>
</html>