<%@page import="java.time.Duration"%>
<%@page import="java.time.Period"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>
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
		// https://developer-talk.tistory.com/643
		
		// 시간 저장하기
	    LocalDateTime localDateTime = LocalDateTime.of(2020, 8, 1, 14, 30, 55);
	    System.out.println("localDateTime.toLocalDate() 년-월-일");
	    System.out.println(localDateTime.toLocalDate());		// 2020-08-01

	    System.out.println("\nlocalDateTime.toLocalTime() 시:분:초");
	    System.out.println(localDateTime.toLocalTime());		// 14:30:55
	

	    // 두 날짜 사이 기간(년-월-일) 구하기
	    LocalDateTime startDT = LocalDateTime.of(2019, 11, 10, 18, 40, 25);
	    LocalDateTime endDT = LocalDateTime.of(2021, 8, 1, 14, 30, 55);
	    System.out.println("시작일: " + startDT.toLocalDate());	// 2019-11-10
	    System.out.println("종료일: " + endDT.toLocalDate());		// 2021-08-01
		// 년-월-일 만 측정 가능
	    Period diff = Period.between(startDT.toLocalDate(), endDT.toLocalDate());
	    System.out.printf("두 날짜 사이 기간: %d년 %d월 %d일\n",
	            diff.getYears(), diff.getMonths(), diff.getDays());
	    
	 	// 두 날짜 사이 시간(시:분:초) 구하기
	    LocalDateTime startDT2 = LocalDateTime.of(2019, 11, 10, 10, 40, 25);
	    LocalDateTime endDT2 = LocalDateTime.of(2021, 8, 1, 14, 30, 55);
	    System.out.println("시작시간: " + startDT2.toLocalTime());
	    System.out.println("종료시간: " + endDT2.toLocalTime());
		
	    Duration diff2 = Duration.between(startDT2.toLocalTime(), endDT2.toLocalTime());

	    System.out.printf("시간: %d, 분: %d, 초: %d",
   		diff2.toHours(), diff2.toMinutes(), diff2.getSeconds());
	%>
</body>
</html>