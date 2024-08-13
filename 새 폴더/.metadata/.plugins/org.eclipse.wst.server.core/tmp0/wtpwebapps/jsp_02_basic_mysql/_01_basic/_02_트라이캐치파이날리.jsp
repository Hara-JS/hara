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
			
			try{}catch(Exception e){}finally{}
			
			
			finally{} 를 추가 옵션으로 적용해줄수있다. 
			
			finally{} 는 무조건실행되며, 반드시 해야되는 작업은 finally 에 작성하면좋다. 

	 --%>

<%	
		System.out.println("시작");		
		try{
			
			int a = 10 / 0; // 나누기 0 을 하면 에러가 발생된다. 
			
		}catch(Exception e){
			
			e.printStackTrace(); // 에러의 종류를 출력해준다.
		}finally{
			System.out.println("무조건실행");
		}

		System.out.println("여기가 실행되니?");
	%>
</body>
</html>