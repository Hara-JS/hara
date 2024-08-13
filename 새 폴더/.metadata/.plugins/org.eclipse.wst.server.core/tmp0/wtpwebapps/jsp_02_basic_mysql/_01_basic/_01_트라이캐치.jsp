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
	<%--
			
			try{}catch(Exception e){}
					
			우리가 프로그램을 작성하다가 에러가 발생되면 프로그램은 그즉시 종료된다. 
			
			웹같은 경우는 사소한 문제로 프로그램이 에러가 발생이되도 멈추면안되는 경우가 있다. 
			
			예를들어 네이버같은 큰 사이트가 '뉴스'란에 문제가 생겼을경우  '뉴스'만 접속이 안되야되는데, 
			모든 기능이 멈춰버린다면, 큰손해가 발생할것이다. 
			
			
			트라이 캐치는 어떤에러가 발생했을때 프로그램이 멈추지않게 해주는 기능이다.
			
			그래서 식을 try{} 중괄호 안에 작성한다. 
	 --%>

<%	
		System.out.println("시작");		
		try{
			
			int a = 10 / 0; // 나누기 0 을 하면 에러가 발생된다. 
			
		}catch(Exception e){
			
			e.printStackTrace(); // 에러의 종류를 출력해준다. // 주석처리하면 에러가 발생해도 아무런 메세지를 출력하지않는다.
		}

		System.out.println("여기가 실행되니?");
	%>
</body>
</html>