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
			지금까지는 다 존재하는 회원을 검색했지만 없는 회원을 검색해보겠다. 
			번호가 2001 인회원의 모든데이터를  검색하시오.
			
			실행해보면 에러가 발생된다. 
			이를 예외처리하기위해서는 다음단원에서 해결한다. 
		*/
		
	
		Connection conn = null;	
		PreparedStatement pstmt = null;	
		ResultSet rs = null;
		
		
		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/jsp_db2?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			
			String sql = "SELECT * FROM member where number='2001' ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(); 
			
			// 데이터가없을때는 에러가 발생한다. (다음장에서 조건문으로 해결한다. )
			rs.next(); // java.sql.SQLException: Illegal operation on empty result set.
			System.out.println(rs.getInt(1) + " ");
			System.out.print(rs.getString(2) + " ");
			System.out.print(rs.getString(3) + " ");
			System.out.print(rs.getString(4) + " ");
			
			
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