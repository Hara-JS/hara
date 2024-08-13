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
			[문제]
				아이디가 abcd 이고 비밀번호가 1234 인 데이터의 번호와 이름만 출력하시오.
			[정답]
				1002 박대길
				
			
		*/
		
		/*
			? 가 여러개면 ?순서대로 차례대로 변수값을 넣어주면된다. 
		
			String sql = "SELECT number , name FROM member where id=? AND pw=?";
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
		*/
		
		
		String id = "abcd";
		String pw = "1234";
	
		Connection conn = null;
	
		PreparedStatement pstmt = null;
	
		ResultSet rs = null;
		
		
		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/jsp_db2?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			
			String sql = "SELECT number , name FROM member where id=? AND pw=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery(); 
			if(rs.next()){
				
				System.out.println(rs.getString(1) + " " + rs.getString(2)); 
			}
			
			
		
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			// [중요] db 사용후엔 반드시 닫아줘야한다. 
			
			if(conn != null){
				conn.close();			
			}
			if(pstmt != null){
				pstmt.close();	
			}
			if(rs != null){
				rs.close();
			}
		}
	%>
</body>
</html>